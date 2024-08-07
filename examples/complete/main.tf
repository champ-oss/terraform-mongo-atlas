terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.40.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.6.0"
    }
    archive = {
      source  = "hashicorp/archive"
      version = ">= 2.0.0"
    }
  }
}

locals {
  git = "terraform-mongo-atlas"
}

variable "mongodb_atlas_org" {
  description = "Organization ID"
  type        = string
}

module "this" {
  source                         = "../../"
  project_name                   = "mongo-example"
  git                            = local.git
  org_id                         = var.mongodb_atlas_org
  cluster_name                   = "${local.git}-cluster"
  provider_instance_size_name    = "M10"
  termination_protection_enabled = false
  project_ip_address_allow_list  = ["0.0.0.0/32"]
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
