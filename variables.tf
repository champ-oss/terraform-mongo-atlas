variable "git" {
  description = "Name of the Git repo"
  type        = string
  default     = "terraform-mongo-atlas"
}

variable "project_name" {
  description = "Name of atlas project"
  type        = string
  default     = "terraform-mongo-atlas"
}

variable "org_id" {
  description = "org id"
  type        = string
  default     = null
}

variable "cluster_name" {
  description = "https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/cluster#name"
  type        = string
  default     = "cluster"
}

variable "target_cluster_name" {
  description = "https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/cluster#name"
  type        = string
  default     = null
}

variable "provider_instance_size_name" {
  description = "https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/cluster#provider_instance_size_name"
  type        = string
  default     = "M0"
}

variable "mongo_db_major_version" {
  description = "https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/cluster#mongo_db_major_version"
  type        = string
  default     = null
}

variable "pinned_fcv_expiration_date" {
  description = "https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/cluster#expiration_date-2"
  type        = string
  default     = null
}

variable "component" {
  description = "team name prefix"
  type        = string
  default     = "team"
}

variable "project_ip_address_allow_list" {
  description = "https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/project_ip_access_list#ip_address"
  type        = list(string)
  default     = []
}

variable "day_of_week" {
  description = "https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/maintenance_window#day_of_week"
  type        = number
  default     = 1
}

variable "hour_of_day" {
  description = "https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/maintenance_window#hour_of_day"
  type        = number
  default     = 6
}

variable "disk_size_gb" {
  description = "https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/cluster#disk_size_gb"
  type        = number
  default     = null
}

variable "teams" {
  description = "https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/team#name"
  type        = map(any)
  default     = {}
}

variable "existing_teams" {
  description = "https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/team#name"
  type        = map(any)
  default     = {}
}

variable "auto_scaling_disk_gb_enabled" {
  description = "https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/cluster#auto_scaling_disk_gb_enabled"
  type        = bool
  default     = true
}

variable "cloud_backup" {
  description = "https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/cluster#cloud_backup"
  type        = bool
  default     = null
}

variable "cluster_type" {
  description = "https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/cluster#cluster_type"
  type        = string
  default     = "REPLICASET"
}

variable "mongo_region" {
  description = "https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/cluster#provider_region_name"
  type        = string
  default     = "US_EAST_1"
}

variable "provider_name" {
  description = "Cloud service provider on which the server for a multi-tenant cluster is provisioned. This setting is only valid when providerSetting.providerName is TENANT and providerSetting.instanceSizeName is M2 or M5. The possible values are: AWS, GCP, AZURE"
  type        = string
  default     = ""
}

variable "replication_specs" {
  description = "https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/cluster#replication_specs"
  type        = list(map(any))
  default     = null
}

variable "enable_snapshot_target_restore" {
  description = "https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/cloud_provider_snapshot_restore_job"
  type        = bool
  default     = false
}

variable "enable_ephemeral_restore" {
  description = "https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/cloud_provider_snapshot_restore_job"
  type        = bool
  default     = false
}

variable "enable_ephemeral_restore_latest" {
  description = "https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/cloud_provider_snapshot_restore_job"
  type        = bool
  default     = false
}

variable "source_project_id" {
  description = "https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/cloud_provider_snapshot_restore_job#project_id"
  type        = string
  default     = null
}

variable "target_project_id" {
  description = "https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/cloud_provider_snapshot_restore_job#project_id"
  type        = string
  default     = null
}

variable "enable_cluster_restore" {
  description = "https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/data-sources/cloud_backup_snapshot_restore_job"
  type        = bool
  default     = false
}

variable "source_snapshot_id" {
  description = "https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/data-sources/cloud_backup_snapshot_restore_job#snapshot_id"
  type        = string
  default     = null
}

variable "auto_scaling_compute_scale_down_enabled" {
  description = "https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/cluster#auto_scaling_compute_scale_down_enabled"
  type        = bool
  default     = true
}

variable "auto_scaling_compute_enabled" {
  description = "https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/cluster#auto_scaling_compute_enabled"
  type        = bool
  default     = true
}

variable "provider_auto_scaling_compute_max_instance_size" {
  description = "https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/cluster#auto_scaling_compute_enabled"
  type        = string
  default     = null
}

variable "provider_auto_scaling_compute_min_instance_size" {
  description = "https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/cluster#auto_scaling_compute_scale_down_enabled"
  type        = string
  default     = null
}

variable "create_dms_endpoint" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dms_endpoint"
  type        = bool
  default     = false
}

variable "dms_endpoint_type" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dms_endpoint#endpoint_type"
  type        = string
  default     = "source"
}

variable "dms_ssl_mode" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/3.3.0/docs/resources/dms_endpoint#ssl_mode"
  type        = string
  default     = "require"
}

variable "dms_auth_mechanism" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/3.3.0/docs/resources/dms_endpoint#auth_mechanism"
  type        = string
  default     = "default"
}

variable "dms_auth_source" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/3.3.0/docs/resources/dms_endpoint#auth_source"
  type        = string
  default     = "admin"
}

variable "dms_auth_type" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/3.3.0/docs/resources/dms_endpoint#auth_type"
  type        = string
  default     = "password"
}

variable "dms_docs_to_investigate" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/3.3.0/docs/resources/dms_endpoint#docs_to_investigate"
  type        = number
  default     = 1000
}

variable "dms_extract_doc_id" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/3.3.0/docs/resources/dms_endpoint#extract_doc_id"
  type        = bool
  default     = false
}

variable "dms_nesting_level" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/3.3.0/docs/resources/dms_endpoint#nesting_level"
  type        = string
  default     = "none"
}

variable "termination_protection_enabled" {
  description = "https://registry.terraform.io/providers/mongodb/mongodbatlas/1.6.0/docs/resources/cluster#termination_protection_enabled"
  type        = bool
  default     = true
}

variable "enabled" {
  description = "Set to false to prevent the module from creating any resources"
  type        = bool
  default     = true
}

variable "paused" {
  description = "Set to true to pause the module"
  type        = bool
  default     = false
}

