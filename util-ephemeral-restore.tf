resource "mongodbatlas_cloud_backup_snapshot_restore_job" "ephemeral_restore" {
  count        = var.enable_ephemeral_restore && var.source_snapshot_id != null && var.source_project_id != null && var.source_cluster_name != null ? 1 : 0
  project_id   = var.source_project_id
  cluster_name = var.source_cluster_name
  snapshot_id  = var.source_snapshot_id
  delivery_type_config {
    automated           = true
    target_cluster_name = mongodbatlas_cluster.this.name
    target_project_id   = mongodbatlas_cluster.this.project_id
  }
  depends_on = [mongodbatlas_cluster.this]
}
