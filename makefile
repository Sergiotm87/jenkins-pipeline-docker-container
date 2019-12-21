IMAGE_OWNER ?= kammin
TIMESTAMP = $(shell date +'%Y%m%d%H%M')

help:           ## Show this help
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

up:             ## Build and push docker image
	docker build -t $(IMAGE_OWNER)/aws-hashicorp-jenkins:$(TIMESTAMP) pipeline-containers/aws-hashicorp-jenkins/
	docker push $(IMAGE_OWNER)/aws-hashicorp-jenkins:$(TIMESTAMP)
