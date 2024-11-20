<#--
    Licensed to the Apache Software Foundation (ASF) under one
    or more contributor license agreements.  See the NOTICE file
    distributed with this work for additional information
    regarding copyright ownership.  The ASF licenses this file
    to you under the Apache License, Version 2.0 (the
    "License"); you may not use this file except in compliance
    with the License.  You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing,
    software distributed under the License is distributed on an
    "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
    KIND, either express or implied.  See the License for the
    specific language governing permissions and limitations
    under the License.
-->
{
"__inputs": [],
"__elements": {},
"__requires": [
{
"type": "grafana",
"id": "grafana",
"name": "Grafana",
"version": "10.3.1"
},
{
"type": "datasource",
"id": "prometheus",
"name": "Prometheus",
"version": "1.0.0"
},
{
"type": "panel",
"id": "stat",
"name": "Stat",
"version": ""
},
{
"type": "panel",
"id": "table",
"name": "Table",
"version": ""
},
{
"type": "panel",
"id": "text",
"name": "Text",
"version": ""
},
{
"type": "panel",
"id": "timeseries",
"name": "Time series",
"version": ""
}
],
"annotations": {
"list": [
{
"builtIn": 1,
"datasource": {
"type": "datasource",
"uid": "grafana"
},
"enable": true,
"hide": true,
"iconColor": "rgba(0, 211, 255, 1)",
"name": "Annotations & Alerts",
"target": {
"limit": 100,
"matchAny": false,
"tags": [],
"type": "dashboard"
},
"type": "dashboard"
},
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"enable": true,
"expr": "sum(ALERTS{job=~\"$job\", instance=~\"$instance\", alertgroup=\"vmcluster\",alertstate=\"firing\",show_at=\"dashboard\"}) by(alertname)",
"iconColor": "red",
"name": "alerts",
"titleFormat": "{{alertname}}"
},
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"enable": true,
"expr": "sum(vm_app_version{job=~\"$job\", instance=~\"$instance\"}) by(version) unless (sum(vm_app_version{job=~\"$job\", instance=~\"$instance\"} offset 20m) by(version))",
"hide": true,
"iconColor": "dark-blue",
"name": "version change",
"textFormat": "{{version}}",
"titleFormat": "Version change"
},
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"enable": true,
"expr": "sum(changes(vm_app_start_timestamp{job=~\"$job\", instance=~\"$instance\"})) by(job)",
"hide": true,
"iconColor": "dark-yellow",
"name": "restarts",
"textFormat": "{{job}} restarted"
}
]
},
"description": "Overview for cluster VictoriaMetrics v1.86.0 or higher",
"editable": true,
"fiscalYearStartMonth": 0,
"graphTooltip": 1,
"id": null,
"links": [
{
"icon": "doc",
"tags": [],
"targetBlank": true,
"title": "Cluster Wiki",
"type": "link",
"url": "https://github.com/VictoriaMetrics/VictoriaMetrics/wiki/Cluster-VictoriaMetrics"
},
{
"icon": "external link",
"tags": [],
"targetBlank": true,
"title": "Found a bug?",
"type": "link",
"url": "https://github.com/VictoriaMetrics/VictoriaMetrics/issues"
},
{
"icon": "external link",
"tags": [],
"targetBlank": true,
"title": "New releases",
"type": "link",
"url": "https://github.com/VictoriaMetrics/VictoriaMetrics/releases"
}
],
"liveNow": false,
"panels": [
{
"collapsed": false,
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"gridPos": {
"h": 1,
"w": 24,
"x": 0,
"y": 0
},
"id": 137,
"panels": [],
"title": "Stats",
"type": "row"
},
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"description": "How many datapoints are in storage",
"fieldConfig": {
"defaults": {
"color": {
"mode": "thresholds"
},
"mappings": [],
"thresholds": {
"mode": "absolute",
"steps": [
{
"color": "green",
"value": null
}
]
},
"unit": "short",
"unitScale": true
},
"overrides": []
},
"gridPos": {
"h": 3,
"w": 6,
"x": 0,
"y": 1
},
"id": 131,
"links": [],
"maxDataPoints": 100,
"options": {
"colorMode": "value",
"graphMode": "area",
"justifyMode": "auto",
"orientation": "horizontal",
"reduceOptions": {
"calcs": [
"lastNotNull"
],
"fields": "",
"values": false
},
"showPercentChange": false,
"text": {},
"textMode": "auto",
"wideLayout": true
},
"pluginVersion": "10.3.1",
"targets": [
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"exemplar": true,
"expr": "sum(vm_rows{job=~\"$job_storage\", type!~\"indexdb.*\"})",
"format": "time_series",
"instant": true,
"interval": "",
"intervalFactor": 1,
"legendFormat": "",
"refId": "A"
}
],
"title": "Total datapoints",
"type": "stat"
},
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"description": "Shows the datapoints ingestion rate, including replication factor.",
"fieldConfig": {
"defaults": {
"color": {
"mode": "thresholds"
},
"mappings": [],
"thresholds": {
"mode": "absolute",
"steps": [
{
"color": "green",
"value": null
}
]
},
"unit": "short",
"unitScale": true
},
"overrides": []
},
"gridPos": {
"h": 3,
"w": 6,
"x": 6,
"y": 1
},
"id": 124,
"links": [],
"maxDataPoints": 100,
"options": {
"colorMode": "value",
"graphMode": "area",
"justifyMode": "auto",
"orientation": "horizontal",
"reduceOptions": {
"calcs": [
"lastNotNull"
],
"fields": "",
"values": false
},
"showPercentChange": false,
"text": {},
"textMode": "auto",
"wideLayout": true
},
"pluginVersion": "10.3.1",
"targets": [
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"editorMode": "code",
"exemplar": false,
"expr": "sum(rate(vm_vminsert_metrics_read_total{job=~\"$job_storage\", instance=~\"$instance\"}[$__rate_interval])) ",
"format": "time_series",
"instant": true,
"interval": "",
"intervalFactor": 1,
"legendFormat": "",
"range": false,
"refId": "A"
}
],
"title": "Ingestion rate",
"type": "stat"
},
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"description": "Shows the rate of HTTP read requests.",
"fieldConfig": {
"defaults": {
"color": {
"mode": "thresholds"
},
"mappings": [],
"thresholds": {
"mode": "absolute",
"steps": [
{
"color": "green",
"value": null
}
]
},
"unit": "req/s",
"unitScale": true
},
"overrides": []
},
"gridPos": {
"h": 3,
"w": 6,
"x": 12,
"y": 1
},
"id": 130,
"links": [],
"maxDataPoints": 100,
"options": {
"colorMode": "value",
"graphMode": "area",
"justifyMode": "auto",
"orientation": "horizontal",
"reduceOptions": {
"calcs": [
"lastNotNull"
],
"fields": "",
"values": false
},
"showPercentChange": false,
"text": {},
"textMode": "auto",
"wideLayout": true
},
"pluginVersion": "10.3.1",
"targets": [
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"editorMode": "code",
"exemplar": true,
"expr": "sum(rate(vm_http_requests_total{job=~\"$job\", instance=~\"$instance\", path=~\"/select/.*\"}[$__rate_interval]))",
"format": "time_series",
"instant": true,
"interval": "",
"intervalFactor": 1,
"legendFormat": "",
"refId": "A"
}
],
"title": "Read requests",
"type": "stat"
},
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"description": "Total number of available CPUs for all VM components. ",
"fieldConfig": {
"defaults": {
"color": {
"mode": "thresholds"
},
"mappings": [],
"thresholds": {
"mode": "absolute",
"steps": [
{
"color": "green",
"value": null
}
]
},
"unit": "short",
"unitScale": true
},
"overrides": []
},
"gridPos": {
"h": 3,
"w": 6,
"x": 18,
"y": 1
},
"id": 126,
"links": [],
"maxDataPoints": 100,
"options": {
"colorMode": "value",
"graphMode": "area",
"justifyMode": "auto",
"orientation": "horizontal",
"reduceOptions": {
"calcs": [
"lastNotNull"
],
"fields": "",
"values": false
},
"showPercentChange": false,
"text": {},
"textMode": "auto",
"wideLayout": true
},
"pluginVersion": "10.3.1",
"targets": [
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"editorMode": "code",
"exemplar": true,
"expr": "sum(vm_available_cpu_cores{job=~\"$job\", instance=~\"$instance\"})",
"format": "time_series",
"instant": true,
"interval": "",
"intervalFactor": 1,
"legendFormat": "",
"refId": "A"
}
],
"title": "Available CPU",
"type": "stat"
},
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"description": "Shows the number of active time series with new data points inserted during the last hour. High value may result in ingestion slowdown. \n\nSee more details here https://docs.victoriametrics.com/FAQ.html#what-is-an-active-time-series",
"fieldConfig": {
"defaults": {
"color": {
"mode": "thresholds"
},
"mappings": [],
"thresholds": {
"mode": "absolute",
"steps": [
{
"color": "green",
"value": null
}
]
},
"unit": "short",
"unitScale": true
},
"overrides": []
},
"gridPos": {
"h": 3,
"w": 6,
"x": 0,
"y": 4
},
"id": 34,
"links": [],
"maxDataPoints": 100,
"options": {
"colorMode": "value",
"graphMode": "area",
"justifyMode": "auto",
"orientation": "horizontal",
"reduceOptions": {
"calcs": [
"lastNotNull"
],
"fields": "",
"values": false
},
"showPercentChange": false,
"text": {},
"textMode": "auto",
"wideLayout": true
},
"pluginVersion": "10.3.1",
"targets": [
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"editorMode": "code",
"exemplar": true,
"expr": "sum(max_over_time(vm_cache_entries{job=~\"$job\", instance=~\"$instance\", type=\"storage/hour_metric_ids\"}[1h]))",
"format": "time_series",
"instant": true,
"interval": "",
"intervalFactor": 1,
"legendFormat": "",
"refId": "A"
}
],
"title": "Active series",
"type": "stat"
},
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"description": "Total amount of used disk space",
"fieldConfig": {
"defaults": {
"color": {
"mode": "thresholds"
},
"mappings": [],
"thresholds": {
"mode": "absolute",
"steps": [
{
"color": "green",
"value": null
}
]
},
"unit": "bytes",
"unitScale": true
},
"overrides": []
},
"gridPos": {
"h": 3,
"w": 6,
"x": 6,
"y": 4
},
"id": 35,
"links": [],
"maxDataPoints": 100,
"options": {
"colorMode": "value",
"graphMode": "area",
"justifyMode": "auto",
"orientation": "horizontal",
"reduceOptions": {
"calcs": [
"lastNotNull"
],
"fields": "",
"values": false
},
"showPercentChange": false,
"text": {},
"textMode": "auto",
"wideLayout": true
},
"pluginVersion": "10.3.1",
"targets": [
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"exemplar": false,
"expr": "sum(vm_data_size_bytes{job=~\"$job_storage\"})",
"format": "time_series",
"instant": true,
"interval": "",
"intervalFactor": 1,
"legendFormat": "",
"refId": "A"
}
],
"title": "Disk space usage",
"type": "stat"
},
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"description": "Average disk usage per datapoint.",
"fieldConfig": {
"defaults": {
"color": {
"mode": "thresholds"
},
"decimals": 2,
"mappings": [],
"thresholds": {
"mode": "absolute",
"steps": [
{
"color": "green",
"value": null
}
]
},
"unit": "bytes",
"unitScale": true
},
"overrides": []
},
"gridPos": {
"h": 3,
"w": 6,
"x": 12,
"y": 4
},
"id": 112,
"links": [],
"maxDataPoints": 100,
"options": {
"colorMode": "value",
"graphMode": "area",
"justifyMode": "auto",
"orientation": "horizontal",
"reduceOptions": {
"calcs": [
"lastNotNull"
],
"fields": "",
"values": false
},
"showPercentChange": false,
"text": {},
"textMode": "auto",
"wideLayout": true
},
"pluginVersion": "10.3.1",
"targets": [
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"exemplar": true,
"expr": "sum(vm_data_size_bytes{job=~\"$job_storage\"}) / sum(vm_rows{job=~\"$job_storage\", type!~\"indexdb.*\"})",
"format": "time_series",
"instant": true,
"interval": "",
"intervalFactor": 1,
"legendFormat": "",
"refId": "A"
}
],
"title": "Bytes per point",
"type": "stat"
},
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"description": "Total size of available memory for all VM components.",
"fieldConfig": {
"defaults": {
"color": {
"mode": "thresholds"
},
"mappings": [],
"thresholds": {
"mode": "absolute",
"steps": [
{
"color": "green",
"value": null
}
]
},
"unit": "bytes",
"unitScale": true
},
"overrides": []
},
"gridPos": {
"h": 3,
"w": 6,
"x": 18,
"y": 4
},
"id": 128,
"links": [],
"maxDataPoints": 100,
"options": {
"colorMode": "value",
"graphMode": "area",
"justifyMode": "auto",
"orientation": "horizontal",
"reduceOptions": {
"calcs": [
"lastNotNull"
],
"fields": "",
"values": false
},
"showPercentChange": false,
"text": {},
"textMode": "auto",
"wideLayout": true
},
"pluginVersion": "10.3.1",
"targets": [
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"editorMode": "code",
"exemplar": true,
"expr": "sum(vm_available_memory_bytes{job=~\"$job\", instance=~\"$instance\"})",
"format": "time_series",
"instant": true,
"interval": "",
"intervalFactor": 1,
"legendFormat": "",
"refId": "A"
}
],
"title": "Available memory",
"type": "stat"
},
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"fieldConfig": {
"defaults": {
"color": {
"mode": "thresholds"
},
"custom": {
"align": "auto",
"cellOptions": {
"type": "auto"
},
"inspect": false,
"minWidth": 50
},
"mappings": [],
"thresholds": {
"mode": "absolute",
"steps": [
{
"color": "green",
"value": null
},
{
"color": "red",
"value": 80
}
]
},
"unitScale": true
},
"overrides": [
{
"matcher": {
"id": "byName",
"options": "Time"
},
"properties": [
{
"id": "custom.hidden",
"value": true
}
]
},
{
"matcher": {
"id": "byName",
"options": "Value"
},
"properties": [
{
"id": "displayName",
"value": "Count"
}
]
}
]
},
"gridPos": {
"h": 5,
"w": 8,
"x": 0,
"y": 7
},
"id": 149,
"options": {
"cellHeight": "sm",
"footer": {
"countRows": false,
"fields": "",
"reducer": [
"sum"
],
"show": false
},
"showHeader": true,
"sortBy": [
{
"desc": true,
"displayName": "Count"
}
]
},
"pluginVersion": "10.3.1",
"targets": [
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"editorMode": "code",
"exemplar": false,
"expr": "sum(vm_app_version{job=~\"$job\", instance=~\"$instance\"}) by(job, short_version)",
"format": "table",
"instant": true,
"range": false,
"refId": "A"
}
],
"type": "table"
},
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"fieldConfig": {
"defaults": {
"color": {
"mode": "palette-classic"
},
"custom": {
"axisBorderShow": false,
"axisCenteredZero": false,
"axisColorMode": "text",
"axisLabel": "",
"axisPlacement": "auto",
"axisSoftMin": 0,
"barAlignment": 0,
"drawStyle": "line",
"fillOpacity": 0,
"gradientMode": "none",
"hideFrom": {
"legend": false,
"tooltip": false,
"viz": false
},
"insertNulls": false,
"lineInterpolation": "stepAfter",
"lineWidth": 1,
"pointSize": 5,
"scaleDistribution": {
"type": "linear"
},
"showPoints": "never",
"spanNulls": false,
"stacking": {
"group": "A",
"mode": "none"
},
"thresholdsStyle": {
"mode": "off"
}
},
"decimals": 0,
"links": [],
"mappings": [],
"thresholds": {
"mode": "absolute",
"steps": [
{
"color": "green",
"value": null
},
{
"color": "red",
"value": 80
}
]
},
"unit": "none",
"unitScale": true
},
"overrides": []
},
"gridPos": {
"h": 5,
"w": 16,
"x": 8,
"y": 7
},
"id": 62,
"options": {
"legend": {
"calcs": [
"lastNotNull"
],
"displayMode": "table",
"placement": "right",
"showLegend": true,
"sortBy": "Last *",
"sortDesc": true
},
"tooltip": {
"mode": "multi",
"sort": "desc"
}
},
"pluginVersion": "9.1.0",
"targets": [
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"editorMode": "code",
"expr": "sum(min_over_time(up{job=~\"$job\", instance=~\"$instance\"}[$__rate_interval])) by (job)",
"format": "time_series",
"instant": false,
"legendFormat": "{{job}}",
"refId": "A"
}
],
"title": "Uptime ($job)",
"type": "timeseries"
},
{
"collapsed": false,
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"gridPos": {
"h": 1,
"w": 24,
"x": 0,
"y": 12
},
"id": 10,
"panels": [],
"title": "Overview",
"type": "row"
},
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"description": "How many datapoints are inserted into cluster per second by protocol before the replication.",
"fieldConfig": {
"defaults": {
"color": {
"mode": "palette-classic"
},
"custom": {
"axisBorderShow": false,
"axisCenteredZero": false,
"axisColorMode": "text",
"axisLabel": "",
"axisPlacement": "auto",
"barAlignment": 0,
"drawStyle": "line",
"fillOpacity": 10,
"gradientMode": "none",
"hideFrom": {
"legend": false,
"tooltip": false,
"viz": false
},
"insertNulls": false,
"lineInterpolation": "linear",
"lineStyle": {
"fill": "solid"
},
"lineWidth": 1,
"pointSize": 5,
"scaleDistribution": {
"type": "linear"
},
"showPoints": "never",
"spanNulls": false,
"stacking": {
"group": "A",
"mode": "normal"
},
"thresholdsStyle": {
"mode": "off"
}
},
"links": [],
"mappings": [],
"min": 0,
"thresholds": {
"mode": "absolute",
"steps": [
{
"color": "green",
"value": null
},
{
"color": "red",
"value": 80
}
]
},
"unit": "short",
"unitScale": true
},
"overrides": []
},
"gridPos": {
"h": 8,
"w": 12,
"x": 0,
"y": 13
},
"id": 2,
"options": {
"legend": {
"calcs": [
"mean",
"lastNotNull",
"max"
],
"displayMode": "table",
"placement": "bottom",
"showLegend": true,
"sortBy": "Last *",
"sortDesc": true
},
"tooltip": {
"mode": "multi",
"sort": "none"
}
},
"pluginVersion": "9.1.0",
"targets": [
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"editorMode": "code",
"exemplar": true,
"expr": "sum(rate(vm_rows_inserted_total{job=~\"$job\", instance=~\"$instance\"}[$__rate_interval])) by (type) > 0 ",
"interval": "",
"legendFormat": "{{type}}",
"range": true,
"refId": "A"
}
],
"title": "Datapoints ingestion rate ($instance)",
"type": "timeseries"
},
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"description": "* `*` - unsupported query path\n* `/write` - insert into VM\n* `/metrics` - query VM system metrics\n* `/query` - query instant values\n* `/query_range` - query over a range of time\n* `/series` - match a certain label set\n* `/label/{}/values` - query a list of label values (variables mostly)",
"fieldConfig": {
"defaults": {
"color": {
"mode": "palette-classic"
},
"custom": {
"axisBorderShow": false,
"axisCenteredZero": false,
"axisColorMode": "text",
"axisLabel": "",
"axisPlacement": "auto",
"barAlignment": 0,
"drawStyle": "line",
"fillOpacity": 0,
"gradientMode": "none",
"hideFrom": {
"legend": false,
"tooltip": false,
"viz": false
},
"insertNulls": false,
"lineInterpolation": "linear",
"lineWidth": 1,
"pointSize": 5,
"scaleDistribution": {
"type": "linear"
},
"showPoints": "never",
"spanNulls": false,
"stacking": {
"group": "A",
"mode": "none"
},
"thresholdsStyle": {
"mode": "off"
}
},
"links": [],
"mappings": [],
"min": 0,
"thresholds": {
"mode": "absolute",
"steps": [
{
"color": "green",
"value": null
},
{
"color": "red",
"value": 80
}
]
},
"unit": "short",
"unitScale": true
},
"overrides": []
},
"gridPos": {
"h": 8,
"w": 12,
"x": 12,
"y": 13
},
"id": 6,
"links": [],
"options": {
"legend": {
"calcs": [
"mean",
"lastNotNull",
"max"
],
"displayMode": "table",
"placement": "bottom",
"showLegend": true,
"sortBy": "Last *",
"sortDesc": true
},
"tooltip": {
"mode": "multi",
"sort": "desc"
}
},
"pluginVersion": "9.1.0",
"targets": [
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"editorMode": "code",
"expr": "sum(rate(vm_http_requests_total{job=~\"$job\", instance=~\"$instance\"}[$__rate_interval])) by (path) > 0",
"format": "time_series",
"intervalFactor": 1,
"legendFormat": "{{path}}",
"range": true,
"refId": "A"
}
],
"title": "Requests rate ($instance)",
"type": "timeseries"
},
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"description": "Shows the number of active time series with new data points inserted during the last hour across all storage nodes. High value may result in ingestion slowdown. \n\nSee following link for details:",
"fieldConfig": {
"defaults": {
"color": {
"mode": "palette-classic"
},
"custom": {
"axisBorderShow": false,
"axisCenteredZero": false,
"axisColorMode": "text",
"axisLabel": "",
"axisPlacement": "auto",
"barAlignment": 0,
"drawStyle": "line",
"fillOpacity": 10,
"gradientMode": "none",
"hideFrom": {
"legend": false,
"tooltip": false,
"viz": false
},
"insertNulls": false,
"lineInterpolation": "linear",
"lineWidth": 1,
"pointSize": 5,
"scaleDistribution": {
"type": "linear"
},
"showPoints": "never",
"spanNulls": false,
"stacking": {
"group": "A",
"mode": "none"
},
"thresholdsStyle": {
"mode": "off"
}
},
"links": [],
"mappings": [],
"min": 0,
"thresholds": {
"mode": "absolute",
"steps": [
{
"color": "green",
"value": null
},
{
"color": "red",
"value": 80
}
]
},
"unit": "short",
"unitScale": true
},
"overrides": []
},
"gridPos": {
"h": 8,
"w": 12,
"x": 0,
"y": 21
},
"id": 12,
"links": [
{
"targetBlank": true,
"title": "troubleshooting",
"url": "https://github.com/VictoriaMetrics/VictoriaMetrics/blob/master/README.md#troubleshooting"
}
],
"options": {
"legend": {
"calcs": [
"mean",
"lastNotNull",
"max"
],
"displayMode": "table",
"placement": "bottom",
"showLegend": true,
"sortBy": "Last *",
"sortDesc": true
},
"tooltip": {
"mode": "multi",
"sort": "none"
}
},
"pluginVersion": "9.1.0",
"targets": [
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"expr": "sum(vm_cache_entries{job=~\"$job\", instance=~\"$instance\", type=\"storage/hour_metric_ids\"})",
"format": "time_series",
"intervalFactor": 1,
"legendFormat": "Active time series",
"refId": "A"
}
],
"title": "Active time series ($instance)",
"type": "timeseries"
},
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"description": "The less time it takes is better.\n* `*` - unsupported query path\n* `/write` - insert into VM\n* `/metrics` - query VM system metrics\n* `/query` - query instant values\n* `/query_range` - query over a range of time\n* `/series` - match a certain label set\n* `/label/{}/values` - query a list of label values (variables mostly)",
"fieldConfig": {
"defaults": {
"color": {
"mode": "palette-classic"
},
"custom": {
"axisBorderShow": false,
"axisCenteredZero": false,
"axisColorMode": "text",
"axisLabel": "",
"axisPlacement": "auto",
"barAlignment": 0,
"drawStyle": "line",
"fillOpacity": 10,
"gradientMode": "none",
"hideFrom": {
"legend": false,
"tooltip": false,
"viz": false
},
"insertNulls": false,
"lineInterpolation": "linear",
"lineWidth": 1,
"pointSize": 5,
"scaleDistribution": {
"type": "linear"
},
"showPoints": "never",
"spanNulls": false,
"stacking": {
"group": "A",
"mode": "none"
},
"thresholdsStyle": {
"mode": "off"
}
},
"links": [],
"mappings": [],
"min": 0,
"thresholds": {
"mode": "absolute",
"steps": [
{
"color": "green",
"value": null
},
{
"color": "red",
"value": 80
}
]
},
"unit": "s",
"unitScale": true
},
"overrides": []
},
"gridPos": {
"h": 8,
"w": 12,
"x": 12,
"y": 21
},
"id": 8,
"links": [],
"options": {
"legend": {
"calcs": [
"mean",
"lastNotNull",
"max"
],
"displayMode": "table",
"placement": "bottom",
"showLegend": true,
"sortBy": "Last *",
"sortDesc": true
},
"tooltip": {
"mode": "multi",
"sort": "desc"
}
},
"pluginVersion": "9.1.0",
"targets": [
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"editorMode": "code",
"expr": "max(vm_request_duration_seconds{job=~\"$job\", instance=~\"$instance\", quantile=\"0.99\"}) by (path) > 0",
"format": "time_series",
"intervalFactor": 1,
"legendFormat": "{{path}}",
"range": true,
"refId": "A"
}
],
"title": "Query duration 0.99 quantile ($instance)",
"type": "timeseries"
},
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"description": "* `*` - unsupported query path\n* `/write` - insert into VM\n* `/metrics` - query VM system metrics\n* `/query` - query instant values\n* `/query_range` - query over a range of time\n* `/series` - match a certain label set\n* `/label/{}/values` - query a list of label values (variables mostly)",
"fieldConfig": {
"defaults": {
"color": {
"mode": "palette-classic"
},
"custom": {
"axisBorderShow": false,
"axisCenteredZero": false,
"axisColorMode": "text",
"axisLabel": "",
"axisPlacement": "auto",
"barAlignment": 0,
"drawStyle": "line",
"fillOpacity": 10,
"gradientMode": "none",
"hideFrom": {
"legend": false,
"tooltip": false,
"viz": false
},
"insertNulls": false,
"lineInterpolation": "linear",
"lineWidth": 1,
"pointSize": 5,
"scaleDistribution": {
"type": "linear"
},
"showPoints": "never",
"spanNulls": false,
"stacking": {
"group": "A",
"mode": "none"
},
"thresholdsStyle": {
"mode": "off"
}
},
"links": [],
"mappings": [],
"min": 0,
"thresholds": {
"mode": "absolute",
"steps": [
{
"color": "green"
},
{
"color": "red",
"value": 80
}
]
},
"unit": "short",
"unitScale": true
},
"overrides": []
},
"gridPos": {
"h": 8,
"w": 12,
"x": 0,
"y": 29
},
"id": 52,
"links": [],
"options": {
"legend": {
"calcs": [
"mean",
"lastNotNull",
"max"
],
"displayMode": "table",
"placement": "bottom",
"showLegend": true,
"sortBy": "Last *",
"sortDesc": true
},
"tooltip": {
"mode": "multi",
"sort": "desc"
}
},
"pluginVersion": "9.1.0",
"targets": [
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"editorMode": "code",
"expr": "sum(rate(vm_http_request_errors_total{job=~\"$job\", instance=~\"$instance\"}[$__rate_interval])) by (job, path) > 0",
"format": "time_series",
"intervalFactor": 1,
"legendFormat": "{{path}} ({{job}})",
"range": true,
"refId": "A"
}
],
"title": "Requests error rate ($instance)",
"type": "timeseries"
},
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"description": "Shows the rate of logging the messages by their level. Unexpected spike in rate is a good reason to check logs.",
"fieldConfig": {
"defaults": {
"color": {
"mode": "palette-classic"
},
"custom": {
"axisBorderShow": false,
"axisCenteredZero": false,
"axisColorMode": "text",
"axisLabel": "",
"axisPlacement": "auto",
"barAlignment": 0,
"drawStyle": "bars",
"fillOpacity": 100,
"gradientMode": "none",
"hideFrom": {
"legend": false,
"tooltip": false,
"viz": false
},
"insertNulls": false,
"lineInterpolation": "linear",
"lineWidth": 1,
"pointSize": 5,
"scaleDistribution": {
"type": "linear"
},
"showPoints": "never",
"spanNulls": false,
"stacking": {
"group": "A",
"mode": "none"
},
"thresholdsStyle": {
"mode": "off"
}
},
"links": [
{
"targetBlank": true,
"title": "Drilldown",
"url": "/d/oS7Bi_0Wz?viewPanel=203&var-job=${__field.labels.job}&var-ds=$ds&var-instance=$instance&${__url_time_range}"
}
],
"mappings": [],
"min": 0,
"thresholds": {
"mode": "absolute",
"steps": [
{
"color": "green"
},
{
"color": "red",
"value": 80
}
]
},
"unit": "short",
"unitScale": true
},
"overrides": []
},
"gridPos": {
"h": 8,
"w": 12,
"x": 12,
"y": 29
},
"id": 104,
"links": [],
"options": {
"legend": {
"calcs": [
"mean",
"lastNotNull",
"max"
],
"displayMode": "table",
"placement": "bottom",
"showLegend": true,
"sortBy": "Last *",
"sortDesc": true
},
"tooltip": {
"mode": "multi",
"sort": "desc"
}
},
"pluginVersion": "9.1.0",
"targets": [
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"editorMode": "code",
"exemplar": true,
"expr": "sum(rate(vm_log_messages_total{job=~\"$job\",instance=~\"$instance\", level!=\"info\"}[$__rate_interval])) by (job, level) > 0",
"format": "time_series",
"hide": false,
"interval": "5m",
"intervalFactor": 1,
"legendFormat": "{{job}} - {{level}}",
"range": true,
"refId": "A"
}
],
"title": "Logging rate",
"type": "timeseries"
},
{
"collapsed": true,
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"gridPos": {
"h": 1,
"w": 24,
"x": 0,
"y": 37
},
"id": 46,
"panels": [
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"description": "Percentage of used RSS memory (resident).\nThe RSS memory shows the amount of memory recently accessed by the application. It includes anonymous memory and data from recently accessed files (aka page cache).\nThe application's performance will significantly degrade when memory usage is close to 100%.\n\nClick on the line and choose Drilldown to show memory usage per instance",
"fieldConfig": {
"defaults": {
"color": {
"mode": "palette-classic"
},
"custom": {
"axisBorderShow": false,
"axisCenteredZero": false,
"axisColorMode": "text",
"axisLabel": "",
"axisPlacement": "auto",
"barAlignment": 0,
"drawStyle": "line",
"fillOpacity": 0,
"gradientMode": "none",
"hideFrom": {
"legend": false,
"tooltip": false,
"viz": false
},
"insertNulls": false,
"lineInterpolation": "linear",
"lineWidth": 1,
"pointSize": 5,
"scaleDistribution": {
"type": "linear"
},
"showPoints": "never",
"spanNulls": false,
"stacking": {
"group": "A",
"mode": "none"
},
"thresholdsStyle": {
"mode": "off"
}
},
"links": [
{
"targetBlank": true,
"title": "Drilldown",
"url": "/d/oS7Bi_0Wz?viewPanel=189&var-job=${__field.labels.job}&var-ds=$ds&var-instance=$instance&${__url_time_range}"
}
],
"mappings": [],
"min": 0,
"thresholds": {
"mode": "absolute",
"steps": [
{
"color": "green",
"value": null
},
{
"color": "red",
"value": 80
}
]
},
"unit": "percentunit",
"unitScale": true
},
"overrides": []
},
"gridPos": {
"h": 8,
"w": 12,
"x": 0,
"y": 3
},
"id": 66,
"links": [],
"options": {
"legend": {
"calcs": [
"mean",
"lastNotNull",
"max"
],
"displayMode": "table",
"placement": "bottom",
"showLegend": true,
"sortBy": "Last *",
"sortDesc": true
},
"tooltip": {
"mode": "multi",
"sort": "desc"
}
},
"pluginVersion": "9.1.0",
"targets": [
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"editorMode": "code",
"exemplar": true,
"expr": "max(\n    max_over_time(process_resident_memory_bytes{job=~\"$job\", instance=~\"$instance\"}[$__rate_interval])\n    /\n    vm_available_memory_bytes{job=~\"$job\", instance=~\"$instance\"}\n) by(job)",
"interval": "",
"legendFormat": "__auto",
"range": true,
"refId": "A"
}
],
"title": "RSS memory % usage ($instance)",
"type": "timeseries"
},
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"description": "Share for memory allocated by the process itself. When memory usage reaches 100% it will be likely OOM-killed.\nSafe memory usage % considered to be below 80%\n\nClick on the line and choose Drilldown to show memory usage per instance",
"fieldConfig": {
"defaults": {
"color": {
"mode": "palette-classic"
},
"custom": {
"axisBorderShow": false,
"axisCenteredZero": false,
"axisColorMode": "text",
"axisLabel": "",
"axisPlacement": "auto",
"barAlignment": 0,
"drawStyle": "line",
"fillOpacity": 0,
"gradientMode": "none",
"hideFrom": {
"legend": false,
"tooltip": false,
"viz": false
},
"insertNulls": false,
"lineInterpolation": "linear",
"lineWidth": 1,
"pointSize": 5,
"scaleDistribution": {
"type": "linear"
},
"showPoints": "never",
"spanNulls": false,
"stacking": {
"group": "A",
"mode": "none"
},
"thresholdsStyle": {
"mode": "off"
}
},
"links": [
{
"targetBlank": true,
"title": "Drilldown",
"url": "/d/oS7Bi_0Wz?viewPanel=190&var-job=${__field.labels.job}&var-ds=$ds&var-instance=$instance&${__url_time_range}"
}
],
"mappings": [],
"min": 0,
"thresholds": {
"mode": "absolute",
"steps": [
{
"color": "green",
"value": null
},
{
"color": "red",
"value": 80
}
]
},
"unit": "percentunit",
"unitScale": true
},
"overrides": []
},
"gridPos": {
"h": 8,
"w": 12,
"x": 12,
"y": 3
},
"id": 138,
"links": [],
"options": {
"legend": {
"calcs": [
"mean",
"lastNotNull",
"max"
],
"displayMode": "table",
"placement": "bottom",
"showLegend": true,
"sortBy": "Last *",
"sortDesc": true
},
"tooltip": {
"mode": "multi",
"sort": "desc"
}
},
"pluginVersion": "9.1.0",
"targets": [
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"editorMode": "code",
"exemplar": true,
"expr": "max(\n    max_over_time(process_resident_memory_anon_bytes{job=~\"$job\", instance=~\"$instance\"}[$__rate_interval])\n    /\n    vm_available_memory_bytes{job=~\"$job\", instance=~\"$instance\"}\n) by(job)",
"interval": "",
"legendFormat": "__auto",
"range": true,
"refId": "A"
}
],
"title": "RSS anonymous memory % usage ($instance)",
"type": "timeseries"
},
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"fieldConfig": {
"defaults": {
"color": {
"mode": "palette-classic"
},
"custom": {
"axisBorderShow": false,
"axisCenteredZero": false,
"axisColorMode": "text",
"axisLabel": "",
"axisPlacement": "auto",
"barAlignment": 0,
"drawStyle": "line",
"fillOpacity": 0,
"gradientMode": "none",
"hideFrom": {
"legend": false,
"tooltip": false,
"viz": false
},
"insertNulls": false,
"lineInterpolation": "linear",
"lineWidth": 1,
"pointSize": 5,
"scaleDistribution": {
"type": "linear"
},
"showPoints": "never",
"spanNulls": false,
"stacking": {
"group": "A",
"mode": "none"
},
"thresholdsStyle": {
"mode": "off"
}
},
"links": [
{
"targetBlank": true,
"title": "Drilldown",
"url": "/d/oS7Bi_0Wz?viewPanel=192&var-job=${__field.labels.job}&var-ds=$ds&var-instance=$instance&${__url_time_range}"
}
],
"mappings": [],
"min": 0,
"thresholds": {
"mode": "absolute",
"steps": [
{
"color": "green",
"value": null
},
{
"color": "red",
"value": 80
}
]
},
"unit": "percentunit",
"unitScale": true
},
"overrides": []
},
"gridPos": {
"h": 8,
"w": 12,
"x": 0,
"y": 11
},
"id": 64,
"links": [],
"options": {
"legend": {
"calcs": [
"mean",
"lastNotNull",
"max"
],
"displayMode": "table",
"placement": "bottom",
"showLegend": true,
"sortBy": "Last *",
"sortDesc": true
},
"tooltip": {
"mode": "multi",
"sort": "none"
}
},
"pluginVersion": "9.1.0",
"targets": [
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"editorMode": "code",
"exemplar": true,
"expr": "max(\n    rate(process_cpu_seconds_total{job=~\"$job\", instance=~\"$instance\"}[$__rate_interval])\n    /\n    vm_available_cpu_cores{job=~\"$job\", instance=~\"$instance\"}\n) by(job)",
"format": "time_series",
"interval": "",
"intervalFactor": 1,
"legendFormat": "__auto",
"range": true,
"refId": "A"
}
],
"title": "CPU ($instance)",
"type": "timeseries"
},
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"description": "Shows the number of bytes read/write from the storage layer.",
"fieldConfig": {
"defaults": {
"color": {
"mode": "palette-classic"
},
"custom": {
"axisBorderShow": false,
"axisCenteredZero": false,
"axisColorMode": "text",
"axisLabel": "",
"axisPlacement": "auto",
"barAlignment": 0,
"drawStyle": "line",
"fillOpacity": 0,
"gradientMode": "none",
"hideFrom": {
"legend": false,
"tooltip": false,
"viz": false
},
"insertNulls": false,
"lineInterpolation": "linear",
"lineWidth": 1,
"pointSize": 5,
"scaleDistribution": {
"type": "linear"
},
"showPoints": "never",
"spanNulls": false,
"stacking": {
"group": "A",
"mode": "none"
},
"thresholdsStyle": {
"mode": "off"
}
},
"links": [],
"mappings": [],
"thresholds": {
"mode": "absolute",
"steps": [
{
"color": "green",
"value": null
},
{
"color": "red",
"value": 80
}
]
},
"unit": "Bps",
"unitScale": true
},
"overrides": [
{
"matcher": {
"id": "byRegexp",
"options": "/read .*/"
},
"properties": [
{
"id": "custom.transform",
"value": "negative-Y"
}
]
}
]
},
"gridPos": {
"h": 8,
"w": 12,
"x": 12,
"y": 11
},
"id": 122,
"links": [],
"options": {
"legend": {
"calcs": [
"mean",
"lastNotNull",
"max"
],
"displayMode": "table",
"placement": "bottom",
"showLegend": true,
"sortBy": "Last *",
"sortDesc": true
},
"tooltip": {
"mode": "multi",
"sort": "desc"
}
},
"pluginVersion": "9.1.0",
"targets": [
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"editorMode": "code",
"exemplar": true,
"expr": "sum(rate(process_io_storage_read_bytes_total{job=~\"$job\", instance=~\"$instance\"}[$__rate_interval])) by(job) > 0",
"format": "time_series",
"hide": false,
"interval": "",
"intervalFactor": 1,
"legendFormat": "read {{job}}",
"range": true,
"refId": "A"
},
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"editorMode": "code",
"expr": "sum(rate(process_io_storage_written_bytes_total{job=~\"$job\", instance=~\"$instance\"}[$__rate_interval])) by(job) > 0",
"format": "time_series",
"hide": false,
"interval": "",
"intervalFactor": 1,
"legendFormat": "write {{job}}",
"range": true,
"refId": "B"
}
],
"title": "Disk writes/reads ($instance)",
"type": "timeseries"
},
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"description": "Shows the percentage of open file descriptors compared to the limit set in the OS.\nReaching the limit of open files can cause various issues and must be prevented.\n\nSee how to change limits here https://medium.com/@muhammadtriwibowo/set-permanently-ulimit-n-open-files-in-ubuntu-4d61064429a",
"fieldConfig": {
"defaults": {
"color": {
"mode": "palette-classic"
},
"custom": {
"axisBorderShow": false,
"axisCenteredZero": false,
"axisColorMode": "text",
"axisLabel": "",
"axisPlacement": "auto",
"barAlignment": 0,
"drawStyle": "line",
"fillOpacity": 0,
"gradientMode": "none",
"hideFrom": {
"legend": false,
"tooltip": false,
"viz": false
},
"insertNulls": false,
"lineInterpolation": "linear",
"lineWidth": 1,
"pointSize": 5,
"scaleDistribution": {
"type": "linear"
},
"showPoints": "never",
"spanNulls": false,
"stacking": {
"group": "A",
"mode": "none"
},
"thresholdsStyle": {
"mode": "off"
}
},
"decimals": 2,
"links": [],
"mappings": [],
"min": 0,
"thresholds": {
"mode": "absolute",
"steps": [
{
"color": "green",
"value": null
},
{
"color": "red",
"value": 80
}
]
},
"unit": "percentunit",
"unitScale": true
},
"overrides": [
{
"matcher": {
"id": "byRegexp",
"options": "/max.*/"
},
"properties": [
{
"id": "color",
"value": {
"fixedColor": "#C4162A",
"mode": "fixed"
}
}
]
}
]
},
"gridPos": {
"h": 8,
"w": 12,
"x": 0,
"y": 19
},
"id": 117,
"links": [],
"options": {
"legend": {
"calcs": [
"mean",
"lastNotNull",
"max"
],
"displayMode": "table",
"placement": "bottom",
"showLegend": true,
"sortBy": "Last *",
"sortDesc": true
},
"tooltip": {
"mode": "multi",
"sort": "desc"
}
},
"pluginVersion": "9.1.0",
"targets": [
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"editorMode": "code",
"exemplar": true,
"expr": "max(\n    max_over_time(process_open_fds{job=~\"$job\", instance=~\"$instance\"}[$__rate_interval])\n    /\n    process_max_fds{job=~\"$job\", instance=~\"$instance\"}\n) by(job)",
"format": "time_series",
"interval": "",
"intervalFactor": 2,
"legendFormat": "{{job}}",
"range": true,
"refId": "A"
}
],
"title": "Open FDs usage % ($instance)",
"type": "timeseries"
},
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"description": "Shows the number of read/write syscalls such as read, pread, write, pwrite.",
"fieldConfig": {
"defaults": {
"color": {
"mode": "palette-classic"
},
"custom": {
"axisBorderShow": false,
"axisCenteredZero": false,
"axisColorMode": "text",
"axisLabel": "",
"axisPlacement": "auto",
"barAlignment": 0,
"drawStyle": "line",
"fillOpacity": 0,
"gradientMode": "none",
"hideFrom": {
"legend": false,
"tooltip": false,
"viz": false
},
"insertNulls": false,
"lineInterpolation": "linear",
"lineWidth": 1,
"pointSize": 5,
"scaleDistribution": {
"type": "linear"
},
"showPoints": "never",
"spanNulls": false,
"stacking": {
"group": "A",
"mode": "none"
},
"thresholdsStyle": {
"mode": "off"
}
},
"links": [],
"mappings": [],
"thresholds": {
"mode": "absolute",
"steps": [
{
"color": "green",
"value": null
},
{
"color": "red",
"value": 80
}
]
},
"unit": "short",
"unitScale": true
},
"overrides": [
{
"matcher": {
"id": "byRegexp",
"options": "/read .*/"
},
"properties": [
{
"id": "custom.transform",
"value": "negative-Y"
}
]
}
]
},
"gridPos": {
"h": 8,
"w": 12,
"x": 12,
"y": 19
},
"id": 204,
"links": [],
"options": {
"legend": {
"calcs": [
"mean",
"lastNotNull",
"max"
],
"displayMode": "table",
"placement": "bottom",
"showLegend": true,
"sortBy": "Last *",
"sortDesc": true
},
"tooltip": {
"mode": "multi",
"sort": "desc"
}
},
"pluginVersion": "9.1.0",
"targets": [
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"editorMode": "code",
"exemplar": true,
"expr": "sum(rate(process_io_read_syscalls_total{job=~\"$job\", instance=~\"$instance\"}[$__rate_interval])) by(job) > 0",
"format": "time_series",
"hide": false,
"interval": "",
"intervalFactor": 1,
"legendFormat": "read {{job}}",
"range": true,
"refId": "A"
},
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"editorMode": "code",
"expr": "sum(rate(process_io_write_syscalls_total{job=~\"$job\", instance=~\"$instance\"}[$__rate_interval])) by(job) > 0",
"format": "time_series",
"hide": false,
"interval": "",
"intervalFactor": 1,
"legendFormat": "write {{job}}",
"range": true,
"refId": "B"
}
],
"title": "Disk write/read calls ($instance)",
"type": "timeseries"
},
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"fieldConfig": {
"defaults": {
"color": {
"mode": "palette-classic"
},
"custom": {
"axisBorderShow": false,
"axisCenteredZero": false,
"axisColorMode": "text",
"axisLabel": "",
"axisPlacement": "auto",
"barAlignment": 0,
"drawStyle": "line",
"fillOpacity": 0,
"gradientMode": "none",
"hideFrom": {
"legend": false,
"tooltip": false,
"viz": false
},
"insertNulls": false,
"lineInterpolation": "linear",
"lineWidth": 1,
"pointSize": 5,
"scaleDistribution": {
"type": "linear"
},
"showPoints": "never",
"spanNulls": false,
"stacking": {
"group": "A",
"mode": "none"
},
"thresholdsStyle": {
"mode": "off"
}
},
"decimals": 0,
"links": [],
"mappings": [],
"min": 0,
"thresholds": {
"mode": "absolute",
"steps": [
{
"color": "green",
"value": null
},
{
"color": "red",
"value": 80
}
]
},
"unit": "short",
"unitScale": true
},
"overrides": []
},
"gridPos": {
"h": 8,
"w": 12,
"x": 0,
"y": 27
},
"id": 68,
"links": [],
"options": {
"legend": {
"calcs": [
"mean",
"lastNotNull",
"max"
],
"displayMode": "table",
"placement": "bottom",
"showLegend": true,
"sortBy": "Last *",
"sortDesc": true
},
"tooltip": {
"mode": "multi",
"sort": "desc"
}
},
"pluginVersion": "9.1.0",
"targets": [
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"editorMode": "code",
"exemplar": true,
"expr": "sum(max_over_time(go_goroutines{job=~\"$job\", instance=~\"$instance\"}[$__rate_interval])) by(job)",
"format": "time_series",
"interval": "",
"intervalFactor": 2,
"legendFormat": "__auto",
"range": true,
"refId": "A"
}
],
"title": "Goroutines ($instance)",
"type": "timeseries"
},
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"fieldConfig": {
"defaults": {
"color": {
"mode": "palette-classic"
},
"custom": {
"axisBorderShow": false,
"axisCenteredZero": false,
"axisColorMode": "text",
"axisLabel": "",
"axisPlacement": "auto",
"barAlignment": 0,
"drawStyle": "line",
"fillOpacity": 0,
"gradientMode": "none",
"hideFrom": {
"legend": false,
"tooltip": false,
"viz": false
},
"insertNulls": false,
"lineInterpolation": "linear",
"lineWidth": 1,
"pointSize": 5,
"scaleDistribution": {
"type": "linear"
},
"showPoints": "never",
"spanNulls": false,
"stacking": {
"group": "A",
"mode": "none"
},
"thresholdsStyle": {
"mode": "off"
}
},
"mappings": [],
"thresholds": {
"mode": "absolute",
"steps": [
{
"color": "green",
"value": null
},
{
"color": "red",
"value": 80
}
]
},
"unit": "short",
"unitScale": true
},
"overrides": []
},
"gridPos": {
"h": 8,
"w": 12,
"x": 12,
"y": 27
},
"id": 119,
"options": {
"legend": {
"calcs": [
"mean",
"lastNotNull",
"max"
],
"displayMode": "table",
"placement": "bottom",
"showLegend": true,
"sortBy": "Last *",
"sortDesc": true
},
"tooltip": {
"mode": "multi",
"sort": "desc"
}
},
"pluginVersion": "9.1.0",
"targets": [
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"editorMode": "code",
"exemplar": true,
"expr": "sum(max_over_time(vm_tcplistener_conns{job=~\"$job\", instance=~\"$instance\"}[$__interval])) by(job)",
"interval": "",
"legendFormat": "{{job}}",
"range": true,
"refId": "A"
}
],
"title": "TCP connections ($instance)",
"type": "timeseries"
},
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"fieldConfig": {
"defaults": {
"color": {
"mode": "palette-classic"
},
"custom": {
"axisBorderShow": false,
"axisCenteredZero": false,
"axisColorMode": "text",
"axisLabel": "",
"axisPlacement": "auto",
"barAlignment": 0,
"drawStyle": "line",
"fillOpacity": 0,
"gradientMode": "none",
"hideFrom": {
"legend": false,
"tooltip": false,
"viz": false
},
"insertNulls": false,
"lineInterpolation": "linear",
"lineWidth": 1,
"pointSize": 5,
"scaleDistribution": {
"type": "linear"
},
"showPoints": "never",
"spanNulls": false,
"stacking": {
"group": "A",
"mode": "none"
},
"thresholdsStyle": {
"mode": "off"
}
},
"decimals": 0,
"links": [],
"mappings": [],
"min": 0,
"thresholds": {
"mode": "absolute",
"steps": [
{
"color": "green",
"value": null
},
{
"color": "red",
"value": 80
}
]
},
"unit": "short",
"unitScale": true
},
"overrides": []
},
"gridPos": {
"h": 8,
"w": 12,
"x": 0,
"y": 35
},
"id": 70,
"links": [],
"options": {
"legend": {
"calcs": [
"mean",
"lastNotNull",
"max"
],
"displayMode": "table",
"placement": "bottom",
"showLegend": true,
"sortBy": "Last *",
"sortDesc": true
},
"tooltip": {
"mode": "multi",
"sort": "desc"
}
},
"pluginVersion": "9.1.0",
"targets": [
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"editorMode": "code",
"exemplar": true,
"expr": "sum(max_over_time(process_num_threads{job=~\"$job\", instance=~\"$instance\"}[$__rate_interval])) by(job)",
"format": "time_series",
"interval": "",
"intervalFactor": 2,
"legendFormat": "__auto",
"range": true,
"refId": "A"
}
],
"title": "Threads ($instance)",
"type": "timeseries"
},
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"fieldConfig": {
"defaults": {
"color": {
"mode": "palette-classic"
},
"custom": {
"axisBorderShow": false,
"axisCenteredZero": false,
"axisColorMode": "text",
"axisLabel": "",
"axisPlacement": "auto",
"barAlignment": 0,
"drawStyle": "line",
"fillOpacity": 0,
"gradientMode": "none",
"hideFrom": {
"legend": false,
"tooltip": false,
"viz": false
},
"insertNulls": false,
"lineInterpolation": "linear",
"lineWidth": 1,
"pointSize": 5,
"scaleDistribution": {
"type": "linear"
},
"showPoints": "never",
"spanNulls": false,
"stacking": {
"group": "A",
"mode": "none"
},
"thresholdsStyle": {
"mode": "off"
}
},
"mappings": [],
"thresholds": {
"mode": "absolute",
"steps": [
{
"color": "green",
"value": null
},
{
"color": "red",
"value": 80
}
]
},
"unit": "short",
"unitScale": true
},
"overrides": []
},
"gridPos": {
"h": 8,
"w": 12,
"x": 12,
"y": 35
},
"id": 120,
"options": {
"legend": {
"calcs": [
"mean",
"lastNotNull",
"max"
],
"displayMode": "table",
"placement": "bottom",
"showLegend": true,
"sortBy": "Last *",
"sortDesc": true
},
"tooltip": {
"mode": "multi",
"sort": "desc"
}
},
"pluginVersion": "9.1.0",
"targets": [
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"editorMode": "code",
"exemplar": true,
"expr": "sum(rate(vm_tcplistener_accepts_total{job=~\"$job\", instance=~\"$instance\"}[$__rate_interval])) by(job)",
"interval": "",
"legendFormat": "__auto",
"range": true,
"refId": "A"
}
],
"title": "TCP connections rate ($instance)",
"type": "timeseries"
},
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"description": "Shows the percent of CPU spent on garbage collection.\n\nIf % is high, then CPU usage can be decreased by changing GOGC to higher values. Increasing GOGC value will increase memory usage, and decrease CPU usage.\n\nTry searching for keyword `GOGC` at https://docs.victoriametrics.com/troubleshooting/ ",
"fieldConfig": {
"defaults": {
"color": {
"mode": "palette-classic"
},
"custom": {
"axisBorderShow": false,
"axisCenteredZero": false,
"axisColorMode": "text",
"axisLabel": "",
"axisPlacement": "auto",
"barAlignment": 0,
"drawStyle": "line",
"fillOpacity": 0,
"gradientMode": "none",
"hideFrom": {
"legend": false,
"tooltip": false,
"viz": false
},
"insertNulls": false,
"lineInterpolation": "linear",
"lineWidth": 1,
"pointSize": 5,
"scaleDistribution": {
"type": "linear"
},
"showPoints": "never",
"spanNulls": false,
"stacking": {
"group": "A",
"mode": "none"
},
"thresholdsStyle": {
"mode": "off"
}
},
"decimals": 0,
"links": [],
"mappings": [],
"min": 0,
"thresholds": {
"mode": "absolute",
"steps": [
{
"color": "green",
"value": null
},
{
"color": "red",
"value": 80
}
]
},
"unit": "percentunit",
"unitScale": true
},
"overrides": []
},
"gridPos": {
"h": 8,
"w": 12,
"x": 0,
"y": 43
},
"id": 210,
"links": [],
"options": {
"legend": {
"calcs": [
"mean",
"lastNotNull",
"max"
],
"displayMode": "table",
"placement": "bottom",
"showLegend": true
},
"tooltip": {
"mode": "multi",
"sort": "desc"
}
},
"pluginVersion": "9.2.6",
"targets": [
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"editorMode": "code",
"expr": "max(\n  rate(go_gc_cpu_seconds_total{job=~\"$job\", instance=~\"$instance\"}[$__rate_interval]) \n / rate(process_cpu_seconds_total{job=~\"$job\", instance=~\"$instance\"}[$__rate_interval])\n ) by(job)",
"format": "time_series",
"interval": "",
"intervalFactor": 2,
"legendFormat": "__auto",
"range": true,
"refId": "A"
}
],
"title": "CPU spent on GC ($instance)",
"type": "timeseries"
}
],
"title": "Resource usage ($job)",
"type": "row"
},
{
"collapsed": true,
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"gridPos": {
"h": 1,
"w": 24,
"x": 0,
"y": 38
},
"id": 106,
"panels": [
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"description": "Shows the rate and total number of new series created over last 24h.\n\nHigh churn rate tightly connected with database performance and may result in unexpected OOM's or slow queries. It is recommended to always keep an eye on this metric to avoid unexpected cardinality \"explosions\".\n\nThe higher churn rate is, the more resources required to handle it. Consider to keep the churn rate as low as possible.\n\nTo investigate stats about most expensive series use `api/v1/status/tsdb` handler. More details here https://docs.victoriametrics.com/Cluster-VictoriaMetrics.html#url-format\n\nGood references to read:\n* https://www.robustperception.io/cardinality-is-key\n* https://valyala.medium.com/high-cardinality-tsdb-benchmarks-victoriametrics-vs-timescaledb-vs-influxdb-13e6ee64dd6b",
"fieldConfig": {
"defaults": {
"color": {
"mode": "palette-classic"
},
"custom": {
"axisCenteredZero": false,
"axisColorMode": "text",
"axisLabel": "",
"axisPlacement": "auto",
"barAlignment": 0,
"drawStyle": "line",
"fillOpacity": 0,
"gradientMode": "none",
"hideFrom": {
"legend": false,
"tooltip": false,
"viz": false
},
"lineInterpolation": "linear",
"lineWidth": 1,
"pointSize": 5,
"scaleDistribution": {
"type": "linear"
},
"showPoints": "never",
"spanNulls": false,
"stacking": {
"group": "A",
"mode": "none"
},
"thresholdsStyle": {
"mode": "off"
}
},
"links": [],
"mappings": [],
"min": 0,
"thresholds": {
"mode": "absolute",
"steps": [
{
"color": "green"
},
{
"color": "red",
"value": 80
}
]
},
"unit": "short"
},
"overrides": [
{
"matcher": {
"id": "byName",
"options": "new series over 24h"
},
"properties": [
{
"id": "custom.axisPlacement",
"value": "right"
},
{
"id": "custom.axisSoftMin",
"value": 0
}
]
}
]
},
"gridPos": {
"h": 8,
"w": 12,
"x": 0,
"y": 23
},
"id": 102,
"options": {
"legend": {
"calcs": [
"mean",
"lastNotNull",
"max"
],
"displayMode": "table",
"placement": "bottom",
"showLegend": true,
"sortBy": "Last *",
"sortDesc": true
},
"tooltip": {
"mode": "multi",
"sort": "none"
}
},
"pluginVersion": "9.1.0",
"targets": [
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"exemplar": true,
"expr": "sum(rate(vm_new_timeseries_created_total{job=~\"$job_storage\", instance=~\"$instance\"}[$__rate_interval]))",
"interval": "",
"legendFormat": "churn rate",
"refId": "A"
},
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"exemplar": true,
"expr": "sum(increase(vm_new_timeseries_created_total{job=~\"$job_storage\", instance=~\"$instance\"}[24h]))",
"hide": false,
"interval": "",
"legendFormat": "new series over 24h",
"refId": "B"
}
],
"title": "Churn rate ($instance)",
"type": "timeseries"
},
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"description": "The percentage of slow inserts comparing to total insertion rate during the last 5 minutes. \n\nThe less value is better. If percentage remains high (>10%) during extended periods of time, then it is likely more RAM is needed for optimal handling of the current number of active time series. \n\nIn general, VictoriaMetrics requires ~1KB or RAM per active time series, so it should be easy calculating the required amounts of RAM for the current workload according to capacity planning docs. But the resulting number may be far from the real number because the required amounts of memory depends on many other factors such as the number of labels per time series and the length of label values. See also https://github.com/VictoriaMetrics/VictoriaMetrics/issues/3976#issuecomment-1476883183",
"fieldConfig": {
"defaults": {
"color": {
"mode": "palette-classic"
},
"custom": {
"axisCenteredZero": false,
"axisColorMode": "text",
"axisLabel": "",
"axisPlacement": "auto",
"barAlignment": 0,
"drawStyle": "line",
"fillOpacity": 10,
"gradientMode": "none",
"hideFrom": {
"legend": false,
"tooltip": false,
"viz": false
},
"lineInterpolation": "linear",
"lineWidth": 1,
"pointSize": 5,
"scaleDistribution": {
"type": "linear"
},
"showPoints": "never",
"spanNulls": false,
"stacking": {
"group": "A",
"mode": "none"
},
"thresholdsStyle": {
"mode": "line+area"
}
},
"links": [],
"mappings": [],
"min": 0,
"thresholds": {
"mode": "absolute",
"steps": [
{
"color": "transparent"
},
{
"color": "red",
"value": 0.1
}
]
},
"unit": "percentunit"
},
"overrides": []
},
"gridPos": {
"h": 8,
"w": 12,
"x": 12,
"y": 23
},
"id": 108,
"options": {
"legend": {
"calcs": [
"mean",
"lastNotNull",
"max"
],
"displayMode": "table",
"placement": "bottom",
"showLegend": true
},
"tooltip": {
"mode": "multi",
"sort": "none"
}
},
"pluginVersion": "9.1.0",
"targets": [
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"editorMode": "code",
"expr": "max(\n    rate(vm_slow_row_inserts_total{job=~\"$job_storage\"}[$__rate_interval]) \n    / rate(vm_rows_added_to_storage_total{job=~\"$job_storage\"}[$__rate_interval])\n)",
"interval": "",
"legendFormat": "slow inserts",
"range": true,
"refId": "A"
}
],
"title": "Slow inserts",
"type": "timeseries"
},
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"description": "The value is above 0 when the vmstorage at the given `addr` communicates to the given vminsert node that it cannot accept new data because it is in the read-only mode.",
"fieldConfig": {
"defaults": {
"color": {
"mode": "palette-classic"
},
"custom": {
"axisCenteredZero": false,
"axisColorMode": "text",
"axisLabel": "",
"axisPlacement": "auto",
"barAlignment": 0,
"drawStyle": "line",
"fillOpacity": 10,
"gradientMode": "none",
"hideFrom": {
"legend": false,
"tooltip": false,
"viz": false
},
"lineInterpolation": "linear",
"lineWidth": 1,
"pointSize": 5,
"scaleDistribution": {
"type": "linear"
},
"showPoints": "never",
"spanNulls": false,
"stacking": {
"group": "A",
"mode": "none"
},
"thresholdsStyle": {
"mode": "off"
}
},
"links": [],
"mappings": [],
"min": 0,
"thresholds": {
"mode": "absolute",
"steps": [
{
"color": "green"
},
{
"color": "red",
"value": 80
}
]
},
"unit": "short"
},
"overrides": []
},
"gridPos": {
"h": 8,
"w": 12,
"x": 0,
"y": 31
},
"id": 142,
"links": [
{
"targetBlank": true,
"title": "Readonly mode",
"url": "https://docs.victoriametrics.com/Cluster-VictoriaMetrics.html#readonly-mode"
}
],
"options": {
"legend": {
"calcs": [
"mean",
"lastNotNull",
"max"
],
"displayMode": "table",
"placement": "bottom",
"showLegend": true
},
"tooltip": {
"mode": "multi",
"sort": "none"
}
},
"pluginVersion": "9.1.0",
"targets": [
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"editorMode": "code",
"exemplar": true,
"expr": "sum(vm_rpc_vmstorage_is_read_only{job=~\"$job_insert\", instance=~\"$instance\"}) by(instance, addr) > 0",
"format": "time_series",
"interval": "",
"intervalFactor": 1,
"legendFormat": "{{instance}} => {{addr}}",
"range": true,
"refId": "A"
}
],
"title": "Storage in readonly status for vminsert ($instance)",
"type": "timeseries"
},
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"description": "Shows % of slow queries according to `search.logSlowQueryDuration` flag, which is `5s` by default.\n\nThe less value is better.",
"fieldConfig": {
"defaults": {
"color": {
"mode": "palette-classic"
},
"custom": {
"axisCenteredZero": false,
"axisColorMode": "text",
"axisLabel": "",
"axisPlacement": "auto",
"axisSoftMin": 0,
"barAlignment": 0,
"drawStyle": "line",
"fillOpacity": 10,
"gradientMode": "none",
"hideFrom": {
"legend": false,
"tooltip": false,
"viz": false
},
"lineInterpolation": "linear",
"lineWidth": 1,
"pointSize": 5,
"scaleDistribution": {
"type": "linear"
},
"showPoints": "never",
"spanNulls": false,
"stacking": {
"group": "A",
"mode": "none"
},
"thresholdsStyle": {
"mode": "off"
}
},
"links": [],
"mappings": [],
"min": 0,
"thresholds": {
"mode": "absolute",
"steps": [
{
"color": "green"
},
{
"color": "red",
"value": 80
}
]
},
"unit": "percentunit"
},
"overrides": []
},
"gridPos": {
"h": 8,
"w": 12,
"x": 12,
"y": 31
},
"id": 107,
"options": {
"legend": {
"calcs": [
"mean",
"lastNotNull",
"max"
],
"displayMode": "table",
"placement": "bottom",
"showLegend": true
},
"tooltip": {
"mode": "multi",
"sort": "none"
}
},
"pluginVersion": "9.1.0",
"targets": [
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"editorMode": "code",
"expr": "sum(rate(vm_slow_queries_total{job=~\"$job_select\", instance=~\"$instance\"}[$__rate_interval]))\n/\nsum(rate(vm_http_requests_total{job=~\"$job_select\", instance=~\"$instance\", path=~\"/select/.*\"}[$__rate_interval]))",
"interval": "",
"legendFormat": "slow queries %",
"range": true,
"refId": "A"
}
],
"title": "Slow queries % ($instance)",
"type": "timeseries"
},
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"description": "Merge assist happens when vmstorage can't keep up with merging parts. This is usually a sign of overload for vmstorage.",
"fieldConfig": {
"defaults": {
"color": {
"mode": "palette-classic"
},
"custom": {
"axisCenteredZero": false,
"axisColorMode": "text",
"axisLabel": "",
"axisPlacement": "auto",
"barAlignment": 0,
"drawStyle": "bars",
"fillOpacity": 100,
"gradientMode": "none",
"hideFrom": {
"legend": false,
"tooltip": false,
"viz": false
},
"lineInterpolation": "linear",
"lineWidth": 1,
"pointSize": 5,
"scaleDistribution": {
"type": "linear"
},
"showPoints": "never",
"spanNulls": false,
"stacking": {
"group": "A",
"mode": "none"
},
"thresholdsStyle": {
"mode": "off"
}
},
"links": [],
"mappings": [],
"min": 0,
"thresholds": {
"mode": "absolute",
"steps": [
{
"color": "green"
},
{
"color": "red",
"value": 80
}
]
},
"unit": "short"
},
"overrides": []
},
"gridPos": {
"h": 8,
"w": 12,
"x": 0,
"y": 39
},
"id": 170,
"links": [],
"options": {
"legend": {
"calcs": [
"mean",
"lastNotNull",
"max"
],
"displayMode": "table",
"placement": "bottom",
"showLegend": true
},
"tooltip": {
"mode": "multi",
"sort": "desc"
}
},
"pluginVersion": "9.1.0",
"targets": [
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"editorMode": "code",
"exemplar": true,
"expr": "sum(increase(vm_assisted_merges_total{job=~\"$job_storage\", instance=~\"$instance\"}[$__rate_interval])) by(type) > 0",
"format": "time_series",
"interval": "5m",
"intervalFactor": 1,
"legendFormat": "__auto",
"range": true,
"refId": "A"
}
],
"title": "Assisted merges ($instance)",
"type": "timeseries"
},
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"description": "VictoriaMetrics limits the number of labels per each metric with `-maxLabelsPerTimeseries` command-line flag.\n\nThis prevents from ingesting metrics with too many labels. The value of `maxLabelsPerTimeseries` must be adjusted for your workload.\n\nWhen limit is exceeded (graph is > 0) - extra labels are dropped, which could result in unexpected identical time series. See more details about dropped labels in vminsert logs.",
"fieldConfig": {
"defaults": {
"color": {
"mode": "palette-classic"
},
"custom": {
"axisCenteredZero": false,
"axisColorMode": "text",
"axisLabel": "",
"axisPlacement": "auto",
"barAlignment": 0,
"drawStyle": "line",
"fillOpacity": 10,
"gradientMode": "none",
"hideFrom": {
"legend": false,
"tooltip": false,
"viz": false
},
"lineInterpolation": "linear",
"lineWidth": 1,
"pointSize": 5,
"scaleDistribution": {
"type": "linear"
},
"showPoints": "never",
"spanNulls": false,
"stacking": {
"group": "A",
"mode": "none"
},
"thresholdsStyle": {
"mode": "off"
}
},
"decimals": 2,
"links": [],
"mappings": [],
"min": 0,
"thresholds": {
"mode": "absolute",
"steps": [
{
"color": "green"
},
{
"color": "red",
"value": 80
}
]
},
"unit": "short"
},
"overrides": []
},
"gridPos": {
"h": 8,
"w": 12,
"x": 12,
"y": 39
},
"id": 116,
"links": [],
"options": {
"legend": {
"calcs": [
"mean",
"lastNotNull",
"max"
],
"displayMode": "table",
"placement": "bottom",
"showLegend": true
},
"tooltip": {
"mode": "multi",
"sort": "none"
}
},
"pluginVersion": "9.1.0",
"targets": [
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"exemplar": true,
"expr": "sum(increase(vm_metrics_with_dropped_labels_total{job=~\"$job_insert\", instance=~\"$instance\"}[$__rate_interval]))",
"format": "time_series",
"hide": false,
"interval": "",
"intervalFactor": 1,
"legendFormat": "metrics with dropped labels",
"refId": "A"
}
],
"title": "Labels limit exceeded ($instance)",
"type": "timeseries"
},
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"description": "Shows the percentage of used cache size from the allowed size by type. \nValues close to 100% show the maximum potential utilization.\nValues close to 0% show that cache is underutilized.",
"fieldConfig": {
"defaults": {
"color": {
"mode": "palette-classic"
},
"custom": {
"axisCenteredZero": false,
"axisColorMode": "text",
"axisLabel": "",
"axisPlacement": "auto",
"barAlignment": 0,
"drawStyle": "line",
"fillOpacity": 0,
"gradientMode": "none",
"hideFrom": {
"legend": false,
"tooltip": false,
"viz": false
},
"lineInterpolation": "linear",
"lineWidth": 1,
"pointSize": 5,
"scaleDistribution": {
"type": "linear"
},
"showPoints": "never",
"spanNulls": false,
"stacking": {
"group": "A",
"mode": "none"
},
"thresholdsStyle": {
"mode": "off"
}
},
"mappings": [],
"thresholds": {
"mode": "absolute",
"steps": [
{
"color": "green"
},
{
"color": "red",
"value": 80
}
]
},
"unit": "percentunit"
},
"overrides": []
},
"gridPos": {
"h": 9,
"w": 12,
"x": 0,
"y": 47
},
"id": 144,
"options": {
"legend": {
"calcs": [
"mean",
"lastNotNull",
"max"
],
"displayMode": "table",
"placement": "bottom",
"showLegend": true
},
"tooltip": {
"mode": "multi",
"sort": "desc"
}
},
"pluginVersion": "9.1.0",
"targets": [
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"editorMode": "code",
"exemplar": true,
"expr": "max(\n    vm_cache_size_bytes{job=~\"$job\", instance=~\"$instance\"} \n    /\n    vm_cache_size_max_bytes{job=~\"$job\", instance=~\"$instance\"}\n) by(type)",
"interval": "",
"legendFormat": "__auto",
"range": true,
"refId": "A"
}
],
"title": "Cache usage % by type ($instance)",
"type": "timeseries"
},
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"description": "Shows cache miss ratio. Lower is better.",
"fieldConfig": {
"defaults": {
"color": {
"mode": "palette-classic"
},
"custom": {
"axisCenteredZero": false,
"axisColorMode": "text",
"axisLabel": "",
"axisPlacement": "auto",
"barAlignment": 0,
"drawStyle": "line",
"fillOpacity": 0,
"gradientMode": "none",
"hideFrom": {
"legend": false,
"tooltip": false,
"viz": false
},
"lineInterpolation": "linear",
"lineWidth": 1,
"pointSize": 5,
"scaleDistribution": {
"type": "linear"
},
"showPoints": "never",
"spanNulls": false,
"stacking": {
"group": "A",
"mode": "none"
},
"thresholdsStyle": {
"mode": "off"
}
},
"links": [],
"mappings": [],
"max": 1,
"min": 0,
"thresholds": {
"mode": "absolute",
"steps": [
{
"color": "green"
},
{
"color": "red",
"value": 80
}
]
},
"unit": "percentunit"
},
"overrides": []
},
"gridPos": {
"h": 9,
"w": 12,
"x": 12,
"y": 47
},
"id": 58,
"links": [],
"options": {
"legend": {
"calcs": [
"mean",
"lastNotNull",
"max"
],
"displayMode": "table",
"placement": "bottom",
"showLegend": true,
"sortBy": "Last *",
"sortDesc": true
},
"tooltip": {
"mode": "multi",
"sort": "desc"
}
},
"pluginVersion": "9.1.0",
"targets": [
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"editorMode": "code",
"exemplar": true,
"expr": "max(\n    rate(vm_cache_misses_total{job=~\"$job\", instance=~\"$instance\"}[$__rate_interval])\n    /\n    rate(vm_cache_requests_total{job=~\"$job\", instance=~\"$instance\"}[$__rate_interval])\n) by(type)",
"format": "time_series",
"hide": false,
"interval": "",
"intervalFactor": 1,
"legendFormat": "__auto",
"range": true,
"refId": "A"
}
],
"title": "Cache miss ratio ($instance)",
"type": "timeseries"
},
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"fieldConfig": {
"defaults": {
"color": {
"mode": "thresholds"
},
"custom": {
"align": "auto",
"cellOptions": {
"type": "auto"
},
"inspect": false
},
"mappings": [],
"thresholds": {
"mode": "absolute",
"steps": [
{
"color": "green"
},
{
"color": "red",
"value": 80
}
]
}
},
"overrides": [
{
"matcher": {
"id": "byName",
"options": "Value"
},
"properties": [
{
"id": "custom.hidden",
"value": true
}
]
},
{
"matcher": {
"id": "byName",
"options": "Time"
},
"properties": [
{
"id": "custom.hidden",
"value": true
}
]
}
]
},
"gridPos": {
"h": 6,
"w": 24,
"x": 0,
"y": 56
},
"id": 183,
"options": {
"footer": {
"fields": "",
"reducer": [
"sum"
],
"show": false
},
"showHeader": true,
"sortBy": [
{
"desc": true,
"displayName": "job"
}
]
},
"pluginVersion": "9.2.7",
"targets": [
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"editorMode": "code",
"exemplar": false,
"expr": "sum(flag{is_set=\"true\", job=~\"$job\", instance=~\"$instance\"}) by(job, instance, name, value)",
"format": "table",
"instant": true,
"legendFormat": "__auto",
"range": false,
"refId": "A"
}
],
"title": "Non-default flags",
"transformations": [
{
"id": "groupBy",
"options": {
"fields": {
"instance": {
"aggregations": [
"uniqueValues"
],
"operation": "aggregate"
},
"job": {
"aggregations": [],
"operation": "groupby"
},
"name": {
"aggregations": [],
"operation": "groupby"
},
"value": {
"aggregations": [],
"operation": "groupby"
}
}
}
}
],
"type": "table"
},
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"description": "Shows how many rows were ignored on insertion due to corrupted or out of retention timestamps.",
"fieldConfig": {
"defaults": {
"color": {
"mode": "palette-classic"
},
"custom": {
"axisCenteredZero": false,
"axisColorMode": "text",
"axisLabel": "",
"axisPlacement": "auto",
"barAlignment": 0,
"drawStyle": "line",
"fillOpacity": 0,
"gradientMode": "none",
"hideFrom": {
"legend": false,
"tooltip": false,
"viz": false
},
"lineInterpolation": "linear",
"lineWidth": 1,
"pointSize": 5,
"scaleDistribution": {
"type": "linear"
},
"showPoints": "never",
"spanNulls": false,
"stacking": {
"group": "A",
"mode": "none"
},
"thresholdsStyle": {
"mode": "off"
}
},
"mappings": [],
"thresholds": {
"mode": "absolute",
"steps": [
{
"color": "green"
},
{
"color": "red",
"value": 80
}
]
},
"unit": "short"
},
"overrides": []
},
"gridPos": {
"h": 8,
"w": 12,
"x": 0,
"y": 62
},
"id": 135,
"options": {
"legend": {
"calcs": [
"mean",
"lastNotNull",
"max"
],
"displayMode": "table",
"placement": "bottom",
"showLegend": true,
"sortBy": "Last *",
"sortDesc": true
},
"tooltip": {
"mode": "multi",
"sort": "none"
}
},
"pluginVersion": "9.1.0",
"targets": [
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"editorMode": "code",
"exemplar": true,
"expr": "sum(increase(vm_rows_ignored_total{job=~\"$job_storage\", instance=~\"$instance\"}[1h])) by (reason)",
"interval": "",
"legendFormat": "__auto",
"range": true,
"refId": "A"
}
],
"title": "Rows ignored for last 1h ($instance)",
"type": "timeseries"
}
],
"title": "Troubleshooting",
"type": "row"
},
{
"collapsed": true,
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"gridPos": {
"h": 1,
"w": 24,
"x": 0,
"y": 39
},
"id": 48,
"panels": [
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"description": "Shows number of pushed and sent rows. \n* `Pushed rows` - rows added to internal inserter buffers before send\n* `Sent rows` - successfully transmitted rows to storage nodes\n\nPlease note, it could be that `Sent > Pushed` because of the replication factor.",
"fieldConfig": {
"defaults": {
"color": {
"mode": "palette-classic"
},
"custom": {
"axisCenteredZero": false,
"axisColorMode": "text",
"axisLabel": "",
"axisPlacement": "auto",
"barAlignment": 0,
"drawStyle": "line",
"fillOpacity": 0,
"gradientMode": "none",
"hideFrom": {
"legend": false,
"tooltip": false,
"viz": false
},
"lineInterpolation": "linear",
"lineWidth": 1,
"pointSize": 5,
"scaleDistribution": {
"type": "linear"
},
"showPoints": "never",
"spanNulls": false,
"stacking": {
"group": "A",
"mode": "none"
},
"thresholdsStyle": {
"mode": "off"
}
},
"links": [],
"mappings": [],
"min": 0,
"thresholds": {
"mode": "absolute",
"steps": [
{
"color": "green"
},
{
"color": "red",
"value": 80
}
]
},
"unit": "short"
},
"overrides": []
},
"gridPos": {
"h": 9,
"w": 12,
"x": 0,
"y": 37
},
"id": 76,
"links": [],
"options": {
"legend": {
"calcs": [
"mean",
"lastNotNull",
"max"
],
"displayMode": "table",
"placement": "bottom",
"showLegend": true
},
"tooltip": {
"mode": "multi",
"sort": "none"
}
},
"pluginVersion": "9.1.0",
"targets": [
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"editorMode": "code",
"expr": "sum(rate(vm_rpc_rows_pushed_total{job=~\"$job\",instance=~\"$instance\"}[$__rate_interval]))",
"format": "time_series",
"intervalFactor": 1,
"legendFormat": "Pushed",
"range": true,
"refId": "B"
},
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"editorMode": "code",
"expr": "sum(rate(vm_rpc_rows_sent_total{job=~\"$job\",instance=~\"$instance\"}[$__rate_interval]))",
"format": "time_series",
"intervalFactor": 1,
"legendFormat": "Sent",
"range": true,
"refId": "E"
}
],
"title": "Rows ($instance)",
"type": "timeseries"
},
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"description": "Rate of RPC errors by type:\n* `Connection` - the number of connection errors to vmstorage node\n* `Dial` -  the number of dial errors to vmstorage node.\n* `Handshake` - the number of handshake errors to vmstorage node\n* `Rerouted` - errors appeared during rerouting of rows from un-healthy storage node to a healthy one.",
"fieldConfig": {
"defaults": {
"color": {
"mode": "palette-classic"
},
"custom": {
"axisCenteredZero": false,
"axisColorMode": "text",
"axisLabel": "",
"axisPlacement": "auto",
"barAlignment": 0,
"drawStyle": "line",
"fillOpacity": 0,
"gradientMode": "none",
"hideFrom": {
"legend": false,
"tooltip": false,
"viz": false
},
"lineInterpolation": "linear",
"lineWidth": 1,
"pointSize": 5,
"scaleDistribution": {
"type": "linear"
},
"showPoints": "never",
"spanNulls": false,
"stacking": {
"group": "A",
"mode": "none"
},
"thresholdsStyle": {
"mode": "off"
}
},
"links": [],
"mappings": [],
"min": 0,
"thresholds": {
"mode": "absolute",
"steps": [
{
"color": "green"
},
{
"color": "red",
"value": 80
}
]
},
"unit": "short"
},
"overrides": []
},
"gridPos": {
"h": 9,
"w": 12,
"x": 12,
"y": 37
},
"id": 86,
"links": [],
"options": {
"legend": {
"calcs": [
"mean",
"lastNotNull",
"max"
],
"displayMode": "table",
"placement": "bottom",
"showLegend": true
},
"tooltip": {
"mode": "multi",
"sort": "none"
}
},
"pluginVersion": "9.1.0",
"targets": [
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"editorMode": "code",
"expr": "sum(rate(vm_rpc_connection_errors_total{job=~\"$job\",instance=~\"$instance\"}[$__rate_interval]))",
"format": "time_series",
"intervalFactor": 1,
"legendFormat": "Connection",
"range": true,
"refId": "A"
},
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"expr": "sum(rate(vm_rpc_dial_errors_total{job=~\"$job\",instance=~\"$instance\"}[$__rate_interval]))",
"format": "time_series",
"intervalFactor": 1,
"legendFormat": "Dial",
"refId": "B"
},
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"expr": "sum(rate(vm_rpc_handshake_errors_total{job=~\"$job\",instance=~\"$instance\"}[$__rate_interval]))",
"format": "time_series",
"intervalFactor": 1,
"legendFormat": "Handshake",
"refId": "E"
}
],
"title": "RPC errors ($instance)",
"type": "timeseries"
},
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"description": "The number of rows rerouted to the vmstorage node from other nodes when they were unhealthy.",
"fieldConfig": {
"defaults": {
"color": {
"mode": "palette-classic"
},
"custom": {
"axisCenteredZero": false,
"axisColorMode": "text",
"axisLabel": "",
"axisPlacement": "auto",
"barAlignment": 0,
"drawStyle": "line",
"fillOpacity": 0,
"gradientMode": "none",
"hideFrom": {
"legend": false,
"tooltip": false,
"viz": false
},
"lineInterpolation": "linear",
"lineWidth": 1,
"pointSize": 5,
"scaleDistribution": {
"type": "linear"
},
"showPoints": "never",
"spanNulls": false,
"stacking": {
"group": "A",
"mode": "none"
},
"thresholdsStyle": {
"mode": "off"
}
},
"links": [],
"mappings": [],
"min": 0,
"thresholds": {
"mode": "absolute",
"steps": [
{
"color": "green"
},
{
"color": "red",
"value": 80
}
]
},
"unit": "rps"
},
"overrides": []
},
"gridPos": {
"h": 8,
"w": 12,
"x": 0,
"y": 46
},
"id": 80,
"links": [],
"options": {
"legend": {
"calcs": [
"mean",
"lastNotNull",
"max"
],
"displayMode": "table",
"placement": "bottom",
"showLegend": true
},
"tooltip": {
"mode": "multi",
"sort": "none"
}
},
"pluginVersion": "9.1.0",
"targets": [
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"editorMode": "code",
"exemplar": true,
"expr": "sum(rate(vm_rpc_rows_rerouted_to_here_total{job=~\"$job\", instance=~\"$instance\"}[$__rate_interval])) by(addr) > 0",
"format": "time_series",
"interval": "",
"intervalFactor": 1,
"legendFormat": "__auto",
"range": true,
"refId": "A"
}
],
"title": "Rows ($instance) rerouted to ",
"type": "timeseries"
},
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"description": "The number of rows rerouted from the vmstorage node to healthy nodes when the given node was unhealthy.",
"fieldConfig": {
"defaults": {
"color": {
"mode": "palette-classic"
},
"custom": {
"axisCenteredZero": false,
"axisColorMode": "text",
"axisLabel": "",
"axisPlacement": "auto",
"barAlignment": 0,
"drawStyle": "line",
"fillOpacity": 0,
"gradientMode": "none",
"hideFrom": {
"legend": false,
"tooltip": false,
"viz": false
},
"lineInterpolation": "linear",
"lineWidth": 1,
"pointSize": 5,
"scaleDistribution": {
"type": "linear"
},
"showPoints": "never",
"spanNulls": false,
"stacking": {
"group": "A",
"mode": "none"
},
"thresholdsStyle": {
"mode": "off"
}
},
"links": [],
"mappings": [],
"min": 0,
"thresholds": {
"mode": "absolute",
"steps": [
{
"color": "green"
},
{
"color": "red",
"value": 80
}
]
},
"unit": "rps"
},
"overrides": []
},
"gridPos": {
"h": 8,
"w": 12,
"x": 12,
"y": 46
},
"id": 78,
"links": [],
"options": {
"legend": {
"calcs": [
"mean",
"lastNotNull",
"max"
],
"displayMode": "table",
"placement": "bottom",
"showLegend": true
},
"tooltip": {
"mode": "multi",
"sort": "none"
}
},
"pluginVersion": "9.1.0",
"targets": [
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"exemplar": true,
"expr": "sum(rate(vm_rpc_rows_rerouted_from_here_total{job=~\"$job\", instance=~\"$instance\"}[$__rate_interval])) by(addr) > 0",
"format": "time_series",
"interval": "",
"intervalFactor": 1,
"legendFormat": "{{addr}}",
"refId": "A"
}
],
"title": "Rows ($instance) rerouted from",
"type": "timeseries"
},
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"description": "The number of rows or bytes that vminesrt internal buffer contains at the moment.",
"fieldConfig": {
"defaults": {
"color": {
"mode": "palette-classic"
},
"custom": {
"axisCenteredZero": false,
"axisColorMode": "text",
"axisLabel": "",
"axisPlacement": "auto",
"barAlignment": 0,
"drawStyle": "line",
"fillOpacity": 0,
"gradientMode": "none",
"hideFrom": {
"legend": false,
"tooltip": false,
"viz": false
},
"lineInterpolation": "linear",
"lineWidth": 1,
"pointSize": 5,
"scaleDistribution": {
"type": "linear"
},
"showPoints": "never",
"spanNulls": false,
"stacking": {
"group": "A",
"mode": "none"
},
"thresholdsStyle": {
"mode": "off"
}
},
"links": [],
"mappings": [],
"min": 0,
"thresholds": {
"mode": "absolute",
"steps": [
{
"color": "green"
},
{
"color": "red",
"value": 80
}
]
},
"unit": "short"
},
"overrides": [
{
"matcher": {
"id": "byName",
"options": "bytes"
},
"properties": [
{
"id": "unit",
"value": "bytes"
}
]
}
]
},
"gridPos": {
"h": 8,
"w": 12,
"x": 0,
"y": 54
},
"id": 82,
"options": {
"legend": {
"calcs": [
"mean",
"lastNotNull",
"max"
],
"displayMode": "table",
"placement": "bottom",
"showLegend": true
},
"tooltip": {
"mode": "multi",
"sort": "none"
}
},
"pluginVersion": "9.1.0",
"targets": [
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"expr": "sum(vm_rpc_buf_pending_bytes{job=~\"$job\", instance=~\"$instance\"})",
"legendFormat": "bytes",
"refId": "A"
},
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"expr": "sum(vm_rpc_rows_pending{job=~\"$job\", instance=~\"$instance\"})",
"legendFormat": "rows",
"refId": "B"
}
],
"title": "Pending",
"type": "timeseries"
},
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"description": "Network usage by internal VictoriaMetrics RPC protocol",
"fieldConfig": {
"defaults": {
"color": {
"mode": "palette-classic"
},
"custom": {
"axisCenteredZero": false,
"axisColorMode": "text",
"axisLabel": "",
"axisPlacement": "auto",
"barAlignment": 0,
"drawStyle": "line",
"fillOpacity": 10,
"gradientMode": "none",
"hideFrom": {
"legend": false,
"tooltip": false,
"viz": false
},
"lineInterpolation": "linear",
"lineWidth": 1,
"pointSize": 5,
"scaleDistribution": {
"type": "linear"
},
"showPoints": "never",
"spanNulls": false,
"stacking": {
"group": "A",
"mode": "none"
},
"thresholdsStyle": {
"mode": "off"
}
},
"links": [],
"mappings": [],
"min": 0,
"thresholds": {
"mode": "absolute",
"steps": [
{
"color": "green"
},
{
"color": "red",
"value": 80
}
]
},
"unit": "bps"
},
"overrides": []
},
"gridPos": {
"h": 8,
"w": 12,
"x": 12,
"y": 54
},
"id": 74,
"options": {
"legend": {
"calcs": [
"mean",
"lastNotNull",
"max"
],
"displayMode": "table",
"placement": "bottom",
"showLegend": true
},
"tooltip": {
"mode": "multi",
"sort": "none"
}
},
"pluginVersion": "9.1.0",
"targets": [
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"editorMode": "code",
"expr": "sum(rate(vm_tcpdialer_written_bytes_total{job=~\"$job\", instance=~\"$instance\"}[$__rate_interval])) * 8",
"legendFormat": "network usage",
"range": true,
"refId": "A"
}
],
"title": "RPC network usage ($instance)",
"type": "timeseries"
}
],
"title": "Interconnection ($job)",
"type": "row"
},
{
"collapsed": true,
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"gridPos": {
"h": 1,
"w": 24,
"x": 0,
"y": 40
},
"id": 24,
"panels": [
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"description": "Shows the number of datapoints ingested into storage nodes per second. This metric doesn't show all stored datapoints since some of them may be dropped because of wrong timestamps or decode errors.",
"fieldConfig": {
"defaults": {
"color": {
"mode": "palette-classic"
},
"custom": {
"axisCenteredZero": false,
"axisColorMode": "text",
"axisLabel": "",
"axisPlacement": "auto",
"barAlignment": 0,
"drawStyle": "line",
"fillOpacity": 10,
"gradientMode": "none",
"hideFrom": {
"legend": false,
"tooltip": false,
"viz": false
},
"lineInterpolation": "linear",
"lineWidth": 1,
"pointSize": 5,
"scaleDistribution": {
"type": "linear"
},
"showPoints": "never",
"spanNulls": false,
"stacking": {
"group": "A",
"mode": "normal"
},
"thresholdsStyle": {
"mode": "off"
}
},
"links": [],
"mappings": [],
"min": 0,
"thresholds": {
"mode": "absolute",
"steps": [
{
"color": "green"
},
{
"color": "red",
"value": 80
}
]
},
"unit": "short"
},
"overrides": []
},
"gridPos": {
"h": 8,
"w": 12,
"x": 0,
"y": 14
},
"id": 100,
"links": [],
"options": {
"legend": {
"calcs": [
"mean",
"lastNotNull",
"max"
],
"displayMode": "table",
"placement": "bottom",
"showLegend": true,
"sortBy": "Last *",
"sortDesc": true
},
"tooltip": {
"mode": "multi",
"sort": "desc"
}
},
"pluginVersion": "9.1.0",
"targets": [
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"editorMode": "code",
"expr": "sum(rate(vm_vminsert_metrics_read_total{job=~\"$job_storage\", instance=~\"$instance\"}[$__rate_interval])) ",
"format": "time_series",
"intervalFactor": 1,
"legendFormat": "ingestion rate",
"range": true,
"refId": "A"
}
],
"title": "Ingestion rate ($instance)",
"type": "timeseries"
},
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"description": "Shows the approx time needed to reach 100% of disk capacity for at least one vmstorage node based on the following params:\n* free disk space;\n* row ingestion rate;\n* compression.\n\nNote: this panel doesn't account for deduplication process.",
"fieldConfig": {
"defaults": {
"color": {
"mode": "palette-classic"
},
"custom": {
"axisCenteredZero": false,
"axisColorMode": "text",
"axisLabel": "",
"axisPlacement": "auto",
"barAlignment": 0,
"drawStyle": "line",
"fillOpacity": 0,
"gradientMode": "none",
"hideFrom": {
"legend": false,
"tooltip": false,
"viz": false
},
"lineInterpolation": "linear",
"lineWidth": 1,
"pointSize": 5,
"scaleDistribution": {
"type": "linear"
},
"showPoints": "never",
"spanNulls": false,
"stacking": {
"group": "A",
"mode": "none"
},
"thresholdsStyle": {
"mode": "off"
}
},
"links": [
{
"targetBlank": true,
"title": "Drilldown",
"url": "/d/oS7Bi_0Wz?viewPanel=196&${__url_time_range}&${__all_variables}"
}
],
"mappings": [],
"min": 0,
"thresholds": {
"mode": "absolute",
"steps": [
{
"color": "green"
},
{
"color": "red",
"value": 80
}
]
},
"unit": "s"
},
"overrides": []
},
"gridPos": {
"h": 8,
"w": 12,
"x": 12,
"y": 14
},
"id": 113,
"links": [],
"options": {
"legend": {
"calcs": [
"mean",
"lastNotNull",
"min"
],
"displayMode": "table",
"placement": "bottom",
"showLegend": true,
"sortBy": "Last *",
"sortDesc": true
},
"tooltip": {
"mode": "multi",
"sort": "none"
}
},
"pluginVersion": "9.1.0",
"targets": [
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"editorMode": "code",
"expr": "min(vm_free_disk_space_bytes{job=~\"$job_storage\", instance=~\"$instance\"} \n/ \nignoring(path) (\n    rate(vm_rows_added_to_storage_total{job=~\"$job_storage\", instance=~\"$instance\"}[1d])\n    * scalar(\n            sum(vm_data_size_bytes{job=~\"$job_storage\", instance=~\"$instance\", type!~\"indexdb.*\"})\n            / \n            sum(vm_rows{job=~\"$job_storage\", instance=~\"$instance\", type!~\"indexdb.*\"})\n            )\n))",
"format": "time_series",
"interval": "",
"intervalFactor": 1,
"legendFormat": "min ETA",
"range": true,
"refId": "A"
}
],
"title": "Storage full ETA ($instance)",
"type": "timeseries"
},
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"description": "",
"fieldConfig": {
"defaults": {
"color": {
"mode": "palette-classic"
},
"custom": {
"axisCenteredZero": false,
"axisColorMode": "text",
"axisLabel": "",
"axisPlacement": "auto",
"barAlignment": 0,
"drawStyle": "line",
"fillOpacity": 0,
"gradientMode": "none",
"hideFrom": {
"legend": false,
"tooltip": false,
"viz": false
},
"lineInterpolation": "linear",
"lineWidth": 1,
"pointSize": 5,
"scaleDistribution": {
"type": "linear"
},
"showPoints": "never",
"spanNulls": false,
"stacking": {
"group": "A",
"mode": "none"
},
"thresholdsStyle": {
"mode": "line"
}
},
"links": [
{
"targetBlank": true,
"title": "Drilldown",
"url": "/d/oS7Bi_0Wz?viewPanel=192&var-job=$job_storage&var-ds=$ds&var-instance=$instance&${__url_time_range}"
}
],
"mappings": [],
"min": 0,
"thresholds": {
"mode": "absolute",
"steps": [
{
"color": "green"
},
{
"color": "red",
"value": 0.9
}
]
},
"unit": "percentunit"
},
"overrides": []
},
"gridPos": {
"h": 7,
"w": 12,
"x": 0,
"y": 22
},
"id": 151,
"links": [],
"options": {
"legend": {
"calcs": [
"mean",
"lastNotNull",
"max"
],
"displayMode": "table",
"placement": "bottom",
"showLegend": true,
"sortBy": "Last *",
"sortDesc": true
},
"tooltip": {
"mode": "multi",
"sort": "desc"
}
},
"pluginVersion": "9.1.0",
"targets": [
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"editorMode": "code",
"exemplar": false,
"expr": "max(\n    rate(process_cpu_seconds_total{job=~\"$job_storage\", instance=~\"$instance\"}[$__rate_interval])\n    /\n    process_cpu_cores_available{job=~\"$job_storage\", instance=~\"$instance\"}\n)",
"format": "time_series",
"interval": "",
"intervalFactor": 1,
"legendFormat": "max",
"range": true,
"refId": "A"
},
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"editorMode": "code",
"exemplar": false,
"expr": "min(\n    rate(process_cpu_seconds_total{job=~\"$job_storage\", instance=~\"$instance\"}[$__rate_interval])\n    /\n    process_cpu_cores_available{job=~\"$job_storage\", instance=~\"$instance\"}\n)",
"format": "time_series",
"hide": false,
"interval": "",
"intervalFactor": 1,
"legendFormat": "min",
"range": true,
"refId": "B"
},
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"editorMode": "code",
"exemplar": false,
"expr": "quantile(0.5,\n    rate(process_cpu_seconds_total{job=~\"$job_storage\", instance=~\"$instance\"}[$__rate_interval])\n    /\n    process_cpu_cores_available{job=~\"$job_storage\", instance=~\"$instance\"}\n)",
"format": "time_series",
"hide": false,
"interval": "",
"intervalFactor": 1,
"legendFormat": "median",
"range": true,
"refId": "C"
}
],
"title": "CPU usage % ($instance)",
"type": "timeseries"
},
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"description": "Percentage of used memory (resident).\nThe application's performance will significantly degrade when memory usage is close to 100%.",
"fieldConfig": {
"defaults": {
"color": {
"mode": "palette-classic"
},
"custom": {
"axisCenteredZero": false,
"axisColorMode": "text",
"axisLabel": "",
"axisPlacement": "auto",
"barAlignment": 0,
"drawStyle": "line",
"fillOpacity": 0,
"gradientMode": "none",
"hideFrom": {
"legend": false,
"tooltip": false,
"viz": false
},
"lineInterpolation": "linear",
"lineWidth": 1,
"pointSize": 5,
"scaleDistribution": {
"type": "linear"
},
"showPoints": "never",
"spanNulls": false,
"stacking": {
"group": "A",
"mode": "none"
},
"thresholdsStyle": {
"mode": "line"
}
},
"links": [
{
"targetBlank": true,
"title": "Drilldown",
"url": "/d/oS7Bi_0Wz?viewPanel=189&var-job=$job_storage&var-ds=$ds&var-instance=$instance&${__url_time_range}"
}
],
"mappings": [],
"min": 0,
"thresholds": {
"mode": "absolute",
"steps": [
{
"color": "green"
},
{
"color": "red",
"value": 0.9
}
]
},
"unit": "percentunit"
},
"overrides": []
},
"gridPos": {
"h": 7,
"w": 12,
"x": 12,
"y": 22
},
"id": 167,
"links": [],
"options": {
"legend": {
"calcs": [
"mean",
"lastNotNull",
"max"
],
"displayMode": "table",
"placement": "bottom",
"showLegend": true,
"sortBy": "Last *",
"sortDesc": true
},
"tooltip": {
"mode": "multi",
"sort": "desc"
}
},
"pluginVersion": "9.1.0",
"targets": [
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"editorMode": "code",
"exemplar": true,
"expr": "max(\n    max_over_time(process_resident_memory_bytes{job=~\"$job_storage\", instance=~\"$instance\"}[$__rate_interval])\n    /\n    vm_available_memory_bytes{job=~\"$job_storage\", instance=~\"$instance\"}\n)",
"format": "time_series",
"interval": "",
"intervalFactor": 1,
"legendFormat": "max",
"range": true,
"refId": "A"
},
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"editorMode": "code",
"exemplar": true,
"expr": "min(\n    max_over_time(process_resident_memory_bytes{job=~\"$job_storage\", instance=~\"$instance\"}[$__rate_interval])\n    /\n    vm_available_memory_bytes{job=~\"$job_storage\", instance=~\"$instance\"}\n)",
"format": "time_series",
"hide": false,
"interval": "",
"intervalFactor": 1,
"legendFormat": "min",
"range": true,
"refId": "B"
},
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"editorMode": "code",
"exemplar": true,
"expr": "quantile(0.5,\n    max_over_time(process_resident_memory_bytes{job=~\"$job_storage\", instance=~\"$instance\"}[$__rate_interval])\n    /\n    vm_available_memory_bytes{job=~\"$job_storage\", instance=~\"$instance\"}\n)",
"format": "time_series",
"hide": false,
"interval": "",
"intervalFactor": 1,
"legendFormat": "median",
"range": true,
"refId": "C"
}
],
"title": "Memory usage % ($instance)",
"type": "timeseries"
},
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"description": "Value > 0 means vmstorage is in readonly mode.",
"fieldConfig": {
"defaults": {
"color": {
"mode": "palette-classic"
},
"custom": {
"axisCenteredZero": false,
"axisColorMode": "text",
"axisLabel": "",
"axisPlacement": "auto",
"barAlignment": 0,
"drawStyle": "line",
"fillOpacity": 0,
"gradientMode": "none",
"hideFrom": {
"legend": false,
"tooltip": false,
"viz": false
},
"lineInterpolation": "linear",
"lineWidth": 1,
"pointSize": 5,
"scaleDistribution": {
"type": "linear"
},
"showPoints": "never",
"spanNulls": false,
"stacking": {
"group": "A",
"mode": "none"
},
"thresholdsStyle": {
"mode": "off"
}
},
"mappings": [],
"thresholds": {
"mode": "absolute",
"steps": [
{
"color": "green"
},
{
"color": "red",
"value": 80
}
]
},
"unit": "short"
},
"overrides": []
},
"gridPos": {
"h": 8,
"w": 12,
"x": 0,
"y": 29
},
"id": 141,
"links": [
{
"targetBlank": true,
"title": "Readonly mode",
"url": "https://docs.victoriametrics.com/Cluster-VictoriaMetrics.html#readonly-mode"
}
],
"options": {
"legend": {
"calcs": [],
"displayMode": "list",
"placement": "bottom",
"showLegend": false
},
"tooltip": {
"mode": "multi",
"sort": "desc"
}
},
"pluginVersion": "9.1.0",
"targets": [
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"editorMode": "code",
"exemplar": true,
"expr": "vm_storage_is_read_only{job=~\"$job_storage\", instance=~\"$instance\"} > 0",
"interval": "",
"legendFormat": "{{ instance }}",
"range": true,
"refId": "A"
}
],
"title": "Readonly mode",
"type": "timeseries"
},
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"description": "Shows how many ongoing insertions (not API /write calls) on disk are taking place, where:\n* `max` - equal to number of CPUs;\n* `current` - current number of goroutines busy with inserting rows into underlying storage.\n\nEvery successful API /write call results into flush on disk. The `max` is an internal limit and can't be changed. It is always equal to the number of CPUs. \n\nWhen `current` hits `max` constantly, it means storage is overloaded and requires more CPU or faster disk.",
"fieldConfig": {
"defaults": {
"color": {
"mode": "palette-classic"
},
"custom": {
"axisCenteredZero": false,
"axisColorMode": "text",
"axisLabel": "",
"axisPlacement": "auto",
"barAlignment": 0,
"drawStyle": "line",
"fillOpacity": 0,
"gradientMode": "none",
"hideFrom": {
"legend": false,
"tooltip": false,
"viz": false
},
"lineInterpolation": "linear",
"lineWidth": 1,
"pointSize": 5,
"scaleDistribution": {
"type": "linear"
},
"showPoints": "never",
"spanNulls": false,
"stacking": {
"group": "A",
"mode": "none"
},
"thresholdsStyle": {
"mode": "off"
}
},
"mappings": [],
"thresholds": {
"mode": "absolute",
"steps": [
{
"color": "green"
},
{
"color": "red",
"value": 80
}
]
},
"unit": "short"
},
"overrides": [
{
"matcher": {
"id": "byName",
"options": "max"
},
"properties": [
{
"id": "color",
"value": {
"fixedColor": "#C4162A",
"mode": "fixed"
}
}
]
}
]
},
"gridPos": {
"h": 8,
"w": 12,
"x": 12,
"y": 29
},
"id": 133,
"links": [
{
"targetBlank": true,
"title": "Related discussion",
"url": "https://github.com/VictoriaMetrics/VictoriaMetrics/issues/632"
}
],
"options": {
"legend": {
"calcs": [
"mean",
"lastNotNull",
"max"
],
"displayMode": "table",
"placement": "bottom",
"showLegend": true,
"sortBy": "Last *",
"sortDesc": true
},
"tooltip": {
"mode": "multi",
"sort": "none"
}
},
"pluginVersion": "9.1.0",
"targets": [
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"editorMode": "code",
"exemplar": true,
"expr": "max(\n    max_over_time(vm_concurrent_insert_current{job=~\"$job_storage\", \n    instance=~\"$instance\"}[$__rate_interval])\n)",
"interval": "",
"legendFormat": "current",
"range": true,
"refId": "A"
},
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"editorMode": "code",
"exemplar": true,
"expr": "min(vm_concurrent_insert_capacity{job=~\"$job_storage\", instance=~\"$instance\"})",
"hide": false,
"interval": "",
"legendFormat": "max",
"range": true,
"refId": "B"
}
],
"title": "Concurrent flushes on disk ($instance)",
"type": "timeseries"
},
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"description": "The number of on-going merges in storage nodes.  It is expected to have high numbers for `storage/small` metric.",
"fieldConfig": {
"defaults": {
"color": {
"mode": "palette-classic"
},
"custom": {
"axisCenteredZero": false,
"axisColorMode": "text",
"axisLabel": "",
"axisPlacement": "auto",
"barAlignment": 0,
"drawStyle": "line",
"fillOpacity": 0,
"gradientMode": "none",
"hideFrom": {
"legend": false,
"tooltip": false,
"viz": false
},
"lineInterpolation": "linear",
"lineWidth": 1,
"pointSize": 5,
"scaleDistribution": {
"type": "linear"
},
"showPoints": "never",
"spanNulls": false,
"stacking": {
"group": "A",
"mode": "none"
},
"thresholdsStyle": {
"mode": "off"
}
},
"decimals": 0,
"links": [],
"mappings": [],
"min": 0,
"thresholds": {
"mode": "absolute",
"steps": [
{
"color": "green"
},
{
"color": "red",
"value": 80
}
]
},
"unit": "short"
},
"overrides": []
},
"gridPos": {
"h": 8,
"w": 12,
"x": 0,
"y": 37
},
"id": 54,
"options": {
"legend": {
"calcs": [
"mean",
"lastNotNull",
"max"
],
"displayMode": "table",
"placement": "bottom",
"showLegend": true,
"sortBy": "Last *",
"sortDesc": true
},
"tooltip": {
"mode": "multi",
"sort": "desc"
}
},
"pluginVersion": "9.1.0",
"targets": [
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"editorMode": "code",
"expr": "sum(max_over_time(vm_active_merges{job=~\"$job_storage\", instance=~\"$instance\"}[$__rate_interval])) by(type)",
"legendFormat": "__auto",
"range": true,
"refId": "A"
}
],
"title": "Active merges ($instance)",
"type": "timeseries"
},
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"description": "The number of rows merged per second by storage nodes.",
"fieldConfig": {
"defaults": {
"color": {
"mode": "palette-classic"
},
"custom": {
"axisCenteredZero": false,
"axisColorMode": "text",
"axisLabel": "",
"axisPlacement": "auto",
"barAlignment": 0,
"drawStyle": "line",
"fillOpacity": 0,
"gradientMode": "none",
"hideFrom": {
"legend": false,
"tooltip": false,
"viz": false
},
"lineInterpolation": "linear",
"lineWidth": 1,
"pointSize": 5,
"scaleDistribution": {
"type": "linear"
},
"showPoints": "never",
"spanNulls": false,
"stacking": {
"group": "A",
"mode": "none"
},
"thresholdsStyle": {
"mode": "off"
}
},
"decimals": 0,
"links": [],
"mappings": [],
"min": 0,
"thresholds": {
"mode": "absolute",
"steps": [
{
"color": "green"
},
{
"color": "red",
"value": 80
}
]
},
"unit": "short"
},
"overrides": []
},
"gridPos": {
"h": 8,
"w": 12,
"x": 12,
"y": 37
},
"id": 55,
"options": {
"legend": {
"calcs": [
"mean",
"lastNotNull",
"max"
],
"displayMode": "table",
"placement": "bottom",
"showLegend": true,
"sortBy": "Last *",
"sortDesc": true
},
"tooltip": {
"mode": "multi",
"sort": "desc"
}
},
"pluginVersion": "9.1.0",
"targets": [
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"editorMode": "code",
"expr": "sum(rate(vm_rows_merged_total{job=~\"$job_storage\", instance=~\"$instance\"}[$__rate_interval])) by(type)",
"legendFormat": "__auto",
"range": true,
"refId": "A"
}
],
"title": "Merge speed",
"type": "timeseries"
},
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"description": "Shows the percentage of used disk space. It is recommended to have at least 20% of free disk space for the best performance.",
"fieldConfig": {
"defaults": {
"color": {
"mode": "palette-classic"
},
"custom": {
"axisCenteredZero": false,
"axisColorMode": "text",
"axisLabel": "",
"axisPlacement": "auto",
"barAlignment": 0,
"drawStyle": "line",
"fillOpacity": 0,
"gradientMode": "none",
"hideFrom": {
"legend": false,
"tooltip": false,
"viz": false
},
"lineInterpolation": "linear",
"lineWidth": 1,
"pointSize": 5,
"scaleDistribution": {
"type": "linear"
},
"showPoints": "never",
"spanNulls": false,
"stacking": {
"group": "A",
"mode": "none"
},
"thresholdsStyle": {
"mode": "line"
}
},
"links": [
{
"targetBlank": true,
"title": "Drilldown",
"url": "/d/oS7Bi_0Wz?viewPanel=200&var-ds=$ds&var-instance=$instance&${__url_time_range}"
}
],
"mappings": [],
"min": 0,
"thresholds": {
"mode": "absolute",
"steps": [
{
"color": "green"
},
{
"color": "red",
"value": 80
}
]
},
"unit": "percentunit"
},
"overrides": []
},
"gridPos": {
"h": 8,
"w": 12,
"x": 0,
"y": 45
},
"id": 20,
"links": [],
"options": {
"legend": {
"calcs": [
"mean",
"lastNotNull",
"max"
],
"displayMode": "table",
"placement": "bottom",
"showLegend": true,
"sortBy": "Last *",
"sortDesc": true
},
"tooltip": {
"mode": "multi",
"sort": "desc"
}
},
"pluginVersion": "9.1.0",
"targets": [
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"editorMode": "code",
"expr": "max(\n    sum(vm_data_size_bytes{job=~\"$job\", instance=~\"$instance\"}) by(job, instance) /\n    (\n        sum(vm_free_disk_space_bytes{job=~\"$job\", instance=~\"$instance\"}) by(job, instance) +\n        sum(vm_data_size_bytes{job=~\"$job\", instance=~\"$instance\"}) by(job, instance)\n    ) \n)",
"format": "time_series",
"intervalFactor": 1,
"legendFormat": "max",
"range": true,
"refId": "A"
},
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"editorMode": "code",
"expr": "min(\n    sum(vm_data_size_bytes{job=~\"$job\", instance=~\"$instance\"}) by(job, instance) /\n    (\n        sum(vm_free_disk_space_bytes{job=~\"$job\", instance=~\"$instance\"}) by(job, instance) +\n        sum(vm_data_size_bytes{job=~\"$job\", instance=~\"$instance\"}) by(job, instance)\n    ) \n)",
"format": "time_series",
"hide": false,
"intervalFactor": 1,
"legendFormat": "min",
"range": true,
"refId": "B"
},
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"editorMode": "code",
"expr": "quantile(0.5,\n    sum(vm_data_size_bytes{job=~\"$job\", instance=~\"$instance\"}) by(job, instance) /\n    (\n        sum(vm_free_disk_space_bytes{job=~\"$job\", instance=~\"$instance\"}) by(job, instance) +\n        sum(vm_data_size_bytes{job=~\"$job\", instance=~\"$instance\"}) by(job, instance)\n    ) \n)",
"format": "time_series",
"hide": false,
"intervalFactor": 1,
"legendFormat": "median",
"range": true,
"refId": "C"
}
],
"title": "Disk space usage %  ($instance)",
"type": "timeseries"
},
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"description": "The max number of data parts of LSM tree across all storage nodes.\nHigh number of parts (the hard limit is 512) is an evidence of slow merge performance - check the resource utilization.\n* `indexdb` - inverted index\n* `storage/small` - recently added parts of data ingested into storage (hot data)\n* `storage/big` -  small parts gradually merged into big parts (cold data)",
"fieldConfig": {
"defaults": {
"color": {
"mode": "palette-classic"
},
"custom": {
"axisCenteredZero": false,
"axisColorMode": "text",
"axisLabel": "",
"axisPlacement": "auto",
"barAlignment": 0,
"drawStyle": "line",
"fillOpacity": 0,
"gradientMode": "none",
"hideFrom": {
"legend": false,
"tooltip": false,
"viz": false
},
"lineInterpolation": "linear",
"lineWidth": 1,
"pointSize": 5,
"scaleDistribution": {
"type": "linear"
},
"showPoints": "never",
"spanNulls": false,
"stacking": {
"group": "A",
"mode": "none"
},
"thresholdsStyle": {
"mode": "off"
}
},
"links": [],
"mappings": [],
"min": 0,
"thresholds": {
"mode": "absolute",
"steps": [
{
"color": "green"
},
{
"color": "red",
"value": 80
}
]
},
"unit": "short"
},
"overrides": []
},
"gridPos": {
"h": 8,
"w": 12,
"x": 12,
"y": 45
},
"id": 22,
"links": [],
"options": {
"legend": {
"calcs": [
"mean",
"lastNotNull",
"max"
],
"displayMode": "table",
"placement": "bottom",
"showLegend": true,
"sortBy": "Last *",
"sortDesc": true
},
"tooltip": {
"mode": "multi",
"sort": "desc"
}
},
"pluginVersion": "9.1.0",
"targets": [
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"editorMode": "code",
"expr": "max(vm_parts{job=~\"$job_storage\", instance=~\"$instance\"}) by(type)",
"format": "time_series",
"interval": "",
"intervalFactor": 1,
"legendFormat": "__auto",
"range": true,
"refId": "A"
}
],
"title": "LSM parts max by type ($instance)",
"type": "timeseries"
},
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"description": "Shows the percentage of used disk space by type: datapoints or indexdb. Normally, indexdb takes much less space comparing to datapoints. But with high churn rate the size of the indexdb could grow significantly.\n\nThe sum of the % can be > 100% since panel shows max % per-job and per-instance. It means different instance can have different ratio between datapoints and indexdb size.",
"fieldConfig": {
"defaults": {
"color": {
"mode": "palette-classic"
},
"custom": {
"axisCenteredZero": false,
"axisColorMode": "text",
"axisLabel": "",
"axisPlacement": "auto",
"barAlignment": 0,
"drawStyle": "line",
"fillOpacity": 0,
"gradientMode": "none",
"hideFrom": {
"legend": false,
"tooltip": false,
"viz": false
},
"lineInterpolation": "linear",
"lineWidth": 1,
"pointSize": 5,
"scaleDistribution": {
"type": "linear"
},
"showPoints": "never",
"spanNulls": false,
"stacking": {
"group": "A",
"mode": "none"
},
"thresholdsStyle": {
"mode": "line"
}
},
"links": [
{
"targetBlank": true,
"title": "Drilldown",
"url": "/d/oS7Bi_0Wz?viewPanel=201&var-ds=$ds&var-instance=$instance&${__url_time_range}"
}
],
"mappings": [],
"min": 0,
"thresholds": {
"mode": "absolute",
"steps": [
{
"color": "green"
}
]
},
"unit": "percentunit"
},
"overrides": []
},
"gridPos": {
"h": 8,
"w": 12,
"x": 0,
"y": 53
},
"id": 202,
"links": [],
"options": {
"legend": {
"calcs": [
"mean",
"lastNotNull",
"max"
],
"displayMode": "table",
"placement": "bottom",
"showLegend": true,
"sortBy": "Last *",
"sortDesc": true
},
"tooltip": {
"mode": "multi",
"sort": "desc"
}
},
"pluginVersion": "9.1.0",
"targets": [
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"editorMode": "code",
"expr": "max(\n    sum(vm_data_size_bytes{job=~\"$job\", instance=~\"$instance\", type=~\"indexdb.*\"}) by(job, instance)\n    / \n    sum(vm_data_size_bytes{job=~\"$job\", instance=~\"$instance\"}) by(job, instance)\n)",
"format": "time_series",
"intervalFactor": 1,
"legendFormat": "indexdb",
"range": true,
"refId": "A"
},
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"editorMode": "code",
"expr": "max(\n    sum(vm_data_size_bytes{job=~\"$job\", instance=~\"$instance\", type!~\"indexdb.*\"}) by(job, instance)\n    / \n    sum(vm_data_size_bytes{job=~\"$job\", instance=~\"$instance\"}) by(job, instance)\n)",
"format": "time_series",
"hide": false,
"intervalFactor": 1,
"legendFormat": "datapoints",
"range": true,
"refId": "B"
}
],
"title": "Disk space usage % by type  ($instance)",
"type": "timeseries"
},
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"description": "How many datapoints are in RAM queue waiting to be written into storage. The number of pending data points should be in the range from 0 to `2*<ingestion_rate>`, since VictoriaMetrics pushes pending data to persistent storage every second. The index datapoints value in general is much lower.",
    "fieldConfig": {
    "defaults": {
    "color": {
    "mode": "palette-classic"
    },
    "custom": {
    "axisCenteredZero": false,
    "axisColorMode": "text",
    "axisLabel": "",
    "axisPlacement": "auto",
    "barAlignment": 0,
    "drawStyle": "line",
    "fillOpacity": 0,
    "gradientMode": "none",
    "hideFrom": {
    "legend": false,
    "tooltip": false,
    "viz": false
    },
    "lineInterpolation": "linear",
    "lineWidth": 1,
    "pointSize": 5,
    "scaleDistribution": {
    "type": "linear"
    },
    "showPoints": "never",
    "spanNulls": false,
    "stacking": {
    "group": "A",
    "mode": "none"
    },
    "thresholdsStyle": {
    "mode": "off"
    }
    },
    "links": [],
    "mappings": [],
    "min": 0,
    "thresholds": {
    "mode": "absolute",
    "steps": [
    {
    "color": "green"
    },
    {
    "color": "red",
    "value": 80
    }
    ]
    },
    "unit": "short"
    },
    "overrides": [
    {
    "matcher": {
    "id": "byName",
    "options": "pending index entries"
    },
    "properties": [
    {
    "id": "unit",
    "value": "none"
    },
    {
    "id": "decimals",
    "value": 3
    }
    ]
    }
    ]
    },
    "gridPos": {
    "h": 8,
    "w": 12,
    "x": 12,
    "y": 53
    },
    "id": 14,
    "links": [],
    "options": {
    "legend": {
    "calcs": [
    "mean",
    "lastNotNull",
    "max"
    ],
    "displayMode": "table",
    "placement": "bottom",
    "showLegend": true,
    "sortBy": "Last *",
    "sortDesc": true
    },
    "tooltip": {
    "mode": "multi",
    "sort": "none"
    }
    },
    "pluginVersion": "9.1.0",
    "targets": [
    {
    "datasource": {
    "type": "prometheus",
    "uid": "$ds"
    },
    "editorMode": "code",
    "expr": "sum(max_over_time(vm_pending_rows{job=~\"$job_storage\", instance=~\"$instance\", type=\"storage\"}[$__rate_interval]))",
    "format": "time_series",
    "hide": false,
    "intervalFactor": 1,
    "legendFormat": "pending datapoints",
    "range": true,
    "refId": "A"
    },
    {
    "datasource": {
    "type": "prometheus",
    "uid": "$ds"
    },
    "editorMode": "code",
    "expr": "sum(max_over_time(vm_pending_rows{job=~\"$job_storage\", instance=~\"$instance\", type=\"indexdb\"}[$__rate_interval]))",
    "format": "time_series",
    "hide": false,
    "intervalFactor": 1,
    "legendFormat": "pending index entries",
    "range": true,
    "refId": "B"
    }
    ],
    "title": "Pending datapoints ($instance)",
    "type": "timeseries"
    },
    {
    "datasource": {
    "type": "prometheus",
    "uid": "$ds"
    },
    "description": "Shows network usage by vmstorage services.\n* Writes show traffic sent to clients.\n* Reads show traffic received from clients.",
    "fieldConfig": {
    "defaults": {
    "color": {
    "mode": "palette-classic"
    },
    "custom": {
    "axisCenteredZero": false,
    "axisColorMode": "text",
    "axisLabel": "",
    "axisPlacement": "auto",
    "barAlignment": 0,
    "drawStyle": "line",
    "fillOpacity": 0,
    "gradientMode": "none",
    "hideFrom": {
    "legend": false,
    "tooltip": false,
    "viz": false
    },
    "lineInterpolation": "linear",
    "lineWidth": 1,
    "pointSize": 5,
    "scaleDistribution": {
    "type": "linear"
    },
    "showPoints": "never",
    "spanNulls": false,
    "stacking": {
    "group": "A",
    "mode": "none"
    },
    "thresholdsStyle": {
    "mode": "off"
    }
    },
    "links": [],
    "mappings": [],
    "thresholds": {
    "mode": "absolute",
    "steps": [
    {
    "color": "green"
    },
    {
    "color": "red",
    "value": 80
    }
    ]
    },
    "unit": "bps"
    },
    "overrides": [
    {
    "matcher": {
    "id": "byRegexp",
    "options": "/read.*/"
    },
    "properties": [
    {
    "id": "custom.transform",
    "value": "negative-Y"
    }
    ]
    }
    ]
    },
    "gridPos": {
    "h": 8,
    "w": 24,
    "x": 0,
    "y": 61
    },
    "id": 206,
    "links": [],
    "options": {
    "legend": {
    "calcs": [
    "mean",
    "lastNotNull"
    ],
    "displayMode": "table",
    "placement": "bottom",
    "showLegend": true,
    "sortBy": "Last *",
    "sortDesc": true
    },
    "tooltip": {
    "mode": "multi",
    "sort": "desc"
    }
    },
    "pluginVersion": "9.1.0",
    "targets": [
    {
    "datasource": {
    "type": "prometheus",
    "uid": "$ds"
    },
    "editorMode": "code",
    "expr": "sum(rate(vm_tcplistener_read_bytes_total{job=~\"$job_storage\", instance=~\"$instance\"}[$__rate_interval])) by(name) * 8 > 0",
    "format": "time_series",
    "intervalFactor": 1,
    "legendFormat": "read from {{name}}",
    "range": true,
    "refId": "A"
    },
    {
    "datasource": {
    "type": "prometheus",
    "uid": "$ds"
    },
    "editorMode": "code",
    "expr": "sum(rate(vm_tcplistener_written_bytes_total{job=~\"$job_storage\", instance=~\"$instance\"}[$__rate_interval])) by(name) * 8 > 0",
    "format": "time_series",
    "hide": false,
    "intervalFactor": 1,
    "legendFormat": "write to {{name}}",
    "range": true,
    "refId": "B"
    }
    ],
    "title": "Network usage ($instance)",
    "type": "timeseries"
    }
    ],
    "title": "vmstorage ($instance)",
    "type": "row"
    },
    {
    "collapsed": true,
    "datasource": {
    "type": "prometheus",
    "uid": "$ds"
    },
    "gridPos": {
    "h": 1,
    "w": 24,
    "x": 0,
    "y": 41
    },
    "id": 42,
    "panels": [
    {
    "datasource": {
    "type": "prometheus",
    "uid": "$ds"
    },
    "description": "Request rate accepted by vmselect nodes",
    "fieldConfig": {
    "defaults": {
    "color": {
    "mode": "palette-classic"
    },
    "custom": {
    "axisCenteredZero": false,
    "axisColorMode": "text",
    "axisLabel": "",
    "axisPlacement": "auto",
    "barAlignment": 0,
    "drawStyle": "line",
    "fillOpacity": 0,
    "gradientMode": "none",
    "hideFrom": {
    "legend": false,
    "tooltip": false,
    "viz": false
    },
    "lineInterpolation": "linear",
    "lineWidth": 1,
    "pointSize": 5,
    "scaleDistribution": {
    "type": "linear"
    },
    "showPoints": "never",
    "spanNulls": false,
    "stacking": {
    "group": "A",
    "mode": "none"
    },
    "thresholdsStyle": {
    "mode": "off"
    }
    },
    "links": [],
    "mappings": [],
    "min": 0,
    "thresholds": {
    "mode": "absolute",
    "steps": [
    {
    "color": "green"
    },
    {
    "color": "red",
    "value": 80
    }
    ]
    },
    "unit": "short"
    },
    "overrides": []
    },
    "gridPos": {
    "h": 8,
    "w": 12,
    "x": 0,
    "y": 50
    },
    "id": 92,
    "links": [],
    "options": {
    "legend": {
    "calcs": [
    "mean",
    "lastNotNull",
    "max"
    ],
    "displayMode": "table",
    "placement": "bottom",
    "showLegend": true,
    "sortBy": "Last *",
    "sortDesc": true
    },
    "tooltip": {
    "mode": "multi",
    "sort": "desc"
    }
    },
    "pluginVersion": "9.1.0",
    "targets": [
    {
    "datasource": {
    "type": "prometheus",
    "uid": "$ds"
    },
    "editorMode": "code",
    "expr": "sum(rate(vm_http_requests_total{job=~\"$job_select\", instance=~\"$instance\"}[$__rate_interval])) by (path) > 0",
    "format": "time_series",
    "intervalFactor": 1,
    "legendFormat": "__auto",
    "range": true,
    "refId": "A"
    }
    ],
    "title": "Requests rate ($instance)",
    "type": "timeseries"
    },
    {
    "datasource": {
    "type": "prometheus",
    "uid": "$ds"
    },
    "description": "Shows the max number of concurrent selects across instances.\n* `max` limit can be configured via `search.maxConcurrentRequests` flag\n* `current` shows the current number of goroutines busy with processing requests\n\nWhen `current` hits `max` constantly, it means one or more vmselect nodes are overloaded with number of requests. If you observe that CPU for vmselects is saturated, consider adding more vmselect replicas or increase CPU resources. If CPU panel shows a plenty of free resources - try increasing `search.maxConcurrentRequests`.",
    "fieldConfig": {
    "defaults": {
    "color": {
    "mode": "palette-classic"
    },
    "custom": {
    "axisCenteredZero": false,
    "axisColorMode": "text",
    "axisLabel": "",
    "axisPlacement": "auto",
    "barAlignment": 0,
    "drawStyle": "line",
    "fillOpacity": 0,
    "gradientMode": "none",
    "hideFrom": {
    "legend": false,
    "tooltip": false,
    "viz": false
    },
    "lineInterpolation": "linear",
    "lineWidth": 1,
    "pointSize": 5,
    "scaleDistribution": {
    "type": "linear"
    },
    "showPoints": "never",
    "spanNulls": false,
    "stacking": {
    "group": "A",
    "mode": "none"
    },
    "thresholdsStyle": {
    "mode": "off"
    }
    },
    "decimals": 0,
    "links": [],
    "mappings": [],
    "min": 0,
    "thresholds": {
    "mode": "absolute",
    "steps": [
    {
    "color": "green"
    },
    {
    "color": "red",
    "value": 80
    }
    ]
    },
    "unit": "short"
    },
    "overrides": [
    {
    "matcher": {
    "id": "byName",
    "options": "max"
    },
    "properties": [
    {
    "id": "color",
    "value": {
    "fixedColor": "#C4162A",
    "mode": "fixed"
    }
    },
    {
    "id": "custom.fillOpacity",
    "value": 0
    }
    ]
    }
    ]
    },
    "gridPos": {
    "h": 8,
    "w": 12,
    "x": 12,
    "y": 50
    },
    "id": 95,
    "links": [],
    "options": {
    "legend": {
    "calcs": [
    "mean",
    "lastNotNull",
    "max"
    ],
    "displayMode": "table",
    "placement": "bottom",
    "showLegend": true,
    "sortBy": "Last *",
    "sortDesc": true
    },
    "tooltip": {
    "mode": "multi",
    "sort": "desc"
    }
    },
    "pluginVersion": "9.1.0",
    "targets": [
    {
    "datasource": {
    "type": "prometheus",
    "uid": "$ds"
    },
    "editorMode": "code",
    "expr": "max(max_over_time(vm_concurrent_select_current{job=~\"$job_select\", instance=~\"$instance\"}[$__rate_interval])) ",
    "format": "time_series",
    "interval": "",
    "intervalFactor": 1,
    "legendFormat": "current",
    "range": true,
    "refId": "A"
    },
    {
    "datasource": {
    "type": "prometheus",
    "uid": "$ds"
    },
    "expr": "min(vm_concurrent_select_capacity{job=~\"$job_select\", instance=~\"$instance\"})",
    "format": "time_series",
    "intervalFactor": 1,
    "legendFormat": "max",
    "refId": "B"
    }
    ],
    "title": "Concurrent selects ($instance)",
    "type": "timeseries"
    },
    {
    "datasource": {
    "type": "prometheus",
    "uid": "$ds"
    },
    "fieldConfig": {
    "defaults": {
    "color": {
    "mode": "palette-classic"
    },
    "custom": {
    "axisCenteredZero": false,
    "axisColorMode": "text",
    "axisLabel": "",
    "axisPlacement": "auto",
    "barAlignment": 0,
    "drawStyle": "line",
    "fillOpacity": 0,
    "gradientMode": "none",
    "hideFrom": {
    "legend": false,
    "tooltip": false,
    "viz": false
    },
    "lineInterpolation": "linear",
    "lineWidth": 1,
    "pointSize": 5,
    "scaleDistribution": {
    "type": "linear"
    },
    "showPoints": "never",
    "spanNulls": false,
    "stacking": {
    "group": "A",
    "mode": "none"
    },
    "thresholdsStyle": {
    "mode": "line"
    }
    },
    "links": [
    {
    "targetBlank": true,
    "title": "Drilldown",
    "url": "/d/oS7Bi_0Wz?viewPanel=192&var-job=$job_select&var-ds=$ds&var-instance=$instance&${__url_time_range}"
    }
    ],
    "mappings": [],
    "min": 0,
    "thresholds": {
    "mode": "absolute",
    "steps": [
    {
    "color": "green"
    },
    {
    "color": "red",
    "value": 0.9
    }
    ]
    },
    "unit": "percentunit"
    },
    "overrides": []
    },
    "gridPos": {
    "h": 8,
    "w": 12,
    "x": 0,
    "y": 58
    },
    "id": 163,
    "links": [],
    "options": {
    "legend": {
    "calcs": [
    "mean",
    "lastNotNull",
    "max"
    ],
    "displayMode": "table",
    "placement": "bottom",
    "showLegend": true,
    "sortBy": "Last *",
    "sortDesc": true
    },
    "tooltip": {
    "mode": "multi",
    "sort": "none"
    }
    },
    "pluginVersion": "9.1.0",
    "targets": [
    {
    "datasource": {
    "type": "prometheus",
    "uid": "$ds"
    },
    "editorMode": "code",
    "exemplar": true,
    "expr": "max(\n    rate(process_cpu_seconds_total{job=~\"$job_select\", instance=~\"$instance\"}[$__rate_interval])\n    /\n    process_cpu_cores_available{job=~\"$job_select\", instance=~\"$instance\"}\n)",
    "format": "time_series",
    "interval": "",
    "intervalFactor": 1,
    "legendFormat": "max",
    "range": true,
    "refId": "A"
    },
    {
    "datasource": {
    "type": "prometheus",
    "uid": "$ds"
    },
    "editorMode": "code",
    "exemplar": true,
    "expr": "min(\n    rate(process_cpu_seconds_total{job=~\"$job_select\", instance=~\"$instance\"}[$__rate_interval])\n    /\n    process_cpu_cores_available{job=~\"$job_select\", instance=~\"$instance\"}\n)",
    "format": "time_series",
    "hide": false,
    "interval": "",
    "intervalFactor": 1,
    "legendFormat": "min",
    "range": true,
    "refId": "B"
    },
    {
    "datasource": {
    "type": "prometheus",
    "uid": "$ds"
    },
    "editorMode": "code",
    "exemplar": true,
    "expr": "quantile(0.5,\n    rate(process_cpu_seconds_total{job=~\"$job_select\", instance=~\"$instance\"}[$__rate_interval])\n    /\n    process_cpu_cores_available{job=~\"$job_select\", instance=~\"$instance\"}\n)",
    "format": "time_series",
    "hide": false,
    "interval": "",
    "intervalFactor": 1,
    "legendFormat": "median",
    "range": true,
    "refId": "C"
    }
    ],
    "title": "CPU usage % ($instance)",
    "type": "timeseries"
    },
    {
    "datasource": {
    "type": "prometheus",
    "uid": "$ds"
    },
    "fieldConfig": {
    "defaults": {
    "color": {
    "mode": "palette-classic"
    },
    "custom": {
    "axisCenteredZero": false,
    "axisColorMode": "text",
    "axisLabel": "",
    "axisPlacement": "auto",
    "barAlignment": 0,
    "drawStyle": "line",
    "fillOpacity": 0,
    "gradientMode": "none",
    "hideFrom": {
    "legend": false,
    "tooltip": false,
    "viz": false
    },
    "lineInterpolation": "linear",
    "lineWidth": 1,
    "pointSize": 5,
    "scaleDistribution": {
    "type": "linear"
    },
    "showPoints": "never",
    "spanNulls": false,
    "stacking": {
    "group": "A",
    "mode": "none"
    },
    "thresholdsStyle": {
    "mode": "line"
    }
    },
    "links": [
    {
    "targetBlank": true,
    "title": "Drilldown",
    "url": "/d/oS7Bi_0Wz?viewPanel=189&var-job=$job_select&var-ds=$ds&var-instance=$instance&${__url_time_range}"
    }
    ],
    "mappings": [],
    "min": 0,
    "thresholds": {
    "mode": "absolute",
    "steps": [
    {
    "color": "green"
    },
    {
    "color": "red",
    "value": 0.9
    }
    ]
    },
    "unit": "percentunit"
    },
    "overrides": []
    },
    "gridPos": {
    "h": 8,
    "w": 12,
    "x": 12,
    "y": 58
    },
    "id": 165,
    "links": [],
    "options": {
    "legend": {
    "calcs": [
    "mean",
    "lastNotNull",
    "max"
    ],
    "displayMode": "table",
    "placement": "bottom",
    "showLegend": true,
    "sortBy": "Last *",
    "sortDesc": true
    },
    "tooltip": {
    "mode": "multi",
    "sort": "none"
    }
    },
    "pluginVersion": "9.1.0",
    "targets": [
    {
    "datasource": {
    "type": "prometheus",
    "uid": "$ds"
    },
    "editorMode": "code",
    "exemplar": true,
    "expr": "max(\n    max_over_time(process_resident_memory_bytes{job=~\"$job_select\", instance=~\"$instance\"}[$__rate_interval])\n    /\n    vm_available_memory_bytes{job=~\"$job_select\", instance=~\"$instance\"}\n)",
    "format": "time_series",
    "interval": "",
    "intervalFactor": 1,
    "legendFormat": "max",
    "range": true,
    "refId": "A"
    },
    {
    "datasource": {
    "type": "prometheus",
    "uid": "$ds"
    },
    "editorMode": "code",
    "exemplar": true,
    "expr": "min(\n    max_over_time(process_resident_memory_bytes{job=~\"$job_select\", instance=~\"$instance\"}[$__rate_interval])\n    /\n    vm_available_memory_bytes{job=~\"$job_select\", instance=~\"$instance\"}\n)",
    "format": "time_series",
    "hide": false,
    "interval": "",
    "intervalFactor": 1,
    "legendFormat": "min",
    "range": true,
    "refId": "B"
    },
    {
    "datasource": {
    "type": "prometheus",
    "uid": "$ds"
    },
    "editorMode": "code",
    "exemplar": true,
    "expr": "quantile(0.5,\n    max_over_time(process_resident_memory_bytes{job=~\"$job_select\", instance=~\"$instance\"}[$__rate_interval])\n    /\n    vm_available_memory_bytes{job=~\"$job_select\", instance=~\"$instance\"}\n)",
    "format": "time_series",
    "hide": false,
    "interval": "",
    "intervalFactor": 1,
    "legendFormat": "median",
    "range": true,
    "refId": "C"
    }
    ],
    "title": "Memory usage % ($instance)",
    "type": "timeseries"
    },
    {
    "datasource": {
    "type": "prometheus",
    "uid": "$ds"
    },
    "description": "99th percentile of the number of time series read per query.",
    "fieldConfig": {
    "defaults": {
    "color": {
    "mode": "palette-classic"
    },
    "custom": {
    "axisCenteredZero": false,
    "axisColorMode": "text",
    "axisLabel": "",
    "axisPlacement": "auto",
    "barAlignment": 0,
    "drawStyle": "line",
    "fillOpacity": 0,
    "gradientMode": "none",
    "hideFrom": {
    "legend": false,
    "tooltip": false,
    "viz": false
    },
    "lineInterpolation": "linear",
    "lineWidth": 1,
    "pointSize": 5,
    "scaleDistribution": {
    "type": "linear"
    },
    "showPoints": "never",
    "spanNulls": false,
    "stacking": {
    "group": "A",
    "mode": "none"
    },
    "thresholdsStyle": {
    "mode": "off"
    }
    },
    "decimals": 2,
    "links": [],
    "mappings": [],
    "min": 0,
    "thresholds": {
    "mode": "absolute",
    "steps": [
    {
    "color": "green"
    },
    {
    "color": "red",
    "value": 80
    }
    ]
    },
    "unit": "short"
    },
    "overrides": []
    },
    "gridPos": {
    "h": 8,
    "w": 12,
    "x": 0,
    "y": 66
    },
    "id": 178,
    "links": [],
    "options": {
    "legend": {
    "calcs": [
    "mean",
    "lastNotNull",
    "max"
    ],
    "displayMode": "table",
    "placement": "bottom",
    "showLegend": true,
    "sortBy": "Last *",
    "sortDesc": true
    },
    "tooltip": {
    "mode": "multi",
    "sort": "desc"
    }
    },
    "pluginVersion": "9.1.0",
    "targets": [
    {
    "datasource": {
    "type": "prometheus",
    "uid": "$ds"
    },
    "editorMode": "code",
    "expr": "sum(histogram_quantile(0.99, sum(rate(vm_series_read_per_query_bucket{job=~\"$job_select\", instance=~\"$instance\"}[$__rate_interval])) by (instance, vmrange)))",
    "format": "time_series",
    "interval": "",
    "intervalFactor": 1,
    "legendFormat": "series",
    "range": true,
    "refId": "A"
    }
    ],
    "title": "Series read per query ($instance)",
    "type": "timeseries"
    },
    {
    "datasource": {
    "type": "prometheus",
    "uid": "$ds"
    },
    "description": "99th percentile of number of raw datapoints read per queried time series.",
    "fieldConfig": {
    "defaults": {
    "color": {
    "mode": "palette-classic"
    },
    "custom": {
    "axisCenteredZero": false,
    "axisColorMode": "text",
    "axisLabel": "",
    "axisPlacement": "auto",
    "barAlignment": 0,
    "drawStyle": "line",
    "fillOpacity": 0,
    "gradientMode": "none",
    "hideFrom": {
    "legend": false,
    "tooltip": false,
    "viz": false
    },
    "lineInterpolation": "linear",
    "lineWidth": 1,
    "pointSize": 5,
    "scaleDistribution": {
    "type": "linear"
    },
    "showPoints": "never",
    "spanNulls": false,
    "stacking": {
    "group": "A",
    "mode": "none"
    },
    "thresholdsStyle": {
    "mode": "off"
    }
    },
    "decimals": 2,
    "links": [],
    "mappings": [],
    "min": 0,
    "thresholds": {
    "mode": "absolute",
    "steps": [
    {
    "color": "green"
    },
    {
    "color": "red",
    "value": 80
    }
    ]
    },
    "unit": "short"
    },
    "overrides": []
    },
    "gridPos": {
    "h": 8,
    "w": 12,
    "x": 12,
    "y": 66
    },
    "id": 180,
    "links": [],
    "options": {
    "legend": {
    "calcs": [
    "mean",
    "lastNotNull",
    "max"
    ],
    "displayMode": "table",
    "placement": "bottom",
    "showLegend": true,
    "sortBy": "Last *",
    "sortDesc": true
    },
    "tooltip": {
    "mode": "multi",
    "sort": "desc"
    }
    },
    "pluginVersion": "9.1.0",
    "targets": [
    {
    "datasource": {
    "type": "prometheus",
    "uid": "$ds"
    },
    "editorMode": "code",
    "expr": "sum(histogram_quantile(0.99, sum(rate(vm_rows_read_per_series_bucket{job=~\"$job_select\", instance=~\"$instance\"}[$__rate_interval])) by (instance, vmrange)))",
    "format": "time_series",
    "interval": "",
    "intervalFactor": 1,
    "legendFormat": "datapoints",
    "range": true,
    "refId": "A"
    }
    ],
    "title": "Datapoints read per series ($instance)",
    "type": "timeseries"
    },
    {
    "datasource": {
    "type": "prometheus",
    "uid": "$ds"
    },
    "description": "99th percentile of number of raw datapoints read per query.",
    "fieldConfig": {
    "defaults": {
    "color": {
    "mode": "palette-classic"
    },
    "custom": {
    "axisCenteredZero": false,
    "axisColorMode": "text",
    "axisLabel": "",
    "axisPlacement": "auto",
    "barAlignment": 0,
    "drawStyle": "line",
    "fillOpacity": 0,
    "gradientMode": "none",
    "hideFrom": {
    "legend": false,
    "tooltip": false,
    "viz": false
    },
    "lineInterpolation": "linear",
    "lineWidth": 1,
    "pointSize": 5,
    "scaleDistribution": {
    "type": "linear"
    },
    "showPoints": "never",
    "spanNulls": false,
    "stacking": {
    "group": "A",
    "mode": "none"
    },
    "thresholdsStyle": {
    "mode": "off"
    }
    },
    "decimals": 2,
    "links": [],
    "mappings": [],
    "min": 0,
    "thresholds": {
    "mode": "absolute",
    "steps": [
    {
    "color": "green"
    },
    {
    "color": "red",
    "value": 80
    }
    ]
    },
    "unit": "short"
    },
    "overrides": []
    },
    "gridPos": {
    "h": 8,
    "w": 12,
    "x": 0,
    "y": 74
    },
    "id": 179,
    "links": [],
    "options": {
    "legend": {
    "calcs": [
    "mean",
    "lastNotNull",
    "max"
    ],
    "displayMode": "table",
    "placement": "bottom",
    "showLegend": true,
    "sortBy": "Last *",
    "sortDesc": true
    },
    "tooltip": {
    "mode": "multi",
    "sort": "desc"
    }
    },
    "pluginVersion": "9.1.0",
    "targets": [
    {
    "datasource": {
    "type": "prometheus",
    "uid": "$ds"
    },
    "editorMode": "code",
    "expr": "sum(histogram_quantile(0.99, sum(rate(vm_rows_read_per_query_bucket{job=~\"$job_select\", instance=~\"$instance\"}[$__rate_interval])) by (instance, vmrange)))",
    "format": "time_series",
    "interval": "",
    "intervalFactor": 1,
    "legendFormat": "datapoints",
    "range": true,
    "refId": "A"
    }
    ],
    "title": "Datapoints read per query ($instance)",
    "type": "timeseries"
    },
    {
    "datasource": {
    "type": "prometheus",
    "uid": "$ds"
    },
    "description": "99th percentile of number of raw datapoints scanner per query.\n\nThis number can exceed number of DatapointsReadPerQuery if `step` query arg passed to [/api/v1/query_range](https://prometheus.io/docs/prometheus/latest/querying/api/#range-queries) is smaller than the lookbehind window set in square brackets of [rollup function](https://docs.victoriametrics.com/MetricsQL.html#rollup-functions). For example, if `increase(some_metric[1h])` is executed with the `step=5m`, then the same raw samples on a hour time range are scanned `1h/5m=12` times. See [this article](https://valyala.medium.com/how-to-optimize-promql-and-metricsql-queries-85a1b75bf986) for details.",
    "fieldConfig": {
    "defaults": {
    "color": {
    "mode": "palette-classic"
    },
    "custom": {
    "axisCenteredZero": false,
    "axisColorMode": "text",
    "axisLabel": "",
    "axisPlacement": "auto",
    "barAlignment": 0,
    "drawStyle": "line",
    "fillOpacity": 0,
    "gradientMode": "none",
    "hideFrom": {
    "legend": false,
    "tooltip": false,
    "viz": false
    },
    "lineInterpolation": "linear",
    "lineWidth": 1,
    "pointSize": 5,
    "scaleDistribution": {
    "type": "linear"
    },
    "showPoints": "never",
    "spanNulls": false,
    "stacking": {
    "group": "A",
    "mode": "none"
    },
    "thresholdsStyle": {
    "mode": "off"
    }
    },
    "decimals": 2,
    "links": [],
    "mappings": [],
    "min": 0,
    "thresholds": {
    "mode": "absolute",
    "steps": [
    {
    "color": "green"
    },
    {
    "color": "red",
    "value": 80
    }
    ]
    },
    "unit": "short"
    },
    "overrides": []
    },
    "gridPos": {
    "h": 8,
    "w": 12,
    "x": 12,
    "y": 74
    },
    "id": 181,
    "links": [],
    "options": {
    "legend": {
    "calcs": [
    "mean",
    "lastNotNull",
    "max"
    ],
    "displayMode": "table",
    "placement": "bottom",
    "showLegend": true,
    "sortBy": "Last *",
    "sortDesc": true
    },
    "tooltip": {
    "mode": "multi",
    "sort": "desc"
    }
    },
    "pluginVersion": "9.1.0",
    "targets": [
    {
    "datasource": {
    "type": "prometheus",
    "uid": "$ds"
    },
    "editorMode": "code",
    "expr": "sum(histogram_quantile(0.99, sum(rate(vm_rows_scanned_per_query_bucket{job=~\"$job_select\", instance=~\"$instance\"}[$__rate_interval])) by (instance, vmrange)))",
    "format": "time_series",
    "interval": "",
    "intervalFactor": 1,
    "legendFormat": "datapoints",
    "range": true,
    "refId": "A"
    }
    ],
    "title": "Datapoints scanned per query ($instance)",
    "type": "timeseries"
    },
    {
    "datasource": {
    "type": "prometheus",
    "uid": "$ds"
    },
    "description": "Shows network usage between vmselects and clients, such as vmalert, Grafana, vmui, etc.",
    "fieldConfig": {
    "defaults": {
    "color": {
    "mode": "palette-classic"
    },
    "custom": {
    "axisCenteredZero": false,
    "axisColorMode": "text",
    "axisLabel": "",
    "axisPlacement": "auto",
    "barAlignment": 0,
    "drawStyle": "line",
    "fillOpacity": 0,
    "gradientMode": "none",
    "hideFrom": {
    "legend": false,
    "tooltip": false,
    "viz": false
    },
    "lineInterpolation": "linear",
    "lineWidth": 1,
    "pointSize": 5,
    "scaleDistribution": {
    "type": "linear"
    },
    "showPoints": "never",
    "spanNulls": false,
    "stacking": {
    "group": "A",
    "mode": "none"
    },
    "thresholdsStyle": {
    "mode": "off"
    }
    },
    "links": [],
    "mappings": [],
    "thresholds": {
    "mode": "absolute",
    "steps": [
    {
    "color": "green"
    },
    {
    "color": "red",
    "value": 80
    }
    ]
    },
    "unit": "bps"
    },
    "overrides": [
    {
    "matcher": {
    "id": "byRegexp",
    "options": "/read.*/"
    },
    "properties": [
    {
    "id": "custom.transform",
    "value": "negative-Y"
    }
    ]
    }
    ]
    },
    "gridPos": {
    "h": 8,
    "w": 12,
    "x": 0,
    "y": 82
    },
    "id": 93,
    "links": [],
    "options": {
    "legend": {
    "calcs": [
    "mean",
    "lastNotNull"
    ],
    "displayMode": "table",
    "placement": "bottom",
    "showLegend": true,
    "sortBy": "Last *",
    "sortDesc": true
    },
    "tooltip": {
    "mode": "multi",
    "sort": "desc"
    }
    },
    "pluginVersion": "9.1.0",
    "targets": [
    {
    "datasource": {
    "type": "prometheus",
    "uid": "$ds"
    },
    "editorMode": "code",
    "expr": "sum(rate(vm_tcplistener_read_bytes_total{job=~\"$job_select\", instance=~\"$instance\"}[$__rate_interval])) * 8 > 0",
    "format": "time_series",
    "intervalFactor": 1,
    "legendFormat": "read from client",
    "range": true,
    "refId": "A"
    },
    {
    "datasource": {
    "type": "prometheus",
    "uid": "$ds"
    },
    "editorMode": "code",
    "expr": "sum(rate(vm_tcplistener_written_bytes_total{job=~\"$job_select\", instance=~\"$instance\"}[$__rate_interval])) * 8 > 0",
    "format": "time_series",
    "hide": false,
    "intervalFactor": 1,
    "legendFormat": "write to client",
    "range": true,
    "refId": "B"
    }
    ],
    "title": "Network usage: clients ($instance)",
    "type": "timeseries"
    },
    {
    "datasource": {
    "type": "prometheus",
    "uid": "$ds"
    },
    "description": "Shows network usage between vmselects and vmstorages.",
    "fieldConfig": {
    "defaults": {
    "color": {
    "mode": "palette-classic"
    },
    "custom": {
    "axisCenteredZero": false,
    "axisColorMode": "text",
    "axisLabel": "",
    "axisPlacement": "auto",
    "barAlignment": 0,
    "drawStyle": "line",
    "fillOpacity": 0,
    "gradientMode": "none",
    "hideFrom": {
    "legend": false,
    "tooltip": false,
    "viz": false
    },
    "lineInterpolation": "linear",
    "lineWidth": 1,
    "pointSize": 5,
    "scaleDistribution": {
    "type": "linear"
    },
    "showPoints": "never",
    "spanNulls": false,
    "stacking": {
    "group": "A",
    "mode": "none"
    },
    "thresholdsStyle": {
    "mode": "off"
    }
    },
    "links": [],
    "mappings": [],
    "thresholds": {
    "mode": "absolute",
    "steps": [
    {
    "color": "green"
    },
    {
    "color": "red",
    "value": 80
    }
    ]
    },
    "unit": "bps"
    },
    "overrides": [
    {
    "matcher": {
    "id": "byRegexp",
    "options": "/read.*/"
    },
    "properties": [
    {
    "id": "custom.transform",
    "value": "negative-Y"
    }
    ]
    }
    ]
    },
    "gridPos": {
    "h": 8,
    "w": 12,
    "x": 12,
    "y": 82
    },
    "id": 207,
    "links": [],
    "options": {
    "legend": {
    "calcs": [
    "mean",
    "lastNotNull"
    ],
    "displayMode": "table",
    "placement": "bottom",
    "showLegend": true,
    "sortBy": "Last *",
    "sortDesc": true
    },
    "tooltip": {
    "mode": "multi",
    "sort": "desc"
    }
    },
    "pluginVersion": "9.1.0",
    "targets": [
    {
    "datasource": {
    "type": "prometheus",
    "uid": "$ds"
    },
    "editorMode": "code",
    "expr": "sum(rate(vm_tcpdialer_read_bytes_total{job=~\"$job_select\", instance=~\"$instance\"}[$__rate_interval])) * 8 > 0",
    "format": "time_series",
    "intervalFactor": 1,
    "legendFormat": "read from vmstorage",
    "range": true,
    "refId": "A"
    },
    {
    "datasource": {
    "type": "prometheus",
    "uid": "$ds"
    },
    "editorMode": "code",
    "expr": "sum(rate(vm_tcpdialer_written_bytes_total{job=~\"$job_select\", instance=~\"$instance\"}[$__rate_interval])) * 8 > 0",
    "format": "time_series",
    "hide": false,
    "intervalFactor": 1,
    "legendFormat": "write to vmstorage",
    "range": true,
    "refId": "B"
    }
    ],
    "title": "Network usage: vmstorage ($instance)",
    "type": "timeseries"
    }
    ],
    "title": "vmselect ($instance)",
    "type": "row"
    },
    {
    "collapsed": true,
    "datasource": {
    "type": "prometheus",
    "uid": "$ds"
    },
    "gridPos": {
    "h": 1,
    "w": 24,
    "x": 0,
    "y": 42
    },
    "id": 40,
    "panels": [
    {
    "datasource": {
    "type": "prometheus",
    "uid": "$ds"
    },
    "description": "* `*` - unsupported query path\n* `/write` - insert into VM\n* `/metrics` - query VM system metrics\n* `/query` - query instant values\n* `/query_range` - query over a range of time\n* `/series` - match a certain label set\n* `/label/{}/values` - query a list of label values (variables mostly)",
    "fieldConfig": {
    "defaults": {
    "color": {
    "mode": "palette-classic"
    },
    "custom": {
    "axisCenteredZero": false,
    "axisColorMode": "text",
    "axisLabel": "",
    "axisPlacement": "auto",
    "barAlignment": 0,
    "drawStyle": "line",
    "fillOpacity": 0,
    "gradientMode": "none",
    "hideFrom": {
    "legend": false,
    "tooltip": false,
    "viz": false
    },
    "lineInterpolation": "linear",
    "lineWidth": 1,
    "pointSize": 5,
    "scaleDistribution": {
    "type": "linear"
    },
    "showPoints": "never",
    "spanNulls": false,
    "stacking": {
    "group": "A",
    "mode": "none"
    },
    "thresholdsStyle": {
    "mode": "off"
    }
    },
    "links": [],
    "mappings": [],
    "min": 0,
    "thresholds": {
    "mode": "absolute",
    "steps": [
    {
    "color": "green"
    },
    {
    "color": "red",
    "value": 80
    }
    ]
    },
    "unit": "short"
    },
    "overrides": []
    },
    "gridPos": {
    "h": 8,
    "w": 12,
    "x": 0,
    "y": 51
    },
    "id": 97,
    "links": [],
    "options": {
    "legend": {
    "calcs": [
    "mean",
    "lastNotNull",
    "max"
    ],
    "displayMode": "table",
    "placement": "bottom",
    "showLegend": true,
    "sortBy": "Last *",
    "sortDesc": true
    },
    "tooltip": {
    "mode": "multi",
    "sort": "desc"
    }
    },
    "pluginVersion": "9.1.0",
    "targets": [
    {
    "datasource": {
    "type": "prometheus",
    "uid": "$ds"
    },
    "editorMode": "code",
    "expr": "sum(rate(vm_http_requests_total{job=~\"$job_insert\", instance=~\"$instance\"}[$__rate_interval])) by (path) > 0",
    "format": "time_series",
    "intervalFactor": 1,
    "legendFormat": "__auto",
    "range": true,
    "refId": "A"
    }
    ],
    "title": "Requests rate ($instance)",
    "type": "timeseries"
    },
    {
    "datasource": {
    "type": "prometheus",
    "uid": "$ds"
    },
    "description": "Shows the max number of ongoing insertions.\n* `max` - equal to number of CPU * 2 by default. May be configured with `maxConcurrentInserts` flag;\n* `current` - current number of goroutines busy with processing requests.\n\n`-maxConcurrentInserts` limits the number of insert requests which may be actively processed at any given point in time. All the other insert requests are queued for up to `-insert.maxQueueDuration` in the hope they will get a chance to be processed. This queue is used mostly for absorbing spikes for incoming insert request rate.\n\nWhen `current` hits `max` constantly, it means vminsert node is overloaded and requires more CPU or higher limits.",
    "fieldConfig": {
    "defaults": {
    "color": {
    "mode": "palette-classic"
    },
    "custom": {
    "axisCenteredZero": false,
    "axisColorMode": "text",
    "axisLabel": "",
    "axisPlacement": "auto",
    "barAlignment": 0,
    "drawStyle": "line",
    "fillOpacity": 10,
    "gradientMode": "none",
    "hideFrom": {
    "legend": false,
    "tooltip": false,
    "viz": false
    },
    "lineInterpolation": "linear",
    "lineWidth": 1,
    "pointSize": 5,
    "scaleDistribution": {
    "type": "linear"
    },
    "showPoints": "never",
    "spanNulls": false,
    "stacking": {
    "group": "A",
    "mode": "none"
    },
    "thresholdsStyle": {
    "mode": "off"
    }
    },
    "decimals": 0,
    "links": [],
    "mappings": [],
    "min": 0,
    "thresholds": {
    "mode": "absolute",
    "steps": [
    {
    "color": "green"
    },
    {
    "color": "red",
    "value": 80
    }
    ]
    },
    "unit": "short"
    },
    "overrides": [
    {
    "matcher": {
    "id": "byName",
    "options": "max"
    },
    "properties": [
    {
    "id": "color",
    "value": {
    "fixedColor": "#C4162A",
    "mode": "fixed"
    }
    },
    {
    "id": "custom.fillOpacity",
    "value": 0
    }
    ]
    }
    ]
    },
    "gridPos": {
    "h": 8,
    "w": 12,
    "x": 12,
    "y": 51
    },
    "id": 99,
    "links": [],
    "options": {
    "legend": {
    "calcs": [
    "mean",
    "lastNotNull",
    "max"
    ],
    "displayMode": "table",
    "placement": "bottom",
    "showLegend": true,
    "sortBy": "Last *",
    "sortDesc": true
    },
    "tooltip": {
    "mode": "multi",
    "sort": "desc"
    }
    },
    "pluginVersion": "9.1.0",
    "targets": [
    {
    "datasource": {
    "type": "prometheus",
    "uid": "$ds"
    },
    "editorMode": "code",
    "expr": "max(max_over_time(vm_concurrent_insert_current{job=~\"$job_insert\", instance=~\"$instance\"}[$__rate_interval]))",
    "format": "time_series",
    "interval": "",
    "intervalFactor": 1,
    "legendFormat": "current",
    "range": true,
    "refId": "A"
    },
    {
    "datasource": {
    "type": "prometheus",
    "uid": "$ds"
    },
    "exemplar": true,
    "expr": "min(vm_concurrent_insert_capacity{job=~\"$job_insert\", instance=~\"$instance\"})",
    "format": "time_series",
    "interval": "",
    "intervalFactor": 1,
    "legendFormat": "max",
    "refId": "B"
    }
    ],
    "title": "Concurrent inserts ($instance)",
    "type": "timeseries"
    },
    {
    "datasource": {
    "type": "prometheus",
    "uid": "$ds"
    },
    "fieldConfig": {
    "defaults": {
    "color": {
    "mode": "palette-classic"
    },
    "custom": {
    "axisCenteredZero": false,
    "axisColorMode": "text",
    "axisLabel": "",
    "axisPlacement": "auto",
    "barAlignment": 0,
    "drawStyle": "line",
    "fillOpacity": 0,
    "gradientMode": "none",
    "hideFrom": {
    "legend": false,
    "tooltip": false,
    "viz": false
    },
    "lineInterpolation": "linear",
    "lineWidth": 1,
    "pointSize": 5,
    "scaleDistribution": {
    "type": "linear"
    },
    "showPoints": "never",
    "spanNulls": false,
    "stacking": {
    "group": "A",
    "mode": "none"
    },
    "thresholdsStyle": {
    "mode": "line"
    }
    },
    "links": [
    {
    "targetBlank": true,
    "title": "Drilldown",
    "url": "/d/oS7Bi_0Wz?viewPanel=192&var-job=$job_insert&var-ds=$ds&var-instance=$instance&${__url_time_range}"
    }
    ],
    "mappings": [],
    "min": 0,
    "thresholds": {
    "mode": "absolute",
    "steps": [
    {
    "color": "green"
    },
    {
    "color": "red",
    "value": 0.9
    }
    ]
    },
    "unit": "percentunit"
    },
    "overrides": []
    },
    "gridPos": {
    "h": 8,
    "w": 12,
    "x": 0,
    "y": 59
    },
    "id": 185,
    "links": [],
    "options": {
    "legend": {
    "calcs": [
    "mean",
    "lastNotNull",
    "max"
    ],
    "displayMode": "table",
    "placement": "bottom",
    "showLegend": true,
    "sortBy": "Last *",
    "sortDesc": true
    },
    "tooltip": {
    "mode": "multi",
    "sort": "none"
    }
    },
    "pluginVersion": "9.1.0",
    "targets": [
    {
    "datasource": {
    "type": "prometheus",
    "uid": "$ds"
    },
    "editorMode": "code",
    "exemplar": true,
    "expr": "max(\n    rate(process_cpu_seconds_total{job=~\"$job_insert\", instance=~\"$instance\"}[$__rate_interval])\n    /\n    process_cpu_cores_available{job=~\"$job_insert\", instance=~\"$instance\"}\n)",
    "format": "time_series",
    "interval": "",
    "intervalFactor": 1,
    "legendFormat": "max",
    "range": true,
    "refId": "A"
    },
    {
    "datasource": {
    "type": "prometheus",
    "uid": "$ds"
    },
    "editorMode": "code",
    "exemplar": true,
    "expr": "min(\n    rate(process_cpu_seconds_total{job=~\"$job_insert\", instance=~\"$instance\"}[$__rate_interval])\n    /\n    process_cpu_cores_available{job=~\"$job_insert\", instance=~\"$instance\"}\n)",
    "format": "time_series",
    "hide": false,
    "interval": "",
    "intervalFactor": 1,
    "legendFormat": "min",
    "range": true,
    "refId": "B"
    },
    {
    "datasource": {
    "type": "prometheus",
    "uid": "$ds"
    },
    "editorMode": "code",
    "exemplar": true,
    "expr": "quantile(0.5,\n    rate(process_cpu_seconds_total{job=~\"$job_insert\", instance=~\"$instance\"}[$__rate_interval])\n    /\n    process_cpu_cores_available{job=~\"$job_insert\", instance=~\"$instance\"}\n)",
    "format": "time_series",
    "hide": false,
    "interval": "",
    "intervalFactor": 1,
    "legendFormat": "median",
    "range": true,
    "refId": "C"
    }
    ],
    "title": "CPU usage % ($instance)",
    "type": "timeseries"
    },
    {
    "datasource": {
    "type": "prometheus",
    "uid": "$ds"
    },
    "fieldConfig": {
    "defaults": {
    "color": {
    "mode": "palette-classic"
    },
    "custom": {
    "axisCenteredZero": false,
    "axisColorMode": "text",
    "axisLabel": "",
    "axisPlacement": "auto",
    "barAlignment": 0,
    "drawStyle": "line",
    "fillOpacity": 0,
    "gradientMode": "none",
    "hideFrom": {
    "legend": false,
    "tooltip": false,
    "viz": false
    },
    "lineInterpolation": "linear",
    "lineWidth": 1,
    "pointSize": 5,
    "scaleDistribution": {
    "type": "linear"
    },
    "showPoints": "never",
    "spanNulls": false,
    "stacking": {
    "group": "A",
    "mode": "none"
    },
    "thresholdsStyle": {
    "mode": "line"
    }
    },
    "links": [
    {
    "targetBlank": true,
    "title": "Drilldown",
    "url": "/d/oS7Bi_0Wz?viewPanel=189&var-job=$job_insert&var-ds=$ds&var-instance=$instance&${__url_time_range}"
    }
    ],
    "mappings": [],
    "min": 0,
    "thresholds": {
    "mode": "absolute",
    "steps": [
    {
    "color": "green"
    },
    {
    "color": "red",
    "value": 0.9
    }
    ]
    },
    "unit": "percentunit"
    },
    "overrides": []
    },
    "gridPos": {
    "h": 8,
    "w": 12,
    "x": 12,
    "y": 59
    },
    "id": 187,
    "links": [],
    "options": {
    "legend": {
    "calcs": [
    "mean",
    "lastNotNull",
    "max"
    ],
    "displayMode": "table",
    "placement": "bottom",
    "showLegend": true,
    "sortBy": "Last *",
    "sortDesc": true
    },
    "tooltip": {
    "mode": "multi",
    "sort": "none"
    }
    },
    "pluginVersion": "9.1.0",
    "targets": [
    {
    "datasource": {
    "type": "prometheus",
    "uid": "$ds"
    },
    "editorMode": "code",
    "exemplar": true,
    "expr": "max(\n    max_over_time(process_resident_memory_bytes{job=~\"$job_insert\", instance=~\"$instance\"}[$__rate_interval])\n    /\n    vm_available_memory_bytes{job=~\"$job_insert\", instance=~\"$instance\"}\n)",
    "format": "time_series",
    "interval": "",
    "intervalFactor": 1,
    "legendFormat": "max",
    "range": true,
    "refId": "A"
    },
    {
    "datasource": {
    "type": "prometheus",
    "uid": "$ds"
    },
    "editorMode": "code",
    "exemplar": true,
    "expr": "min(\n    max_over_time(process_resident_memory_bytes{job=~\"$job_insert\", instance=~\"$instance\"}[$__rate_interval])\n    /\n    vm_available_memory_bytes{job=~\"$job_insert\", instance=~\"$instance\"}\n)",
    "format": "time_series",
    "hide": false,
    "interval": "",
    "intervalFactor": 1,
    "legendFormat": "min",
    "range": true,
    "refId": "B"
    },
    {
    "datasource": {
    "type": "prometheus",
    "uid": "$ds"
    },
    "editorMode": "code",
    "exemplar": true,
    "expr": "quantile(0.5,\n    max_over_time(process_resident_memory_bytes{job=~\"$job_insert\", instance=~\"$instance\"}[$__rate_interval])\n    /\n    vm_available_memory_bytes{job=~\"$job_insert\", instance=~\"$instance\"}\n)",
    "format": "time_series",
    "hide": false,
    "interval": "",
    "intervalFactor": 1,
    "legendFormat": "median",
    "range": true,
    "refId": "C"
    }
    ],
    "title": "Memory usage % ($instance)",
    "type": "timeseries"
    },
    {
    "datasource": {
    "type": "prometheus",
    "uid": "$ds"
    },
    "description": "Shows the saturation level of connection between vminsert and vmstorage components. If the threshold of 0.9sec is reached, then the connection is saturated by more than 90% and vminsert won't be able to keep up. This usually means that more vminsert or vmstorage nodes must be added to the cluster in order to increase the total number of vminsert -> vmstorage links.\n",
    "fieldConfig": {
    "defaults": {
    "color": {
    "mode": "palette-classic"
    },
    "custom": {
    "axisCenteredZero": false,
    "axisColorMode": "text",
    "axisLabel": "",
    "axisPlacement": "auto",
    "barAlignment": 0,
    "drawStyle": "line",
    "fillOpacity": 0,
    "gradientMode": "none",
    "hideFrom": {
    "legend": false,
    "tooltip": false,
    "viz": false
    },
    "lineInterpolation": "linear",
    "lineWidth": 1,
    "pointSize": 5,
    "scaleDistribution": {
    "type": "linear"
    },
    "showPoints": "never",
    "spanNulls": false,
    "stacking": {
    "group": "A",
    "mode": "none"
    },
    "thresholdsStyle": {
    "mode": "line+area"
    }
    },
    "decimals": 0,
    "links": [],
    "mappings": [],
    "min": 0,
    "thresholds": {
    "mode": "absolute",
    "steps": [
    {
    "color": "transparent"
    },
    {
    "color": "red",
    "value": 0.9
    }
    ]
    },
    "unit": "s"
    },
    "overrides": []
    },
    "gridPos": {
    "h": 8,
    "w": 12,
    "x": 0,
    "y": 67
    },
    "id": 139,
    "links": [],
    "options": {
    "legend": {
    "calcs": [
    "mean",
    "lastNotNull"
    ],
    "displayMode": "table",
    "placement": "bottom",
    "showLegend": true,
    "sortBy": "Last *",
    "sortDesc": true
    },
    "tooltip": {
    "mode": "multi",
    "sort": "desc"
    }
    },
    "pluginVersion": "9.1.0",
    "targets": [
    {
    "datasource": {
    "type": "prometheus",
    "uid": "$ds"
    },
    "editorMode": "code",
    "exemplar": true,
    "expr": "max(rate(vm_rpc_send_duration_seconds_total{job=~\"$job\", instance=~\"$instance\"}[$__rate_interval])) by(addr)",
    "format": "time_series",
    "interval": "",
    "intervalFactor": 1,
    "legendFormat": "__auto",
    "range": true,
    "refId": "A"
    }
    ],
    "title": "Storage connection saturation ($instance)",
    "type": "timeseries"
    },
    {
    "datasource": {
    "type": "prometheus",
    "uid": "$ds"
    },
    "description": "Shows when vmstorage node is unreachable for vminsert.",
    "fieldConfig": {
    "defaults": {
    "color": {
    "mode": "palette-classic"
    },
    "custom": {
    "axisCenteredZero": false,
    "axisColorMode": "text",
    "axisLabel": "",
    "axisPlacement": "auto",
    "barAlignment": 0,
    "drawStyle": "line",
    "fillOpacity": 0,
    "gradientMode": "none",
    "hideFrom": {
    "legend": false,
    "tooltip": false,
    "viz": false
    },
    "lineInterpolation": "linear",
    "lineWidth": 1,
    "pointSize": 5,
    "scaleDistribution": {
    "type": "linear"
    },
    "showPoints": "never",
    "spanNulls": false,
    "stacking": {
    "group": "A",
    "mode": "none"
    },
    "thresholdsStyle": {
    "mode": "off"
    }
    },
    "decimals": 0,
    "links": [],
    "mappings": [],
    "min": 0,
    "thresholds": {
    "mode": "absolute",
    "steps": [
    {
    "color": "green"
    },
    {
    "color": "red",
    "value": 80
    }
    ]
    },
    "unit": "short"
    },
    "overrides": []
    },
    "gridPos": {
    "h": 8,
    "w": 12,
    "x": 12,
    "y": 67
    },
    "id": 114,
    "links": [],
    "options": {
    "legend": {
    "calcs": [
    "mean",
    "lastNotNull"
    ],
    "displayMode": "table",
    "placement": "bottom",
    "showLegend": true
    },
    "tooltip": {
    "mode": "multi",
    "sort": "desc"
    }
    },
    "pluginVersion": "9.1.0",
    "targets": [
    {
    "datasource": {
    "type": "prometheus",
    "uid": "$ds"
    },
    "editorMode": "code",
    "expr": "vm_rpc_vmstorage_is_reachable{job=~\"$job\", instance=~\"$instance\"} != 1",
    "format": "time_series",
    "interval": "",
    "intervalFactor": 1,
    "legendFormat": "{{instance}} => {{addr}}",
    "range": true,
    "refId": "A"
    }
    ],
    "title": "Storage reachability ($instance)",
    "type": "timeseries"
    },
    {
    "datasource": {
    "type": "prometheus",
    "uid": "$ds"
    },
    "description": "Shows network usage between vminserts and clients, such as vmagent, Prometheus, or any other client pushing metrics to vminsert.",
    "fieldConfig": {
    "defaults": {
    "color": {
    "mode": "palette-classic"
    },
    "custom": {
    "axisCenteredZero": false,
    "axisColorMode": "text",
    "axisLabel": "",
    "axisPlacement": "auto",
    "barAlignment": 0,
    "drawStyle": "line",
    "fillOpacity": 0,
    "gradientMode": "none",
    "hideFrom": {
    "legend": false,
    "tooltip": false,
    "viz": false
    },
    "lineInterpolation": "linear",
    "lineWidth": 1,
    "pointSize": 5,
    "scaleDistribution": {
    "type": "linear"
    },
    "showPoints": "never",
    "spanNulls": false,
    "stacking": {
    "group": "A",
    "mode": "none"
    },
    "thresholdsStyle": {
    "mode": "off"
    }
    },
    "links": [],
    "mappings": [],
    "thresholds": {
    "mode": "absolute",
    "steps": [
    {
    "color": "green"
    },
    {
    "color": "red",
    "value": 80
    }
    ]
    },
    "unit": "bps"
    },
    "overrides": [
    {
    "matcher": {
    "id": "byRegexp",
    "options": "/read.*/"
    },
    "properties": [
    {
    "id": "custom.transform",
    "value": "negative-Y"
    }
    ]
    }
    ]
    },
    "gridPos": {
    "h": 8,
    "w": 12,
    "x": 0,
    "y": 75
    },
    "id": 208,
    "links": [],
    "options": {
    "legend": {
    "calcs": [
    "mean",
    "lastNotNull"
    ],
    "displayMode": "table",
    "placement": "bottom",
    "showLegend": true,
    "sortBy": "Last *",
    "sortDesc": true
    },
    "tooltip": {
    "mode": "multi",
    "sort": "desc"
    }
    },
    "pluginVersion": "9.1.0",
    "targets": [
    {
    "datasource": {
    "type": "prometheus",
    "uid": "$ds"
    },
    "editorMode": "code",
    "expr": "sum(rate(vm_tcplistener_read_bytes_total{job=~\"$job_insert\", instance=~\"$instance\"}[$__rate_interval])) * 8 > 0",
    "format": "time_series",
    "intervalFactor": 1,
    "legendFormat": "read from client",
    "range": true,
    "refId": "A"
    },
    {
    "datasource": {
    "type": "prometheus",
    "uid": "$ds"
    },
    "editorMode": "code",
    "expr": "sum(rate(vm_tcplistener_written_bytes_total{job=~\"$job_insert\", instance=~\"$instance\"}[$__rate_interval])) * 8 > 0",
    "format": "time_series",
    "hide": false,
    "intervalFactor": 1,
    "legendFormat": "write to client",
    "range": true,
    "refId": "B"
    }
    ],
    "title": "Network usage: clients ($instance)",
    "type": "timeseries"
    },
    {
    "datasource": {
    "type": "prometheus",
    "uid": "$ds"
    },
    "description": "Shows network usage between vminserts and vmstorages.",
    "fieldConfig": {
    "defaults": {
    "color": {
    "mode": "palette-classic"
    },
    "custom": {
    "axisCenteredZero": false,
    "axisColorMode": "text",
    "axisLabel": "",
    "axisPlacement": "auto",
    "barAlignment": 0,
    "drawStyle": "line",
    "fillOpacity": 0,
    "gradientMode": "none",
    "hideFrom": {
    "legend": false,
    "tooltip": false,
    "viz": false
    },
    "lineInterpolation": "linear",
    "lineWidth": 1,
    "pointSize": 5,
    "scaleDistribution": {
    "type": "linear"
    },
    "showPoints": "never",
    "spanNulls": false,
    "stacking": {
    "group": "A",
    "mode": "none"
    },
    "thresholdsStyle": {
    "mode": "off"
    }
    },
    "links": [],
    "mappings": [],
    "thresholds": {
    "mode": "absolute",
    "steps": [
    {
    "color": "green"
    },
    {
    "color": "red",
    "value": 80
    }
    ]
    },
    "unit": "bps"
    },
    "overrides": [
    {
    "matcher": {
    "id": "byRegexp",
    "options": "/read.*/"
    },
    "properties": [
    {
    "id": "custom.transform",
    "value": "negative-Y"
    }
    ]
    }
    ]
    },
    "gridPos": {
    "h": 8,
    "w": 12,
    "x": 12,
    "y": 75
    },
    "id": 209,
    "links": [],
    "options": {
    "legend": {
    "calcs": [
    "mean",
    "lastNotNull"
    ],
    "displayMode": "table",
    "placement": "bottom",
    "showLegend": true,
    "sortBy": "Last *",
    "sortDesc": true
    },
    "tooltip": {
    "mode": "multi",
    "sort": "desc"
    }
    },
    "pluginVersion": "9.1.0",
    "targets": [
    {
    "datasource": {
    "type": "prometheus",
    "uid": "$ds"
    },
    "editorMode": "code",
    "expr": "sum(rate(vm_tcpdialer_read_bytes_total{job=~\"$job_insert\", instance=~\"$instance\"}[$__rate_interval])) * 8 > 0",
    "format": "time_series",
    "intervalFactor": 1,
    "legendFormat": "read from vmstorage",
    "range": true,
    "refId": "A"
    },
    {
    "datasource": {
    "type": "prometheus",
    "uid": "$ds"
    },
    "editorMode": "code",
    "expr": "sum(rate(vm_tcpdialer_written_bytes_total{job=~\"$job_insert\", instance=~\"$instance\"}[$__rate_interval])) * 8 > 0",
    "format": "time_series",
    "hide": false,
    "intervalFactor": 1,
    "legendFormat": "write to vmstorage",
    "range": true,
    "refId": "B"
    }
    ],
    "title": "Network usage: vmstorage ($instance)",
    "type": "timeseries"
    },
    {
    "datasource": {
    "type": "prometheus",
    "uid": "$ds"
    },
    "description": "",
    "fieldConfig": {
    "defaults": {
    "color": {
    "mode": "palette-classic"
    },
    "custom": {
    "axisCenteredZero": false,
    "axisColorMode": "text",
    "axisLabel": "",
    "axisPlacement": "auto",
    "barAlignment": 0,
    "drawStyle": "line",
    "fillOpacity": 0,
    "gradientMode": "none",
    "hideFrom": {
    "legend": false,
    "tooltip": false,
    "viz": false
    },
    "lineInterpolation": "linear",
    "lineWidth": 1,
    "pointSize": 5,
    "scaleDistribution": {
    "type": "linear"
    },
    "showPoints": "never",
    "spanNulls": false,
    "stacking": {
    "group": "A",
    "mode": "none"
    },
    "thresholdsStyle": {
    "mode": "off"
    }
    },
    "decimals": 2,
    "links": [],
    "mappings": [],
    "min": 0,
    "thresholds": {
    "mode": "absolute",
    "steps": [
    {
    "color": "green"
    },
    {
    "color": "red",
    "value": 80
    }
    ]
    },
    "unit": "short"
    },
    "overrides": []
    },
    "gridPos": {
    "h": 8,
    "w": 12,
    "x": 12,
    "y": 83
    },
    "id": 88,
    "links": [],
    "options": {
    "legend": {
    "calcs": [
    "mean",
    "lastNotNull",
    "max"
    ],
    "displayMode": "table",
    "placement": "bottom",
    "showLegend": true,
    "sortBy": "Last *",
    "sortDesc": true
    },
    "tooltip": {
    "mode": "multi",
    "sort": "desc"
    }
    },
    "pluginVersion": "9.1.0",
    "targets": [
    {
    "datasource": {
    "type": "prometheus",
    "uid": "$ds"
    },
    "editorMode": "code",
    "expr": "max(histogram_quantile(0.99, sum(increase(vm_rows_per_insert_bucket{job=~\"$job\", instance=~\"$instance\"}[$__rate_interval])) by (instance, vmrange)))",
    "format": "time_series",
    "interval": "",
    "intervalFactor": 1,
    "legendFormat": "max",
    "range": true,
    "refId": "A"
    }
    ],
    "title": "Rows per insert ($instance)",
    "type": "timeseries"
    }
    ],
    "title": "vminsert ($instance)",
    "type": "row"
    },
    {
    "collapsed": true,
    "gridPos": {
    "h": 1,
    "w": 24,
    "x": 0,
    "y": 43
    },
    "id": 194,
    "panels": [
    {
    "datasource": {
    "type": "prometheus",
    "uid": "$ds"
    },
    "gridPos": {
    "h": 2,
    "w": 24,
    "x": 0,
    "y": 100
    },
    "id": 198,
    "options": {
    "code": {
    "language": "plaintext",
    "showLineNumbers": false,
    "showMiniMap": false
    },
    "content": "Drilldown row is used by other panels on the dashboard to show more detailed metrics per-instance.",
    "mode": "markdown"
    },
    "pluginVersion": "9.2.7",
    "transparent": true,
    "type": "text"
    },
    {
    "datasource": {
    "type": "prometheus",
    "uid": "$ds"
    },
    "description": "Shows the used memory (resident).\nThe application's performance will significantly degrade when memory usage is close to 100%.",
    "fieldConfig": {
    "defaults": {
    "color": {
    "mode": "palette-classic"
    },
    "custom": {
    "axisCenteredZero": false,
    "axisColorMode": "text",
    "axisLabel": "",
    "axisPlacement": "auto",
    "barAlignment": 0,
    "drawStyle": "line",
    "fillOpacity": 0,
    "gradientMode": "none",
    "hideFrom": {
    "legend": false,
    "tooltip": false,
    "viz": false
    },
    "lineInterpolation": "linear",
    "lineWidth": 1,
    "pointSize": 5,
    "scaleDistribution": {
    "type": "linear"
    },
    "showPoints": "never",
    "spanNulls": false,
    "stacking": {
    "group": "A",
    "mode": "none"
    },
    "thresholdsStyle": {
    "mode": "off"
    }
    },
    "links": [],
    "mappings": [],
    "min": 0,
    "thresholds": {
    "mode": "absolute",
    "steps": [
    {
    "color": "green"
    }
    ]
    },
    "unit": "decbytes"
    },
    "overrides": []
    },
    "gridPos": {
    "h": 8,
    "w": 12,
    "x": 0,
    "y": 102
    },
    "id": 189,
    "links": [],
    "options": {
    "legend": {
    "calcs": [
    "mean",
    "lastNotNull",
    "max"
    ],
    "displayMode": "table",
    "placement": "bottom",
    "showLegend": true,
    "sortBy": "Last *",
    "sortDesc": true
    },
    "tooltip": {
    "mode": "multi",
    "sort": "desc"
    }
    },
    "pluginVersion": "9.1.0",
    "targets": [
    {
    "datasource": {
    "type": "prometheus",
    "uid": "$ds"
    },
    "editorMode": "code",
    "exemplar": true,
    "expr": "max_over_time(process_resident_memory_bytes{job=~\"$job\", instance=~\"$instance\"}[$__rate_interval])",
    "interval": "",
    "legendFormat": "{{instance}} ({{job}})",
    "range": true,
    "refId": "A"
    }
    ],
    "title": "RSS memory usage ($instance)",
    "type": "timeseries"
    },
    {
    "datasource": {
    "type": "prometheus",
    "uid": "$ds"
    },
    "description": "RSS share for memory allocated by the process itself. This share cannot be freed by the OS, so it must be taken into account by OOM killer.",
    "fieldConfig": {
    "defaults": {
    "color": {
    "mode": "palette-classic"
    },
    "custom": {
    "axisCenteredZero": false,
    "axisColorMode": "text",
    "axisLabel": "",
    "axisPlacement": "auto",
    "barAlignment": 0,
    "drawStyle": "line",
    "fillOpacity": 0,
    "gradientMode": "none",
    "hideFrom": {
    "legend": false,
    "tooltip": false,
    "viz": false
    },
    "lineInterpolation": "linear",
    "lineWidth": 1,
    "pointSize": 5,
    "scaleDistribution": {
    "type": "linear"
    },
    "showPoints": "never",
    "spanNulls": false,
    "stacking": {
    "group": "A",
    "mode": "none"
    },
    "thresholdsStyle": {
    "mode": "off"
    }
    },
    "links": [],
    "mappings": [],
    "min": 0,
    "thresholds": {
    "mode": "absolute",
    "steps": [
    {
    "color": "green"
    }
    ]
    },
    "unit": "decbytes"
    },
    "overrides": []
    },
    "gridPos": {
    "h": 8,
    "w": 12,
    "x": 12,
    "y": 102
    },
    "id": 190,
    "links": [],
    "options": {
    "legend": {
    "calcs": [
    "mean",
    "lastNotNull",
    "max"
    ],
    "displayMode": "table",
    "placement": "bottom",
    "showLegend": true,
    "sortBy": "Last *",
    "sortDesc": true
    },
    "tooltip": {
    "mode": "multi",
    "sort": "desc"
    }
    },
    "pluginVersion": "9.1.0",
    "targets": [
    {
    "datasource": {
    "type": "prometheus",
    "uid": "$ds"
    },
    "editorMode": "code",
    "exemplar": true,
    "expr": "max_over_time(process_resident_memory_anon_bytes{job=~\"$job\", instance=~\"$instance\"}[$__rate_interval])",
    "interval": "",
    "legendFormat": "{{instance}} ({{job}})",
    "range": true,
    "refId": "A"
    }
    ],
    "title": "RSS anonymous memory usage ($instance)",
    "type": "timeseries"
    },
    {
    "datasource": {
    "type": "prometheus",
    "uid": "$ds"
    },
    "description": "",
    "fieldConfig": {
    "defaults": {
    "color": {
    "mode": "palette-classic"
    },
    "custom": {
    "axisCenteredZero": false,
    "axisColorMode": "text",
    "axisLabel": "",
    "axisPlacement": "auto",
    "barAlignment": 0,
    "drawStyle": "line",
    "fillOpacity": 0,
    "gradientMode": "none",
    "hideFrom": {
    "legend": false,
    "tooltip": false,
    "viz": false
    },
    "lineInterpolation": "linear",
    "lineWidth": 1,
    "pointSize": 5,
    "scaleDistribution": {
    "type": "linear"
    },
    "showPoints": "never",
    "spanNulls": false,
    "stacking": {
    "group": "A",
    "mode": "none"
    },
    "thresholdsStyle": {
    "mode": "off"
    }
    },
    "links": [],
    "mappings": [],
    "min": 0,
    "thresholds": {
    "mode": "absolute",
    "steps": [
    {
    "color": "green"
    }
    ]
    },
    "unit": "short"
    },
    "overrides": []
    },
    "gridPos": {
    "h": 7,
    "w": 12,
    "x": 0,
    "y": 110
    },
    "id": 192,
    "links": [],
    "options": {
    "legend": {
    "calcs": [
    "mean",
    "lastNotNull",
    "max"
    ],
    "displayMode": "table",
    "placement": "bottom",
    "showLegend": true,
    "sortBy": "Last *",
    "sortDesc": true
    },
    "tooltip": {
    "mode": "multi",
    "sort": "desc"
    }
    },
    "pluginVersion": "9.1.0",
    "targets": [
    {
    "datasource": {
    "type": "prometheus",
    "uid": "$ds"
    },
    "editorMode": "code",
    "exemplar": false,
    "expr": "sum(rate(process_cpu_seconds_total{job=~\"$job\", instance=~\"$instance\"}[$__rate_interval])) by(job, instance)",
    "format": "time_series",
    "interval": "",
    "intervalFactor": 1,
    "legendFormat": "{{instance}} ({{job}})",
    "range": true,
    "refId": "A"
    }
    ],
    "title": "CPU usage ($instance)",
    "type": "timeseries"
    },
    {
    "datasource": {
    "type": "prometheus",
    "uid": "$ds"
    },
    "description": "Shows the approx time needed to reach 100% of disk capacity based on the following params:\n* free disk space;\n* row ingestion rate;\n* compression.\n\nNote: this panel doesn't account for deduplication process.",
    "fieldConfig": {
    "defaults": {
    "color": {
    "mode": "palette-classic"
    },
    "custom": {
    "axisCenteredZero": false,
    "axisColorMode": "text",
    "axisLabel": "",
    "axisPlacement": "auto",
    "barAlignment": 0,
    "drawStyle": "line",
    "fillOpacity": 0,
    "gradientMode": "none",
    "hideFrom": {
    "legend": false,
    "tooltip": false,
    "viz": false
    },
    "lineInterpolation": "linear",
    "lineWidth": 1,
    "pointSize": 5,
    "scaleDistribution": {
    "type": "linear"
    },
    "showPoints": "never",
    "spanNulls": false,
    "stacking": {
    "group": "A",
    "mode": "none"
    },
    "thresholdsStyle": {
    "mode": "off"
    }
    },
    "links": [],
    "mappings": [],
    "min": 0,
    "thresholds": {
    "mode": "absolute",
    "steps": [
    {
    "color": "green"
    },
    {
    "color": "red",
    "value": 80
    }
    ]
    },
    "unit": "s"
    },
    "overrides": []
    },
    "gridPos": {
    "h": 7,
    "w": 12,
    "x": 12,
    "y": 110
    },
    "id": 196,
    "links": [],
    "options": {
    "legend": {
    "calcs": [
    "mean",
    "lastNotNull",
    "min"
    ],
    "displayMode": "table",
    "placement": "bottom",
    "showLegend": true,
    "sortBy": "Last *",
    "sortDesc": true
    },
    "tooltip": {
    "mode": "multi",
    "sort": "none"
    }
    },
    "pluginVersion": "9.1.0",
    "targets": [
    {
    "datasource": {
    "type": "prometheus",
    "uid": "$ds"
    },
    "editorMode": "code",
    "expr": "vm_free_disk_space_bytes{job=~\"$job_storage\", instance=~\"$instance\"} \n/ \nignoring(path) (\n    rate(vm_rows_added_to_storage_total{job=~\"$job_storage\", instance=~\"$instance\"}[1d])\n    * scalar(\n            sum(vm_data_size_bytes{job=~\"$job_storage\", instance=~\"$instance\", type!~\"indexdb.*\"})\n            / \n            sum(vm_rows{job=~\"$job_storage\", instance=~\"$instance\", type!~\"indexdb.*\"})\n            )\n)",
    "format": "time_series",
    "interval": "",
    "intervalFactor": 1,
    "legendFormat": "{{instance}}",
    "range": true,
    "refId": "A"
    }
    ],
    "title": "Storage full ETA ($instance)",
    "type": "timeseries"
    },
    {
    "datasource": {
    "type": "prometheus",
    "uid": "$ds"
    },
    "description": "Shows the percentage of used disk space. It is recommended to have at least 20% of free disk space for the best performance.",
    "fieldConfig": {
    "defaults": {
    "color": {
    "mode": "palette-classic"
    },
    "custom": {
    "axisCenteredZero": false,
    "axisColorMode": "text",
    "axisLabel": "",
    "axisPlacement": "auto",
    "barAlignment": 0,
    "drawStyle": "line",
    "fillOpacity": 0,
    "gradientMode": "none",
    "hideFrom": {
    "legend": false,
    "tooltip": false,
    "viz": false
    },
    "lineInterpolation": "linear",
    "lineWidth": 1,
    "pointSize": 5,
    "scaleDistribution": {
    "type": "linear"
    },
    "showPoints": "never",
    "spanNulls": false,
    "stacking": {
    "group": "A",
    "mode": "none"
    },
    "thresholdsStyle": {
    "mode": "line"
    }
    },
    "links": [],
    "mappings": [],
    "min": 0,
    "thresholds": {
    "mode": "absolute",
    "steps": [
    {
    "color": "green"
    }
    ]
    },
    "unit": "decbytes"
    },
    "overrides": []
    },
    "gridPos": {
    "h": 8,
    "w": 12,
    "x": 0,
    "y": 117
    },
    "id": 200,
    "links": [],
    "options": {
    "legend": {
    "calcs": [
    "mean",
    "lastNotNull",
    "max"
    ],
    "displayMode": "table",
    "placement": "bottom",
    "showLegend": true,
    "sortBy": "Last *",
    "sortDesc": true
    },
    "tooltip": {
    "mode": "multi",
    "sort": "desc"
    }
    },
    "pluginVersion": "9.1.0",
    "targets": [
    {
    "datasource": {
    "type": "prometheus",
    "uid": "$ds"
    },
    "editorMode": "code",
    "expr": "sum(vm_data_size_bytes{job=~\"$job\", instance=~\"$instance\"}) by(job, instance)",
    "format": "time_series",
    "intervalFactor": 1,
    "legendFormat": "",
    "range": true,
    "refId": "A"
    }
    ],
    "title": "Disk space usage ($instance)",
    "type": "timeseries"
    },
    {
    "datasource": {
    "type": "prometheus",
    "uid": "$ds"
    },
    "description": "",
    "fieldConfig": {
    "defaults": {
    "color": {
    "mode": "palette-classic"
    },
    "custom": {
    "axisCenteredZero": false,
    "axisColorMode": "text",
    "axisLabel": "",
    "axisPlacement": "auto",
    "barAlignment": 0,
    "drawStyle": "line",
    "fillOpacity": 0,
    "gradientMode": "none",
    "hideFrom": {
    "legend": false,
    "tooltip": false,
    "viz": false
    },
    "lineInterpolation": "linear",
    "lineWidth": 1,
    "pointSize": 5,
    "scaleDistribution": {
    "type": "linear"
    },
    "showPoints": "never",
    "spanNulls": false,
    "stacking": {
    "group": "A",
    "mode": "none"
    },
    "thresholdsStyle": {
    "mode": "line"
    }
    },
    "links": [],
    "mappings": [],
    "min": 0,
    "thresholds": {
    "mode": "absolute",
    "steps": [
    {
    "color": "green"
    }
    ]
    },
    "unit": "decbytes"
    },
    "overrides": []
    },
    "gridPos": {
    "h": 8,
    "w": 12,
    "x": 12,
    "y": 117
    },
    "id": 201,
    "links": [],
    "options": {
    "legend": {
    "calcs": [
    "mean",
    "lastNotNull",
    "max"
    ],
    "displayMode": "table",
    "placement": "bottom",
    "showLegend": true,
    "sortBy": "Last *",
    "sortDesc": true
    },
    "tooltip": {
    "mode": "multi",
    "sort": "desc"
    }
    },
    "pluginVersion": "9.1.0",
    "targets": [
    {
    "datasource": {
    "type": "prometheus",
    "uid": "$ds"
    },
    "editorMode": "code",
    "expr": "sum(vm_data_size_bytes{job=~\"$job\", instance=~\"$instance\", type=~\"indexdb.*\"}) by(job, instance)",
    "format": "time_series",
    "intervalFactor": 1,
    "legendFormat": "{{job}}:{{instance}} (indexdb)",
    "range": true,
    "refId": "A"
    },
    {
    "datasource": {
    "type": "prometheus",
    "uid": "$ds"
    },
    "editorMode": "code",
    "expr": "sum(vm_data_size_bytes{job=~\"$job\", instance=~\"$instance\", type!~\"indexdb.*\"}) by(job, instance)",
    "format": "time_series",
    "hide": false,
    "intervalFactor": 1,
    "legendFormat": "{{job}}:{{instance}} (datapoints)",
    "range": true,
    "refId": "B"
    }
    ],
    "title": "Disk space usage by type ($instance)",
    "type": "timeseries"
    },
    {
    "datasource": {
    "type": "prometheus",
    "uid": "$ds"
    },
    "description": "Shows the rate of logging the messages by their level. Unexpected spike in rate is a good reason to check logs.",
    "fieldConfig": {
    "defaults": {
    "color": {
    "mode": "palette-classic"
    },
    "custom": {
    "axisCenteredZero": false,
    "axisColorMode": "text",
    "axisLabel": "",
    "axisPlacement": "auto",
    "barAlignment": 0,
    "drawStyle": "bars",
    "fillOpacity": 100,
    "gradientMode": "none",
    "hideFrom": {
    "legend": false,
    "tooltip": false,
    "viz": false
    },
    "lineInterpolation": "linear",
    "lineWidth": 1,
    "pointSize": 5,
    "scaleDistribution": {
    "type": "linear"
    },
    "showPoints": "never",
    "spanNulls": false,
    "stacking": {
    "group": "A",
    "mode": "none"
    },
    "thresholdsStyle": {
    "mode": "off"
    }
    },
    "links": [],
    "mappings": [],
    "min": 0,
    "thresholds": {
    "mode": "absolute",
    "steps": [
    {
    "color": "green"
    },
    {
    "color": "red",
    "value": 80
    }
    ]
    },
    "unit": "short"
    },
    "overrides": []
    },
    "gridPos": {
    "h": 8,
    "w": 12,
    "x": 0,
    "y": 125
    },
    "id": 203,
    "links": [],
    "options": {
    "legend": {
    "calcs": [
    "mean",
    "lastNotNull",
    "max"
    ],
    "displayMode": "table",
    "placement": "bottom",
    "showLegend": true,
    "sortBy": "Last *",
    "sortDesc": true
    },
    "tooltip": {
    "mode": "multi",
    "sort": "desc"
    }
    },
    "pluginVersion": "9.1.0",
    "targets": [
    {
    "datasource": {
    "type": "prometheus",
    "uid": "$ds"
    },
    "editorMode": "code",
    "exemplar": true,
    "expr": "sum(rate(vm_log_messages_total{job=~\"$job\",instance=~\"$instance\", level!=\"info\"}[$__rate_interval])) by (job, instance, level, location) > 0",
    "format": "time_series",
    "hide": false,
    "interval": "5m",
    "intervalFactor": 1,
    "legendFormat": "__auto",
    "range": true,
    "refId": "A"
    }
    ],
    "title": "Logging rate",
    "type": "timeseries"
    }
    ],
    "title": "Drilldown",
    "type": "row"
    }
    ],
    "refresh": "",
    "schemaVersion": 39,
    "tags": [],
    "templating": {
    "list": [
    {
    "current": {
    "selected": false,
    "text": "VictoriaMetrics - cluster",
    "value": "PAF93674D0B4E9963"
    },
    "hide": 0,
    "includeAll": false,
    "multi": false,
    "name": "ds",
    "options": [],
    "query": "prometheus",
    "queryValue": "",
    "refresh": 1,
    "regex": "",
    "skipUrlSync": false,
    "type": "datasource"
    },
    {
    "current": {},
    "datasource": {
    "type": "prometheus",
    "uid": "$ds"
    },
    "definition": "label_values(vm_app_version{version=~\"^vm(insert|select|storage).*\"}, job)",
    "hide": 0,
    "includeAll": true,
    "multi": true,
    "name": "job",
    "options": [],
    "query": {
    "query": "label_values(vm_app_version{version=~\"^vm(insert|select|storage).*\"}, job)",
    "refId": "VictoriaMetrics-job-Variable-Query"
    },
    "refresh": 1,
    "regex": "",
    "skipUrlSync": false,
    "sort": 0,
    "tagValuesQuery": "",
    "tagsQuery": "",
    "type": "query",
    "useTags": false
    },
    {
    "current": {},
    "datasource": {
    "type": "prometheus",
    "uid": "$ds"
    },
    "definition": "label_values(vm_app_version{job=~\"$job\", version=~\"^vminsert.*\"}, job)",
    "hide": 2,
    "includeAll": true,
    "multi": true,
    "name": "job_insert",
    "options": [],
    "query": {
    "query": "label_values(vm_app_version{job=~\"$job\", version=~\"^vminsert.*\"}, job)",
    "refId": "StandardVariableQuery"
    },
    "refresh": 1,
    "regex": "",
    "skipUrlSync": false,
    "sort": 0,
    "tagValuesQuery": "",
    "tagsQuery": "",
    "type": "query",
    "useTags": false
    },
    {
    "current": {},
    "datasource": {
    "type": "prometheus",
    "uid": "$ds"
    },
    "definition": "label_values(vm_app_version{job=~\"$job\", version=~\"^vmselect.*\"}, job)",
    "hide": 2,
    "includeAll": true,
    "multi": true,
    "name": "job_select",
    "options": [],
    "query": {
    "query": "label_values(vm_app_version{job=~\"$job\", version=~\"^vmselect.*\"}, job)",
    "refId": "StandardVariableQuery"
    },
    "refresh": 1,
    "regex": "",
    "skipUrlSync": false,
    "sort": 0,
    "tagValuesQuery": "",
    "tagsQuery": "",
    "type": "query",
    "useTags": false
    },
    {
    "current": {},
    "datasource": {
    "type": "prometheus",
    "uid": "$ds"
    },
    "definition": "label_values(vm_app_version{job=~\"$job\", version=~\"^vmstorage.*\"}, job)",
    "hide": 2,
    "includeAll": true,
    "multi": true,
    "name": "job_storage",
    "options": [],
    "query": {
    "query": "label_values(vm_app_version{job=~\"$job\", version=~\"^vmstorage.*\"}, job)",
    "refId": "StandardVariableQuery"
    },
    "refresh": 1,
    "regex": "",
    "skipUrlSync": false,
    "sort": 0,
    "tagValuesQuery": "",
    "tagsQuery": "",
    "type": "query",
    "useTags": false
    },
    {
    "allValue": ".*",
    "current": {},
    "datasource": {
    "type": "prometheus",
    "uid": "$ds"
    },
    "definition": "label_values(vm_app_version{job=~\"$job\"}, instance)",
    "hide": 0,
    "includeAll": true,
    "multi": true,
    "name": "instance",
    "options": [],
    "query": {
    "query": "label_values(vm_app_version{job=~\"$job\"}, instance)",
    "refId": "VictoriaMetrics-instance-Variable-Query"
    },
    "refresh": 1,
    "regex": "",
    "skipUrlSync": false,
    "sort": 0,
    "type": "query"
    },
    {
    "datasource": {
    "type": "prometheus",
    "uid": "$ds"
    },
    "filters": [],
    "hide": 0,
    "name": "adhoc",
    "skipUrlSync": false,
    "type": "adhoc"
    }
    ]
    },
    "time": {
    "from": "now-3h",
    "to": "now"
    },
    "timepicker": {
    "refresh_intervals": [
    "10s",
    "30s",
    "1m",
    "5m",
    "15m",
    "30m",
    "1h",
    "2h",
    "1d"
    ]
    },
    "timezone": "",
    "title": "VictoriaMetrics - cluster",
    "uid": "oS7Bi_0Wz",
    "version": 1,
    "weekStart": "",
    "gnetId": 11176
    }