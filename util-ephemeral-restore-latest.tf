data "mongodbatlas_clusters" "this" {
  count      = var.enable_ephemeral_restore_latest && var.source_project_id != null ? 1 : 0
  project_id = var.source_project_id // To get dependency.
}

data "mongodbatlas_cloud_backup_snapshots" "this" {
  count          = var.enable_ephemeral_restore_latest ? 1 : 0
  project_id     = data.mongodbatlas_clusters.this[0].project_id
  cluster_name   = data.mongodbatlas_clusters.this[0].results.name
  page_num       = 1
  items_per_page = 1
}

resource "mongodbatlas_cloud_backup_snapshot_restore_job" "ephemeral_restore_latest" {
  count        = var.enable_ephemeral_restore_latest ? 1 : 0
  project_id   = data.mongodbatlas_cloud_backup_snapshots.this[0].project_id
  cluster_name = data.mongodbatlas_cloud_backup_snapshots.this[0].cluster_name
  snapshot_id  = data.mongodbatlas_cloud_backup_snapshots.this[0].results.snapshot_ids
  delivery_type_config {
    automated           = true
    target_cluster_name = mongodbatlas_cluster.this.name
    target_project_id   = mongodbatlas_cluster.this.project_id
  }
  depends_on = [mongodbatlas_cluster.this]
}
