resource "mongodbatlas_project" "this" {
  name   = var.project_name
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
}
