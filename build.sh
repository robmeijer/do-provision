#!/usr/bin/env bash

packer build packer/php-base.json
terraform init terraform/
terraform plan -var-file=terraform/terraform.tfvars terraform/
terraform apply -auto-approve -var-file=terraform/terraform.tfvars terraform/
