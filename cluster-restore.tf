resource "mongodbatlas_cloud_backup_snapshot_restore_job" "restore" {
  count        = var.enable_cluster_restore && var.restore_project_id != null && var.restore_cluster_name != null && var.restore_snapshot_id != null ? 1 : 0
  project_id   = var.restore_project_id
  cluster_name = var.restore_cluster_name
  snapshot_id  = var.restore_snapshot_id
  delivery_type {
    automated           = true
    target_cluster_name = var.restore_cluster_name
    target_project_id   = var.restore_project_id
  }
}
