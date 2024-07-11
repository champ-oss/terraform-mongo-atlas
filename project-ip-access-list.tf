resource "mongodbatlas_project_ip_access_list" "this" {
  for_each   = var.enabled ? var.project_ip_address_allow_list : []
  project_id = mongodbatlas_project.this[0].id
  cidr_block = each.value
  comment    = "adding network ip address to allow connection"
}
