resource "mongodbatlas_cluster" "this" {
  project_id = mongodbatlas_project.this.id
  name       = var.cluster_name

  # Provider Settings "block"
  provider_name               = "TENANT"
  backing_provider_name       = "AWS"
  provider_region_name        = "US_EAST_1"
  provider_instance_size_name = var.provider_instance_size_name
  mongo_db_major_version      = var.mongo_db_major_version

  lifecycle {
    prevent_destroy = true
    ignore_changes = [
      provider_instance_size_name,
      mongo_db_major_version
      # https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/cluster#provider_instance_size_name
    ]
  }
}