output "id" {
  description = "https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/project#id"
  value       = mongodbatlas_project.this.id
}

output "standard_srv" {
  description = "mongo uri endpoint"
  value       = mongodbatlas_cluster.this.connection_strings[0].standard_srv
}
# Example return string: standard_srv = "mongodb+srv://cluster-atlas.ygo1m.mongodb.net"

output "password" {
  description = "https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password"
  value       = random_password.this.result
  sensitive   = true
}

output "mongo_read_only_password" {
  description = "https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password"
  value       = random_password.read_only.result
  sensitive   = true
}

output "cluster_connection_string" {
  description = "trimmed down mongo uri endpoint"
  value       = split("//", mongodbatlas_cluster.this.connection_strings[0].standard_srv)[1]
}

output "project_id" {
  description = "https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/project#id"
  value       = mongodbatlas_project.this.id
}

output "snapshot_restore_job_id" {
  description = "https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/cloud_backup_snapshot_restore_job#finished_at"
  value       = var.enable_ephemeral_restore_latest ? mongodbatlas_cloud_backup_snapshot_restore_job.mongodbatlas_cloud_backup_snapshot_restore_job[0].snapshot_restore_job_id : null
}
