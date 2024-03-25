FRINX_NAMESPACE ?= frinx

FRINX_CRDS_RELEASE_NAME ?= frinx-crds
FRINX_CRDS_SETS ?= --set kube-arangodb.enabled=true --set cloudnative-pg.enabled=true

FRINX_MONITORING_RELEASE_NAME ?= frinx-monitoring
FRINX_PERSISTANCE_RELEASE_NAME ?= frinx-persistance
FRINX_MACHINE_RELEASE_NAME ?= frinx-machine

HELM_DEFAULT_VALUES := values.yaml 

HELM_CHART_PATH := .

HELM_UPGRADE_INSTALL := helm upgrade --install -n ${FRINX_NAMESPACE}

.PHONY: frinx-crds
frinx-crds:
		$(HELM_UPGRADE_INSTALL) ${FRINX_CRDS_RELEASE_NAME} ${HELM_CHART_PATH} -f ${HELM_DEFAULT_VALUES} ${FRINX_CRDS_SETS}

.PHONY: frinx-monitoring
frinx-monitoring:
		$(HELM_UPGRADE_INSTALL) ${FRINX_MONITORING_RELEASE_NAME} ${HELM_CHART_PATH} -f ${HELM_DEFAULT_VALUES} 

.PHONY: frinx-persistance
frinx-persistance:
		$(HELM_UPGRADE_INSTALL) ${FRINX_PERSISTANCE_RELEASE_NAME} ${HELM_CHART_PATH} -f ${HELM_DEFAULT_VALUES} 

.PHONY: frinx-machine
frinx-machine:
		$(HELM_UPGRADE_INSTALL) ${FRINX_MACHINE_RELEASE_NAME} ${HELM_CHART_PATH} -f ${HELM_DEFAULT_VALUES} -f oauth2-proxy.yaml -f ingress-values.yaml