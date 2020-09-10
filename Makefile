INITIALIZE_DIR=./initialize
KUSTOMIZATION_DIR=.
KUBERNETES_DIR=.
KUBERNETES_FILE=$(KUBERNETES_DIR)/kubernetes.yml
KUSTOMIZATION_FILE=$(KUSTOMIZATION_DIR)kustomization.yaml
NAMESPACE_DIR=$(INITIALIZE_DIR)/namespaces

DEFAULT_GOAL := help
help:
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z0-9_-]+:.*?##/ { printf "  \033[36m%-27s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

##@ [Kuberntes] Build / Infrastructure
kubernetes.yml:
	kustomize build >> kubernetes.yml

##@ [Helm] Build / Infrastructure
	
.PHONY: create-namespace
create-namespace: ## Create all Namespaces
	kubectl create -f $(NAMESPACE_DIR)

.PHONY: delete-namespace
delete-namespace: ## Delete all namespace including the services, pods, deployments
	kubectl delete namespace guya-ltd-api-gateway guya-ltd-elk guya-ltd-monitoring guya-ltd

.PHONY: install-helm
install-helm: ## Install Helm repo manager
	./scripts/install_helm.sh

.PHONY: install-elk
install-elk: ## Install Elastic Stack to namespace
	./scripts/install_elk.sh

.PHONY: init
init: create-namespace # Initalize ALL

.PHONY: kustomize-build
kustomize-build: kubernetes.yml ## Make sure the kubernetes.yml file exists for kustomizer

.PHONY: build
build: kustomize-build ## Build all docker images from scratch, without cache etc.

.PHONY: clean
clean: ## Remove the kubernetes.yml file for docker
	rm -f $(KUBERNETES_FILE)

.PHONY: deploy
deploy: ## Deploy to kubernetes
	kubectl apply -f $(KUBERNETES_FILE)

.PHONY: all
all: clean delete-namespace install-elk init build deploy ## Make all