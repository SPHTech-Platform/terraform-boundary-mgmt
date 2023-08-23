module "example" {
  source = "../modules/management"
  # version  = "~> 0.1.7"
  projects = { "dev" = { "id" = "123" } }
  static_hosts = {
    "dev" = {
      "database" = ["rds-aurora-example-example-dev.cluster-123.ap-southeast-1.rds.amazonaws.com"]
    },
  }
  targets = {
    "1" = {
      "name"         = "database"
      "type"         = "tcp"
      "port"         = 3368
      "ss-name"      = ["database"]
      "brk_cred_lib" = ["dev-database-example-cred-lib"]
      "inj_cred_lib" = [""]
      "worker_name"  = "example"
      "project"      = "dev"
    },
  }


  credential_store_vault = {
    "dev" = {
      "namespace" = "admin/engr/example/dev"
    },
  }

  credential_lib_vault = {
    "1" = {
      "project" = "dev"
      "path"    = "example/db/creds/example",
      "type"    = "username_password",
      "name"    = "dev-database-example-cred-lib",
    }
  }
}
