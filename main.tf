resource "random_password" "this" {
  count   = var.enabled ? 1 : 0
  length  = 20
  special = false
}

resource "random_password" "read_only" {
  count   = var.enabled ? 1 : 0
  length  = 20
  special = false
}

resource "random_string" "this" {
  count   = var.enabled ? 1 : 0
  length  = 10
  special = false
  upper   = false
  lower   = true
  numeric = true
}

resource "random_string" "limit" {
  count   = var.enabled ? 1 : 0
  length  = 5
  special = false
  upper   = false
  lower   = true
  numeric = true
}
