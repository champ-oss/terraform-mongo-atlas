resource "mongodbatlas_cluster" "this" {
  count      = var.create_dedicated_cluster ? 0 : 1
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

resource "mongodbatlas_cluster" "dedicated" {
  count      = var.create_dedicated_cluster ? 1 : 0
  project_id = mongodbatlas_project.this.id
  name       = "${var.cluster_name}-dedicated"

  cluster_type = var.cluster_type
  replication_specs {
    num_shards = 1
    regions_config {
      region_name     = "US_EAST_2"
      electable_nodes = 3
      priority        = 7
      read_only_nodes = 0
    }
  }

  cloud_backup                 = var.cloud_backup
  auto_scaling_disk_gb_enabled = var.auto_scaling_disk_gb_enabled
  mongo_db_major_version       = var.mongo_db_major_version

  # Provider Settings "block"
  provider_name               = "AWS"
  disk_size_gb                = var.disk_size_gb
  provider_instance_size_name = var.provider_instance_size_name

  lifecycle {
    prevent_destroy = true
    ignore_changes = [
      provider_instance_size_name,
      mongo_db_major_version
      # https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/cluster#provider_instance_size_name
    ]
  }
}
