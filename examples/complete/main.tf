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
  enable_mongo_snapshot = true
  target_project_id     = "123456789"
  target_cluster_name   = "clustername"

  cluster snapshot restore
  enable_cluster_restore = true
  restore_snapshot_id    = "123456789"
  */
}
