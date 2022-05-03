resource "mongodbatlas_teams" "this" {
  for_each = var.teams

  org_id    = var.org_id
  name      = "${var.component}-${random_string.this.result}-${each.value.name_suffix}"
  usernames = each.value.usernames
}
