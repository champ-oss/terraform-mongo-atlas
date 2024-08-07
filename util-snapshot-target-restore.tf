resource "mongodbatlas_cloud_backup_snapshot" "snapshot_target_restore" {
  count             = var.enabled && var.enable_snapshot_target_restore ? 1 : 0
  project_id        = mongodbatlas_cluster.this[0].project_id
  cluster_name      = mongodbatlas_cluster.this[0].name
  description       = "terraform managed cloud backup snapshot and restore"
  retention_in_days = 1
}

resource "mongodbatlas_cloud_backup_snapshot_restore_job" "snapshot_target_restore" {
  count        = var.enabled && var.enable_snapshot_target_restore && var.target_cluster_name != null && var.target_project_id != null ? 1 : 0
  project_id   = mongodbatlas_cloud_backup_snapshot.snapshot_target_restore[0].project_id
  cluster_name = mongodbatlas_cloud_backup_snapshot.snapshot_target_restore[0].cluster_name
  snapshot_id  = mongodbatlas_cloud_backup_snapshot.snapshot_target_restore[0].snapshot_id

  delivery_type_config {
    automated           = true
    target_cluster_name = var.target_cluster_name
    target_project_id   = var.target_project_id
  }
  depends_on = [mongodbatlas_cloud_backup_snapshot.snapshot_target_restore]
}
