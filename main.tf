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

resource "random_string" "cluster" {
  length  = 5
  special = false
  upper   = false
  lower   = true
  number  = true
}
