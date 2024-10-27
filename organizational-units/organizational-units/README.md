# Organizational Units

Infrastructure as Code Terraform

## Prerequisites

* Install [tenv](https://github.com/tofuutils/tenv)

## Getting Started

Install Terraform & Terragrunt versions specified in [terragrunt.hcl](terragrunt.hcl)
```shell
tenv tf install
tenv tg install
```

Run Terragrunt against all accounts
```shell
terragrunt run-all init
```

Run Terragrunt against specific account
```shell
terragrunt run-all plan --terragrunt-working-dir accounts/operations
```
