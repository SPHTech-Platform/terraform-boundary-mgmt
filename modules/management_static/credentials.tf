resource "boundary_credential_store_static" "this" {
  for_each    = var.credential_store_static
  name        = "${each.value.name}-static-credential-store"
  description = "${each.key} scoped static credential store"
  scope_id    = lookup(var.projects, each.key).id
}
