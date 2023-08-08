locals {
  # example: mongodb://my-test-shard-00-00.nvn238v.mongodb.net:27017,my-test-shard-00-01.nvn238v.mongodb.net:27017,my-test-shard-00-02.nvn238v.mongodb.net:27017
  shards_map = [
    for shard in split(",", trimprefix(mongodbatlas_cluster.this.mongo_uri, "mongodb://")) : {
      host = split(":", shard)[0]
      port = split(":", shard)[1]
    }
  ]
}

resource "aws_dms_endpoint" "this" {
  count         = var.create_dms_endpoint ? 1 : 0
  endpoint_id   = mongodbatlas_cluster.this.name
  endpoint_type = var.dms_endpoint_type
  engine_name   = "mongodb"
  password      = random_password.this.result
  port          = local.shards_map[0].port
  server_name   = local.shards_map[0].host
  username      = mongodbatlas_database_user.this.username

  tags = {
    creator      = "terraform"
    git          = var.git
    project_name = var.project_name
    org_id       = var.org_id
    cluster_name = var.cluster_name
    component    = var.component
  }

  timeouts {
    create = "60m"
    delete = "60m"
  }
}