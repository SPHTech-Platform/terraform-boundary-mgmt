module "example_base" {
  source = "../modules/structure"
  # version       = "~> 0.1.7"
  m_groups      = { "group1" = { "id" = "123" } }
  org_name      = "example"
  group_name    = ["group1"]
  project_names = ["dev", "stage", "prod"]
}
