resource "mongodbatlas_cloud_backup_snapshot" "this" {
  count             = var.enable_mongo_snapshot ? 1 : 0
  project_id        = mongodbatlas_cluster.this.project_id
  cluster_name      = mongodbatlas_cluster.this.name
  description       = "atlas cluster snapshot"
  retention_in_days = 1
}

resource "mongodbatlas_cloud_backup_snapshot_restore_job" "this" {
  count        = var.enable_mongo_snapshot && var.target_cluster_name != null && var.target_project_id != null ? 1 : 0
  project_id   = mongodbatlas_cloud_backup_snapshot.this[0].project_id
  cluster_name = mongodbatlas_cloud_backup_snapshot.this[0].cluster_name
  snapshot_id  = mongodbatlas_cloud_backup_snapshot.this[0].snapshot_id

  delivery_type_config {
    automated           = true
    target_cluster_name = var.target_cluster_name
    target_project_id   = var.target_project_id
  }
  depends_on = [mongodbatlas_cloud_backup_snapshot.this]
}
