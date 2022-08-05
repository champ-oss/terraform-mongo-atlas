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

  /* update current cluster with certain snapshot id
  enable_cluster_restore = true
  snapshot_id            = "12344"

  update new env with certain snapshot id from another project
  enable_ephemeral_restore = true
  source_backup_project_id = "12345"
  source_snapshot_id       = "1234"

  update new env with latest snapshot id from project
  enable_ephemeral_restore_latest = true
  source_backup_latest_project_id = "12345"

  create snapshot and restore on target project
  enable_snapshot_target_restore = true
  target_project_id              = "12345"
  */
}
