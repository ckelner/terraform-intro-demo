# Demo
Demo script for data dog

- `terraform env list`
- `terraform env select default`
- `terraform show`
- `terraform output`
- `terraform plan -out=plan.out -var-file=dev.tfvars`
- `terraform apply plan.out`
- `terraform show`
- `terraform env select test`
- `terraform show`
- `terraform plan -out=plan.out -var-file=test.tfvars`
- `terraform env select default`
- `terraform plan -destroy -out=plan.out -var-file=dev.tfvars`
- `terraform apply plan.out`
