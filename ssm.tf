resource "aws_ssm_parameter" "mongo_read_only" {
  name  = var.project_name
  type  = "SecureString"
  value = random_password.read_only.result
  tags = {
    cost     = "shared"
    creator  = "terraform"
    git      = var.git
    endpoint = split("//", mongodbatlas_cluster.this.connection_strings[0].standard_srv)[1]
    user     = mongodbatlas_database_user.read_only.username
  }
}
