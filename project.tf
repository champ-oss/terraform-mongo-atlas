resource "mongodbatlas_project" "this" {
  name   = substr("${var.project_name}-${random_string.limit.result}", 0, 64) # 64 character max length
  org_id = var.org_id

  dynamic "teams" {
    for_each = var.teams

    content {
      team_id    = mongodbatlas_teams.this[teams.key].team_id
      role_names = teams.value.role_names
    }
  }

  dynamic "teams" {
    for_each = var.existing_teams
    content {
      team_id    = teams.key
      role_names = teams.value.role_names
    }
  }

  lifecycle {
    prevent_destroy = true
    ignore_changes = [
      name # setting character limit of 64
    ]
  }

}
