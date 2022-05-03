locals {
  git = "terraform-mongo-atlas"
}

module "this" {
  source       = "../../"
  project_name = "project-example"
  git          = local.git
  org_id       = var.org_id
  cluster_name = "cluster-name"
  component    = "component-team"
}
