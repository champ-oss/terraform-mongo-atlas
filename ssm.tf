resource "aws_ssm_parameter" "mongo_read_only" {
  name  = split("//", "/${var.git}/mongodbatlas_cluster.this.connection_strings[0].standard_srv)[1]")
  type  = "SecureString"
  value = random_password.read_only.result
  tags = {
    cost    = "shared"
    creator = "terraform"
    git     = var.git
  }
}
