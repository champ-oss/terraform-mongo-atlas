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

  /* create snapshot from source to target
  enable_ephemeral_restore = true
  target_project_id     = "123456789"

  cluster snapshot restore
  enable_cluster_restore = true
  snapshot_id            = "123456789"
  */
}
