resource "mongodbatlas_cluster" "this" {
  project_id = mongodbatlas_project.this.id
  name       = var.cluster_name

  # Provider Settings "block"
  # setting backing provider name to null as it's not available for provider_instance_size_name >= M10
  provider_name               = var.provider_name == "" ? "TENANT" : var.provider_name
  backing_provider_name       = var.provider_name == "" ? "AWS" : null
  provider_region_name        = var.mongo_region
  provider_instance_size_name = var.provider_instance_size_name
  mongo_db_major_version      = var.mongo_db_major_version
  cluster_type                = var.cluster_type

  # use replication specs for provider_instance_size_name >= M10
  dynamic "replication_specs" {
    for_each = var.replication_specs != null ? var.replication_specs : []
    content {
      num_shards = replication_specs.value.num_shards
      zone_name  = replication_specs.value.zone_name
      regions_config {
        region_name     = replication_specs.value.region_name
        electable_nodes = replication_specs.value.electable_nodes
        priority        = replication_specs.value.priority
        read_only_nodes = replication_specs.value.read_only_nodes
      }
    }
  }

  # configurable for provider_instance_size_name >= M10
  cloud_backup                 = var.cloud_backup
  auto_scaling_disk_gb_enabled = var.auto_scaling_disk_gb_enabled
  disk_size_gb                 = var.disk_size_gb

  lifecycle {
    prevent_destroy = true
    ignore_changes = [
      provider_instance_size_name,
      mongo_db_major_version
      # https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/cluster#provider_instance_size_name
    ]
  }
}

