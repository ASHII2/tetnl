locals {
  repo_name = basename(get_repo_root())
  account_name  = basename(get_terragrunt_dir())
}

remote_state {
  backend = "s3"
  config = {
    bucket                  = "norlys-${local.repo_name}-tfstate"
    key                     = "${local.account_name}/terraform.tfstate"
    encrypt                 = true
    region                  = "eu-north-1"
    dynamodb_table          = "norlys-${local.repo_name}-${local.account_name}-tfstate-lock"
    skip_bucket_root_access = true
  }
}

generate "backend" {
  path      = "backend.tf"
  if_exists = "overwrite"
  contents  = <<EOF

terraform {
  backend "s3" {
    bucket         = "norlys-${local.repo_name}-${local.account_name}-tfstate"
    key            = "${local.account_name}/terraform.tfstate"
    encrypt        = true
    region         = "eu-north-1"
    dynamodb_table = "norlys-${local.repo_name}-${local.account_name}-tfstate-lock"
    profile        = "${local.account_name}"
  }
}
EOF
}

generate "provider" {
  path = "providers.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF

provider "aws" {
  region = "eu-north-1"
}
EOF
}
