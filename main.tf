locals {
  provider_name = var.create_free_cluster ? "TENANT" : var.provider_name
  backing_provider_name = var.create_free_cluster ? "AWS" : ""
}

resource "random_password" "this" {
  length  = 20
  special = false
}

resource "random_string" "this" {
  length  = 10
  special = false
  upper   = false
  lower   = true
  number  = true
}
