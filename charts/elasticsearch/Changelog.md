# Helm chart for elasticsearch
Source code: https://github.com/elastic/helm-charts/releases/tag/v7.16.3

repository:
- name: elastic
- url: https://helm.elastic.co
- chart: charts/elasticsearch
- version: 7.6.13

Differences from the original:

./values.yaml
```diff
roles:
  master: "true"
  ingest: "true"
  data: "true"
- remote_cluster_client: "true"
+  # remote_cluster_client: "true"
  ml: "true"
```
Caused by: java.lang.IllegalArgumentException: unknown setting [node.remote_cluster_client] please check that any required plugins are installed, or check the breaking changes documentation for removed settings

---
./templates/statefulset.yaml
```diff
          - name: cluster.name
            value: "{{ .Values.clusterName }}"
          - name: network.host
            value: "{{ .Values.networkHost }}"
-          - name: cluster.deprecation_indexing.enabled
-            value: "{{ .Values.clusterDeprecationIndexing }}"
+          # - name: cluster.deprecation_indexing.enabled
+          #   value: "{{ .Values.clusterDeprecationIndexing }}"
```
Caused by: java.lang.IllegalArgumentException: unknown setting [cluster.deprecation_indexing.enabled] please check that any required plugins are installed, or check the breaking changes documentation for removed settings

./templates/statefulset.yaml
```diff
              fieldRef:
                fieldPath: metadata.name
          {{- if eq .Values.roles.master "true" }}
          {{- if ge (int (include "elasticsearch.esMajorVersion" .)) 7 }}
-          - name: cluster.initial_master_nodes
-            value: "{{ template "elasticsearch.endpoints" . }}"
+          # - name: cluster.initial_master_nodes
+          #   value: "{{ template "elasticsearch.endpoints" . }}"
```
Caused by: java.lang.IllegalArgumentException: unknown setting [cluster.initial_master_nodes] please check that any required plugins are installed, or check the breaking changes documentation for removed settings

./templates/statefulset.yaml
```diff
          {{- if lt (int (include "elasticsearch.esMajorVersion" .)) 7 }}
          - name: discovery.zen.ping.unicast.hosts
            value: "{{ template "elasticsearch.masterService" . }}-headless"
          {{- else }}
-          - name: discovery.seed_hosts
-            value: "{{ template "elasticsearch.masterService" . }}-headless"
+          # - name: discovery.seed_hosts
+          #   value: "{{ template "elasticsearch.masterService" . }}-headless"
```
Caused by: java.lang.IllegalArgumentException: unknown setting [discovery.seed_hosts] please check that any required plugins are installed, or check the breaking changes documentation for removed settings