deploy:
	aws-vault exec home --no-session -- terraform apply -var-file=./examples/terraform.tfvars
