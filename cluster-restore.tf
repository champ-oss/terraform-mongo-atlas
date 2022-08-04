resource "mongodbatlas_cloud_backup_snapshot_restore_job" "restore" {
  count        = var.enable_cluster_restore && var.restore_snapshot_id != null ? 1 : 0
  project_id   = mongodbatlas_cloud_backup_snapshot.this[0].project_id
  cluster_name = mongodbatlas_cloud_backup_snapshot.this[0].cluster_name
  snapshot_id  = var.restore_snapshot_id
  delivery_type {
    automated           = true
    target_cluster_name = mongodbatlas_cloud_backup_snapshot.this[0].cluster_name
    target_project_id   = mongodbatlas_cloud_backup_snapshot.this[0].project_id
  }
}
