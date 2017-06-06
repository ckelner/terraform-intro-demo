# Datadog Solutions Engineer Demo
A Terraform demo project for Solutions Engineer role at Datadog.

# Environments
This repo currently uses two environments, they are listed in the sub-sections
below. The "default" environment is utilized as development because it cannot be
removed. [You can read more about the "default" environment by clicking
here](https://www.terraform.io/docs/state/environments.html#using-environments).

## Development ("Default")
Use `terraform env select default` to switch to this environment. The
`dev.tfvars` should be used with this environment when executing terraform
commands, e.g. `terraform plan -var-file=dev.tfvars`. This environment is for
the development team to create a one-for-one likeness with production at a
smaller scale to reduce cost.

## Test
Use `terraform env select test` to switch to this environment. The
`test.tfvars` should be used with this environment when executing terraform
commands, e.g. `terraform plan -var-file=test.tfvars`. This environment is to
be used by QA when promoting changes from development prior to going to
production.
