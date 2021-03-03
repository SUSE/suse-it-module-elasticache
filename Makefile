include library.mk

########  PREREQUIREMENTS  ##########################################
.PHONY: install_requirements
install_requirements: install_tflint install_terraform install_tfsec install_awscli

######### LINTING ####################################################
.PHONY: run_linter
run_linter: terraform_tflint terraform_tfsec terraform_fmt

######### PLANING ####################################################
.PHONY: run_plan
run_plan: terraform_plan

######### APPLYING ####################################################
.PHONY: run_apply
run_apply: terraform_apply

######### TESTING ####################################################
.PHONY: run_test
run_test: test_push

PHONY: test_push
test_push:

	echo "placeholder for a possible test"
######### DESTROING ####################################################
.PHONY: run_destroy
run_destroy: terraform_destroy
