resource "mongodbatlas_cluster" "this" {
  count      = var.create_dedicated_cluster ? 0 : 1
  project_id = mongodbatlas_project.this.id
  name       = var.cluster_name

  # Provider Settings "block"
  provider_name               = "AWS"
  provider_region_name        = var.mongo_region
  provider_instance_size_name = var.provider_instance_size_name
  mongo_db_major_version      = var.mongo_db_major_version

  replication_specs {
    num_shards = 1
    regions_config {
      region_name     = var.mongo_region
      electable_nodes = 3
      priority        = 7
      read_only_nodes = 0
    }
  }

  cloud_backup                 = var.cloud_backup
  auto_scaling_disk_gb_enabled = var.auto_scaling_disk_gb_enabled


  lifecycle {
    prevent_destroy = true
    ignore_changes = [
      provider_instance_size_name,
      mongo_db_major_version
      # https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/cluster#provider_instance_size_name
    ]
  }
}
