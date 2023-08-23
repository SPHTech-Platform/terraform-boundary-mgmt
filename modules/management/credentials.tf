resource "vault_policy" "boundary_controller" {
  for_each = var.credential_store_vault
  name     = "boundary_controller"
  policy   = <<EOF
  path "auth/token/lookup-self" {
  capabilities = ["read"]
  }
  path "auth/token/renew-self" {
  capabilities = ["update"]
  }
  path "auth/token/revoke-self" {
  capabilities = ["update"]
  }
  path "sys/leases/renew" {
  capabilities = ["update"]
  }
  path "sys/leases/revoke" {
  capabilities = ["update"]
  }
  path "sys/capabilities-self" {
  capabilities = ["update"]
  }
  EOF
}

resource "vault_policy" "admin_read" {
  for_each = var.credential_store_vault
  name     = "admin-read"
  policy   = <<EOF
  path "*" {
    capabilities = ["read"]
  }
  EOF
}


resource "vault_token" "boundary" {
  for_each          = var.credential_store_vault
  policies          = [vault_policy.boundary_controller[each.key].name, vault_policy.admin_read[each.key].name]
  no_parent         = true
  no_default_policy = true
  renewable         = true
  ttl               = "20m"
  period            = "20m"

  metadata = {
    "purpose" = "boundary-service-account"
  }
}


resource "boundary_credential_store_vault" "this" {
  for_each    = var.credential_store_vault
  name        = "${each.key}-vault-credential-store"
  description = "${each.key}-vault-credential-store"
  address     = var.vault_pub_url
  token       = vault_token.boundary[each.key].client_token
  #scope_id    = boundary_scope.projects[each.key].id
  scope_id  = lookup(var.projects, each.key).id
  namespace = each.value.namespace
}


resource "boundary_credential_library_vault" "this" {
  for_each            = var.credential_lib ? var.credential_lib : {}
  name                = each.value.name
  description         = each.value.name
  credential_store_id = boundary_credential_store_vault.this[each.value.project].id
  path                = each.value.path
  credential_type     = each.value.type
  http_method         = "GET"
}
