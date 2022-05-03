variable "git" {
  description = "Name of the Git repo"
  type        = string
}

variable "project_name" {
  description = "Name of atlas project"
  type        = string
}

variable "org_id" {
  description = "org id"
  type        = string
}

variable "cluster_name" {
  description = "https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/cluster#name"
  type        = string
}

variable "provider_instance_size_name" {
  description = "https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/cluster#provider_instance_size_name"
  type        = string
  default     = "M0"
}

variable "mongo_db_major_version" {
  description = "https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/cluster#mongo_db_major_version"
  type        = string
  default     = "5.0"
}

variable "component" {
  description = "team name prefix"
  type        = string
  default     = "team"
}

variable "project_ip_address_allow_list" {
  description = "https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/project_ip_access_list#ip_address"
  type        = list(any)
  default     = ["0.0.0.0/0"]
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
