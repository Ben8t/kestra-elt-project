provider "neon" {
  api_key = var.neon_api_key
}

resource "neon_project" "kestra_elt" {
  name = "kestra_elt"
  history_retention_seconds = 0
}

resource "neon_branch" "prod" {
  project_id = neon_project.kestra_elt.id
  name       = "prod"
}

resource "neon_endpoint" "prod" {
  project_id = neon_project.kestra_elt.id
  branch_id  = neon_branch.prod.id
  type       = "read_write"
}

resource "neon_role" "admin" {
  project_id = neon_project.kestra_elt.id
  branch_id  = neon_branch.prod.id
  name       = "admin"
}

resource "neon_database" "data" {
  project_id = neon_project.kestra_elt.id
  branch_id  = neon_branch.prod.id
  name       = "data"
  owner_name = neon_role.admin.name
}