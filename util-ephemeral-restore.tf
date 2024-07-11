data "mongodbatlas_clusters" "ephemeral_restore" {
  count      = var.enabled && var.enable_ephemeral_restore && var.source_project_id != null ? 1 : 0
  project_id = var.source_project_id
}

resource "mongodbatlas_cloud_backup_snapshot_restore_job" "ephemeral_restore" {
  count        = var.enabled && var.enable_ephemeral_restore && var.source_snapshot_id != null ? 1 : 0
  project_id   = data.mongodbatlas_clusters.ephemeral_restore[0].project_id
  cluster_name = data.mongodbatlas_clusters.ephemeral_restore[0].results[0].name
  snapshot_id  = var.source_snapshot_id
  delivery_type_config {
    automated           = true
    target_cluster_name = mongodbatlas_cluster.this[0].name
    target_project_id   = mongodbatlas_cluster.this[0].project_id
  }
  depends_on = [mongodbatlas_cluster.this]
}
