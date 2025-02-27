resource "mongodbatlas_teams" "this" {
  for_each = var.teams

  org_id    = data.mongodbatlas_organization.this.id
  name      = "${var.component}-${random_string.this[0].result}-${each.value.name_suffix}"
  usernames = each.value.usernames
}
