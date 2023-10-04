locals {
  git = "terraform-mongo-atlas"
}

module "this" {
  source                      = "../../"
  project_name                = "mongo-example"
  git                         = local.git
  org_id                      = var.mongo_atlas_org
  cluster_name                = "${local.git}-cluster"
  provider_instance_size_name = "M10"
  replication_specs = [
    {
      num_shards : 1,
      zone_name : "ZONE 2 managed by terraform",
      region_name : "US_EAST_2",
      electable_nodes : 3,
      priority : 7,
      read_only_nodes : 0
    }
  ]

  disk_size_gb                                    = 10
  cloud_backup                                    = true
  provider_name                                   = "AWS"
  mongo_region                                    = "US_EAST_2"
  provider_auto_scaling_compute_min_instance_size = "M10"
  provider_auto_scaling_compute_max_instance_size = "M30"

  /*
  replication specs not available with free tier, example below
  replication_specs = [{
    num_shards : 1,
    zone_name: "ZONE 2 managed by terraform",
    region_name : "US_EAST_2",
    electable_nodes : 3,
    priority : 7,
    read_only_nodes : 0
  }]
  following key:value not available with free tier, dedicated example below
  disk_size_gb                 = 10
  cloud_backup                 = true
  auto_scaling_disk_gb_enabled = false

  provider_instance_size_name   = "M10"
  provider_name                 = "AWS"
  mongo_region                  = "US_EAST_2"

  update current cluster with certain snapshot id
  enable_cluster_restore = true
  source_snapshot_id     = "12344"

  update new env with certain snapshot id from another project
  enable_ephemeral_restore = true
  source_project_id        = "12345"
  source_snapshot_id       = "1234"

  update new env with latest snapshot id from project
  enable_ephemeral_restore_latest = true
  source_project_id               = "12345"

  create snapshot and restore on target project
  enable_snapshot_target_restore = true
  target_project_id              = "12345"
  target_cluster_name            = "blah"
  */
}

output "password" {
  description = "https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password"
  value       = module.this.password
  sensitive   = true
}

output "standard_srv" {
  description = "mongo endpoint uri"
  value       = module.this.standard_srv
}

output "cluster_connection_string" {
  description = "trimmed down mongo uri"
  value       = module.this.cluster_connection_string
}

output "project_id" {
  description = "https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/project#id"
  value       = module.this.project_id
}

variable "org_id" {
  description = "org id"
  type        = string
}

variable "mongo_atlas_org" {
  description = "org id"
  type        = string
}
