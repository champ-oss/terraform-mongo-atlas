locals {
  git = "terraform-mongo-atlas"
}

module "this" {
  source                      = "../../"
  project_name                = "dedicated-example"
  git                         = local.git
  org_id                      = var.org_id
  cluster_name                = "cluster-name"
  provider_instance_size_name = "M10"
  replication_specs = [{
    num_shards : 1,
    zone_name : "ZONE 2 managed by terraform",
    region_name : "US_EAST_2",
    electable_nodes : 3,
    priority : 7,
    read_only_nodes : 0
  }]

  disk_size_gb                 = 10
  cloud_backup                 = true
  auto_scaling_disk_gb_enabled = false
  provider_name                = "AWS"
  mongo_region                 = "US_EAST_2"
}
