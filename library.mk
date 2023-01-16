############## VERSIONS ###########
TFLINT_VERSION ?= v0.15.3
TFLINT_HASH ?= d8ef28f7a86f93ac3fe8910de4d6c890f5acd18460a12e55bc2ebea1d763e2bd

TF_VERSION ?= 1.3.6
TF_HASH ?= bb44a4c2b0a832d49253b9034d8ccbd34f9feeb26eda71c665f6e7fa0861f49b

TFSEC_VERSION ?= v0.19.0
TFSEC_HASH ?= 88541fc654dea8f3514c9422003df870f985dc3c50a43c929ab44bb5cee60789
##################################

## INSTALL TFLINT
.PHONY: install_tflint
install_tflint:

	curl -sL -o /tmp/tflint.zip "https://github.com/terraform-linters/tflint/releases/download/$(TFLINT_VERSION)/tflint_linux_amd64.zip"
	echo "$(TFLINT_HASH) /tmp/tflint.zip" | sha256sum --check --status
	sudo unzip -q /tmp/tflint.zip -d /usr/local/bin/

## INSTALL TERRAFORM
.PHONY: install_terraform
install_terraform:

	curl -sL -o /tmp/terraform_$(TF_VERSION)_linux_amd64.zip "https://releases.hashicorp.com/terraform/$(TF_VERSION)/terraform_$(TF_VERSION)_linux_amd64.zip"
	echo "$(TF_HASH) /tmp/terraform_$(TF_VERSION)_linux_amd64.zip" | sha256sum --check --status
	sudo unzip -q /tmp/terraform_$(TF_VERSION)_linux_amd64.zip -d /usr/local/bin/

## INSTALL TFSEC
.PHONY: install_tfsec
install_tfsec:

	curl -sL -o /tmp/tfsec "https://github.com/liamg/tfsec/releases/download/$(TFSEC_VERSION)/tfsec-linux-amd64"
	echo "$(TFSEC_HASH) /tmp/tfsec" | sha256sum --check --status
	sudo mv /tmp/tfsec /usr/local/bin/tfsec
	sudo chmod 755 /usr/local/bin/tfsec

# INSTALL AWS CLI
.PHONY: install_awscli
install_awscli:

	curl -sL -o /tmp/awscliv2.zip "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip"
	unzip -q /tmp/awscliv2.zip -d /tmp/
	sudo /tmp/aws/install

## RUN TFLINT
.PHONY: terraform_tflint
terraform_tflint:

	/usr/local/bin/tflint --deep $(PATH_TO_LINT)

## RUN TFSEC
.PHONY: terraform_tfsec
terraform_tfsec:

	/usr/local/bin/tfsec $(PATH_TO_LINT)

## RUN TERRAFORM FMT
.PHONY: terraform_fmt
terraform_fmt:

	/usr/local/bin/terraform fmt -check=true -recursive=true $(PATH_TO_LINT)

## RUN TERRAFORM PLAN
.PHONY: terraform_plan
terraform_plan:

	/usr/local/bin/terraform init $(PATH_TO_PLAN)
	/usr/local/bin/terraform plan $(PATH_TO_PLAN)

## RUN TERRAFORM APPLY
.PHONY: terraform_apply
terraform_apply:

	/usr/local/bin/terraform init $(PATH_TO_APPLY)
	/usr/local/bin/terraform apply -auto-approve  $(PATH_TO_APPLY)

## RUN TERRAFORM DESTROY
.PHONY: terraform_destroy
terraform_destroy:

	/usr/local/bin/terraform init $(PATH_TO_DESTROY)
	/usr/local/bin/terraform destroy -auto-approve  $(PATH_TO_DESTROY)
