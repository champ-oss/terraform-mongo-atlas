resource "mongodbatlas_database_user" "this" {
  count              = var.enabled ? 1 : 0
  username           = "${var.git}-user"
  password           = random_password.this[0].result
  project_id         = mongodbatlas_project.this[0].id
  auth_database_name = "admin"

  roles {
    role_name     = "readWriteAnyDatabase"
    database_name = "admin"
  }
}

resource "mongodbatlas_database_user" "read_only" {
  count              = var.enabled ? 1 : 0
  username           = "${var.git}-read-only-user"
  password           = random_password.read_only[0].result
  project_id         = mongodbatlas_project.this[0].id
  auth_database_name = "admin"

  roles {
    role_name     = "readAnyDatabase"
    database_name = "admin"
  }
}
