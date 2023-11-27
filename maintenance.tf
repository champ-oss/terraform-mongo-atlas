resource "mongodbatlas_maintenance_window" "this" {
  project_id  = mongodbatlas_project.this.id
  day_of_week = var.day_of_week
  hour_of_day = var.hour_of_day
}
