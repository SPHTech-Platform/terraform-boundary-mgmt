resource "boundary_scope" "org" {
  scope_id                 = "global"
  name                     = var.org_name
  description              = "Organization scope for ${var.org_name}"
  auto_create_admin_role   = true
  auto_create_default_role = true
}

// create project
resource "boundary_scope" "projects" {
  for_each                 = toset(var.project_names)
  name                     = each.key
  description              = "Project for ${each.key}"
  scope_id                 = boundary_scope.org.id
  auto_create_admin_role   = true
  auto_create_default_role = true
}
