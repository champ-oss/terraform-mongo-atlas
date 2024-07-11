resource "mongodbatlas_maintenance_window" "this" {
  count       = var.enabled ? 1 : 0
  project_id  = mongodbatlas_project.this[0].id
  day_of_week = var.day_of_week
  hour_of_day = var.hour_of_day
}
