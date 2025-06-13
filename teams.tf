resource "mongodbatlas_teams" "this" {
  count = var.enabled && length(var.teams) > 0 ? 1 : 0
  for_each = var.teams

  org_id    = var.org_id
  name      = "${var.component}-${random_string.this[0].result}-${each.value.name_suffix}"
  usernames = each.value.usernames
}
