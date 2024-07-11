moved {
  from = mongodbatlas_cluster.this
  to   = mongodbatlas_cluster.this[0]
}

moved {
  from = mongodbatlas_database_user.this
  to   = mongodbatlas_database_user.this[0]
}

moved {
  from = mongodbatlas_database_user.read_only
  to   = mongodbatlas_database_user.read_only[0]
}

moved {
  from = random_string.this
  to   = random_string.this[0]
}

moved {
  from = random_string.limit
  to   = random_string.limit[0]
}

moved {
  from = random_password.this
  to   = random_password.this[0]
}

moved {
  from = random_password.read_only
  to   = random_password.read_only[0]
}

moved {
  from = mongodbatlas_maintenance_window.this
  to   = mongodbatlas_maintenance_window.this[0]
}

moved {
  from = mongodbatlas_project.this
  to   = mongodbatlas_project.this[0]
}

moved {
  from = aws_ssm_parameter.mongo_read_only
  to   = aws_ssm_parameter.mongo_read_only[0]
}

