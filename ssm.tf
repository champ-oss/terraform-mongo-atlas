resource "aws_ssm_parameter" "mongo_read_only" {
  count = var.enabled ? 1 : 0
  name  = "/mongo/${mongodbatlas_project.this.name}-read-only"
  type  = "SecureString"
  value = random_password.read_only[0].result
  tags = {
    cost     = "shared"
    creator  = "terraform"
    git      = var.git
    endpoint = split("//", mongodbatlas_cluster.this[0].connection_strings[0].standard_srv)[1]
    user     = mongodbatlas_database_user.read_only[0].username
  }
}
