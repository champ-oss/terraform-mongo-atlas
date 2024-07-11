resource "mongodbatlas_cloud_backup_snapshot_restore_job" "restore" {
  count        = var.enabled && var.enable_cluster_restore && var.source_snapshot_id != null ? 1 : 0
  project_id   = mongodbatlas_cluster.this[0].project_id
  cluster_name = mongodbatlas_cluster.this[0].name
  snapshot_id  = var.source_snapshot_id
  delivery_type_config {
    automated           = true
    target_cluster_name = mongodbatlas_cluster.this[0].name
    target_project_id   = mongodbatlas_cluster.this[0].project_id
  }
}
