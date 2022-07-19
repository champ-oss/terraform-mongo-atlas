# terraform-mongo-atlas #

Summary: nosql mongo atlas resources

![ci](https://github.com/conventional-changelog/standard-version/workflows/ci/badge.svg)
[![version](https://img.shields.io/badge/version-1.x-yellow.svg)](https://semver.org)

## Table of Contents
* [General Info](#general-information)
* [Technologies Used](#technologies-used)
* [Features](#Features)
* [Documentation](#Documentation)
* [Usage](#usage)
* [Project Status](#project-status)

## General Information
- automate setup of mongo atlas

## Technologies Used
- terraform
- github actions

## Features

* create mongo project
* mongo cluster
* set default LTS version 
* create database app user
* project allow network cidr list
* manage mongo project teams
* set default maintenance window

## Documentation

terraform mongo atlas provider resource documentation  [_here_](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs)

## Usage

* look at examples/complete/main.tf for usage 

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_mongodbatlas"></a> [mongodbatlas](#requirement\_mongodbatlas) | 1.4.3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_mongodbatlas"></a> [mongodbatlas](#provider\_mongodbatlas) | 1.4.3 |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [mongodbatlas_cluster.this](https://registry.terraform.io/providers/mongodb/mongodbatlas/1.4.3/docs/resources/cluster) | resource |
| [mongodbatlas_database_user.this](https://registry.terraform.io/providers/mongodb/mongodbatlas/1.4.3/docs/resources/database_user) | resource |
| [mongodbatlas_maintenance_window.this](https://registry.terraform.io/providers/mongodb/mongodbatlas/1.4.3/docs/resources/maintenance_window) | resource |
| [mongodbatlas_project.this](https://registry.terraform.io/providers/mongodb/mongodbatlas/1.4.3/docs/resources/project) | resource |
| [mongodbatlas_project_ip_access_list.this](https://registry.terraform.io/providers/mongodb/mongodbatlas/1.4.3/docs/resources/project_ip_access_list) | resource |
| [mongodbatlas_teams.this](https://registry.terraform.io/providers/mongodb/mongodbatlas/1.4.3/docs/resources/teams) | resource |
| [random_password.this](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [random_string.this](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/cluster#name | `string` | n/a | yes |
| <a name="input_component"></a> [component](#input\_component) | team name prefix | `string` | `"team"` | no |
| <a name="input_day_of_week"></a> [day\_of\_week](#input\_day\_of\_week) | https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/maintenance_window#day_of_week | `number` | `1` | no |
| <a name="input_existing_teams"></a> [existing\_teams](#input\_existing\_teams) | https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/team#name | `map(any)` | `{}` | no |
| <a name="input_git"></a> [git](#input\_git) | Name of the Git repo | `string` | n/a | yes |
| <a name="input_hour_of_day"></a> [hour\_of\_day](#input\_hour\_of\_day) | https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/maintenance_window#hour_of_day | `number` | `6` | no |
| <a name="input_mongo_db_major_version"></a> [mongo\_db\_major\_version](#input\_mongo\_db\_major\_version) | https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/cluster#mongo_db_major_version | `string` | `"5.0"` | no |
| <a name="input_org_id"></a> [org\_id](#input\_org\_id) | org id | `string` | n/a | yes |
| <a name="input_project_ip_address_allow_list"></a> [project\_ip\_address\_allow\_list](#input\_project\_ip\_address\_allow\_list) | https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/project_ip_access_list#ip_address | `list(any)` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Name of atlas project | `string` | n/a | yes |
| <a name="input_provider_instance_size_name"></a> [provider\_instance\_size\_name](#input\_provider\_instance\_size\_name) | https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/cluster#provider_instance_size_name | `string` | `"M0"` | no |
| <a name="input_teams"></a> [teams](#input\_teams) | https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/team#name | `map(any)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_connection_string"></a> [cluster\_connection\_string](#output\_cluster\_connection\_string) | trimmed down mongo uri endpoint |
| <a name="output_id"></a> [id](#output\_id) | https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/project#id |
| <a name="output_password"></a> [password](#output\_password) | https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password |
| <a name="output_project_id"></a> [project\_id](#output\_project\_id) | https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/project#id |
| <a name="output_standard_srv"></a> [standard\_srv](#output\_standard\_srv) | mongo uri endpoint |
<!-- END_TF_DOCS -->

## Project Status
Project is: _complete_ 
