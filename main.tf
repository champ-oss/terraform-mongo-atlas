resource "random_password" "this" {
  length  = 20
  special = false
}

resource "random_password" "read_only" {
  length  = 20
  special = false
}

resource "random_string" "this" {
  length  = 10
  special = false
  upper   = false
  lower   = true
  numeric = true
}

resource "random_string" "limit" {
  length  = 5
  special = false
  upper   = false
  lower   = true
  numeric = true
}
