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

output "cluster_connection_string" {
  description = "trimmed down mongo uri endpoint"
  value       = split("//", mongodbatlas_cluster.this.connection_strings[0].standard_srv)[1]
}

output "project_id" {
  description = "https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/project#id"
  value       = mongodbatlas_project.this.id
}

output "mongo_restore_finished_at_time" {
  description = "https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/cloud_backup_snapshot_restore_job#finished_at"
  value       = var.enable_ephemeral_restore_latest ? data.mongodbatlas_cloud_backup_snapshot_restore_jobs.ephemeral_restore_latest[0].finished_at : null
}
