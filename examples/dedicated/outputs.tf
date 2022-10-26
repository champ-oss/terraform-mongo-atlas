output "password" {
  description = "https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password"
  value       = module.this.password
  sensitive   = true
}

output "standard_srv" {
  description = "mongo endpoint uri"
  value       = module.this.standard_srv
}

output "cluster_connection_sting" {
  description = "trimmed down mongo uri"
  value       = module.this.cluster_connection_string
}

output "project_id" {
  description = "https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/project#id"
  value       = module.this.project_id
}
