resource "aws_ssm_parameter" "mongo_read_only" {
  name  = "/${var.git}/mongo/${mongodbatlas_cluster.mongodbatlas_cluster.this.connection_strings[0].standard_srv}/password"
  type  = "SecureString"
  value = random_password.read_only.result
  tags = {
    cost    = "shared"
    creator = "terraform"
    git     = var.git
  }
}