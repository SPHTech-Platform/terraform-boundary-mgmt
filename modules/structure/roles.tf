# Creates a role in the global scope that's granting administrative access to
# resources in the org scope for respective groups
resource "boundary_role" "org_admin" {
  name           = "${var.org_name}-org-role"
  scope_id       = "global"
  grant_scope_id = boundary_scope.org.id
  grant_strings = [
    "id=*;type=*;actions=read"
  ]

  principal_ids = concat(
    [for group in var.group_name : lookup(var.m_groups, group).id],
  )
}

resource "boundary_role" "proj_admin" {
  for_each = toset(var.project_names)

  name           = "${var.org_name}-${each.key}-role"
  scope_id       = boundary_scope.org.id
  grant_scope_id = boundary_scope.projects[each.key].id
  grant_strings = [
    "id=*;type=target;actions=read,authorize-session",
    "id=*;type=target;actions=list,no-op",
    "id=*;type=auth-token;actions=list,read:self,delete:self",
  ]

  principal_ids = concat(
    [for group in var.group_name : lookup(var.m_groups, group).id],
  )
}
