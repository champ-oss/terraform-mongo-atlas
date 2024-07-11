resource "mongodbatlas_project_ip_access_list" "this" {
  for_each   = toset(var.project_ip_address_allow_list)
  project_id = try(mongodbatlas_project.this[0].id, null)
  cidr_block = each.value
  comment    = "adding network ip address to allow connection"
}
