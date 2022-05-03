locals {
  git = "terraform-mongo-atlas"
}

module "this" {
  source       = "../../"
  project_name = "project-example"
  git          = local.git
  org_id       = var.org_id
  cluster_name = "cluster-name"
  existing_teams = {
    "1234567890a2c3e4g5i6k7m8" : {
      role_names : ["GROUP_READ_ONLY", "GROUP_DATA_ACCESS_READ_ONLY"]
    },
    "1234567890a2c3e4g5i6k7m8" : {
      role_names : ["GROUP_READ_ONLY", "GROUP_DATA_ACCESS_READ_WRITE"]
    }
  }
}
