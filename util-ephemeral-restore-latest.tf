data "mongodbatlas_clusters" "ephemeral_restore_latest" {
  count      = var.enable_ephemeral_restore_latest && var.source_project_id != null ? 1 : 0
  project_id = var.source_project_id
}

data "mongodbatlas_cloud_backup_snapshots" "ephemeral_restore_latest" {
  count          = var.enable_ephemeral_restore_latest ? 1 : 0
  project_id     = data.mongodbatlas_clusters.ephemeral_restore_latest[0].project_id
  cluster_name   = data.mongodbatlas_clusters.ephemeral_restore_latest[0].results[0].name
  page_num       = 1
  items_per_page = 1
}

resource "mongodbatlas_cloud_backup_snapshot_restore_job" "mongodbatlas_cloud_backup_snapshot_restore_job" {
  count        = var.enable_ephemeral_restore_latest ? 1 : 0
  project_id   = data.mongodbatlas_cloud_backup_snapshots.ephemeral_restore_latest[0].project_id
  cluster_name = data.mongodbatlas_cloud_backup_snapshots.ephemeral_restore_latest[0].cluster_name
  snapshot_id  = data.mongodbatlas_cloud_backup_snapshots.ephemeral_restore_latest[0].results[0].id
  delivery_type_config {
    automated           = true
    target_cluster_name = mongodbatlas_cluster.this.name
    target_project_id   = mongodbatlas_cluster.this.project_id
  }
  depends_on = [mongodbatlas_cluster.this]
}

resource "null_resource" "exec_mongo-restore-job-status-check" {
  count = var.enable_ephemeral_restore_latest ? 1 : 0
  provisioner "local-exec" {

    command     = "sleep 45 && chmod +x ${path.module}/mongo-restore-job-api.py;pip3 install retry;python ${path.module}/mongo-restore-job-api.py"
    interpreter = ["bash", "-c"]
    environment = {
      MONGODB_ATLAS_GROUP_ID       = mongodbatlas_cloud_backup_snapshot_restore_job.mongodbatlas_cloud_backup_snapshot_restore_job[0].project_id
      MONGODB_ATLAS_CLUSTER_NAME   = mongodbatlas_cloud_backup_snapshot_restore_job.mongodbatlas_cloud_backup_snapshot_restore_job[0].cluster_name
      MONGODB_ATLAS_RESTORE_JOB_ID = mongodbatlas_cloud_backup_snapshot_restore_job.mongodbatlas_cloud_backup_snapshot_restore_job[0].snapshot_restore_job_id
    }
  }
  depends_on = [mongodbatlas_cloud_backup_snapshot_restore_job.mongodbatlas_cloud_backup_snapshot_restore_job]
}
