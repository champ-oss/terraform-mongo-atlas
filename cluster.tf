resource "mongodbatlas_cluster" "this" {
  count      = var.create_free_cluster ? 1 : 0
  project_id = mongodbatlas_project.this.id
  name       = var.cluster_name

  # Provider Settings "block"
  provider_name               = local.provider_name
  backing_provider_name       = local.backing_provider_name
  provider_region_name        = var.create_free_cluster ? "US_EAST_1" : var.mongo_region
  provider_instance_size_name = var.create_free_cluster ? "M0" : var.provider_instance_size_name
  mongo_db_major_version      = var.mongo_db_major_version
  cluster_type                = var.cluster_type

  replication_specs {
    num_shards = 1
    regions_config {
      region_name     = var.create_free_cluster ? "US_EAST_1" : var.mongo_region
      electable_nodes = 3
      priority        = 7
      read_only_nodes = 0
    }
  }

  cloud_backup                 = var.create_free_cluster ? false : var.cloud_backup
  auto_scaling_disk_gb_enabled = var.create_free_cluster ? false : var.auto_scaling_disk_gb_enabled
  disk_size_gb                 = var.create_free_cluster ? null : var.disk_size_gb

  lifecycle {
    prevent_destroy = true
    ignore_changes = [
      provider_instance_size_name,
      mongo_db_major_version
      # https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/cluster#provider_instance_size_name
    ]
  }
}
