locals {
  static_values = flatten([for k, v in var.static_hosts :
    flatten([for t, l in v :
      flatten([for i in l :
        {
          "project" = k,
          "type"    = t,
          "ip"      = i
      }])
    ])
  ])
  unq_env = toset(distinct([for resources in local.static_values : resources.project]))

}

resource "boundary_host_catalog_static" "this" {
  for_each    = local.unq_env
  name        = "${each.key}-static"
  description = "Static Hosts Catalog for ${each.key}"
  scope_id    = lookup(var.projects, each.key).id
}

resource "boundary_host_static" "this" {
  for_each        = { for unq in local.static_values : unq.ip => unq }
  name            = "${each.value.project}-${each.value.type}-${each.key}"
  description     = "${each.value.project}-${each.value.type}-${each.key} host"
  address         = each.key
  host_catalog_id = boundary_host_catalog_static.this[each.value.project].id
}

resource "boundary_host_set_static" "this" {
  for_each = { for idx, record in flatten([for k, v in var.static_hosts :
    flatten([for i, j in v :
      {
        "project" = k,
        "type"    = i,
        "ip"      = j
    }])
  ]) : idx => record }
  name            = each.value.type
  host_catalog_id = boundary_host_catalog_static.this[each.value.project].id
  host_ids        = [for i in each.value.ip : boundary_host_static.this[i].id]
}

resource "boundary_target" "this" {
  for_each     = var.targets
  name         = each.value.name
  description  = "Target for ${each.value.name}"
  type         = each.value.type
  default_port = each.value.port
  scope_id     = lookup(var.projects, each.value.project).id
  host_source_ids = [
    for i in boundary_host_set_static.this : i.id if contains(each.value.ss-name, i.name)
  ]

  injected_application_credential_source_ids = [
    for i in boundary_credential_library_vault.this : i.id if contains(each.value.inj_cred_lib, i.name)
  ]
  brokered_credential_source_ids = [
    for i in boundary_credential_library_vault.this : i.id if contains(each.value.brk_cred_lib, i.name)
  ]

  worker_filter = "\"${each.value.worker_name}\" in \"/tags/name\""
}
