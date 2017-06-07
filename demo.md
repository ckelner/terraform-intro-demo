# Demo
Demo script for data dog

## Plan
- `terraform env list`
- `terraform env select default`
- `terraform show`
- `terraform output`
- `terraform plan -out=plan.out -var-file=dev.tfvars`

## Apply
- `terraform apply plan.out`
- `terraform show`

## Make change
TBD

## Switch environment
- `terraform env select test`
- `terraform show`
- `terraform plan -out=plan.out -var-file=test.tfvars`

## Destroy
- `terraform env select default`
- `terraform plan -destroy -out=plan.out -var-file=dev.tfvars`
- `terraform apply plan.out`

## Refresh
If output is stale: `terraform refresh -var-file=dev.tfvars`
