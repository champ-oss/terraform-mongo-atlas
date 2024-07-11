resource "mongodbatlas_teams" "this" {
  for_each = var.teams

  org_id    = var.org_id
  name      = "${var.component}-${random_string.this[0].result}-${each.value.name_suffix}"
  usernames = each.value.usernames
}
