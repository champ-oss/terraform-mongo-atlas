resource "mongodbatlas_database_user" "this" {
  username           = "${var.git}-user"
  password           = random_password.this.result
  project_id         = mongodbatlas_project.this.id
  auth_database_name = "admin"

  roles {
    role_name     = "readWriteAnyDatabase"
    database_name = "admin"
  }
}

resource "mongodbatlas_database_user" "read_only" {
  username           = "${var.git}-read-only-user"
  password           = random_password.read_only.result
  project_id         = mongodbatlas_project.this.id
  auth_database_name = "admin"

  roles {
    role_name     = "readAnyDatabase"
    database_name = "admin"
  }
}

