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
"expr": "sum(vm_app_version{job=~\"$job\", instance=~\"$instance\"}) by(short_version) unless (sum(vm_app_version{job=~\"$job\", instance=~\"$instance\"} offset 20m) by(short_version))",
"hide": true,
"iconColor": "dark-blue",
"name": "version",
"textFormat": "{{short_version}}",
"titleFormat": "Version change"
},
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"enable": true,
"expr": "sum(changes(vm_app_start_timestamp{job=~\"$job\", instance=~\"$instance\"})) by(job, instance)",
"hide": true,
"iconColor": "dark-yellow",
"name": "restarts",
"textFormat": "{{job}}:{{instance}} restarted"
}
]
},
"description": "Overview for VictoriaMetrics vmalert v1.96.0 or higher",
"editable": true,
"fiscalYearStartMonth": 0,
"graphTooltip": 1,
"id": null,
"links": [
{
"asDropdown": false,
"icon": "external link",
"includeVars": false,
"keepTime": false,
"tags": [],
"targetBlank": true,
"title": "vmalert docs",
"tooltip": "",
"type": "link",
"url": "https://docs.victoriametrics.com/vmalert.html"
},
{
"asDropdown": false,
"icon": "external link",
"includeVars": false,
"keepTime": false,
"tags": [],
"targetBlank": true,
"title": "Found a bug?",
"tooltip": "",
"type": "link",
"url": " https://github.com/VictoriaMetrics/VictoriaMetrics/issues"
},
{
"asDropdown": false,
"icon": "external link",
"includeVars": false,
"keepTime": false,
"tags": [],
"targetBlank": true,
"title": "New releases",
"tooltip": "",
"type": "link",
"url": " https://github.com/VictoriaMetrics/VictoriaMetrics/releases"
}
],
"liveNow": false,
"panels": [
{
"collapsed": false,
"gridPos": {
"h": 1,
"w": 24,
"x": 0,
"y": 0
},
"id": 47,
"panels": [],
"title": "Stats",
"type": "row"
},
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"description": "Shows if the last configuration update was successful. \"Not Ok\" means there was an unsuccessful attempt to update the configuration due to some error. Check the log for details.",
"fieldConfig": {
"defaults": {
"mappings": [
{
"options": {
"0": {
"color": "green",
"index": 0,
"text": "Ok"
}
},
"type": "value"
},
{
"options": {
"from": 1,
"result": {
"color": "red",
"index": 1,
"text": "Not Ok"
},
"to": 999999
},
"type": "range"
}
],
"thresholds": {
"mode": "absolute",
"steps": [
{
"color": "green",
"value": null
}
]
},
"unitScale": true
},
"overrides": []
},
"gridPos": {
"h": 3,
"w": 4,
"x": 0,
"y": 1
},
"id": 6,
"options": {
"colorMode": "value",
"graphMode": "area",
"justifyMode": "auto",
"orientation": "auto",
"reduceOptions": {
"calcs": [
"last"
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
"expr": "count(vmalert_config_last_reload_successful{job=~\"$job\", instance=~\"$instance\"} < 1 ) or 0",
"interval": "",
"legendFormat": "",
"refId": "A"
}
],
"title": "Config update",
"type": "stat"
},
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"description": "Shows the total number of loaded alerting rules across selected instances and groups.",
"fieldConfig": {
"defaults": {
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
"unitScale": true
},
"overrides": []
},
"gridPos": {
"h": 3,
"w": 5,
"x": 4,
"y": 1
},
"id": 9,
"options": {
"colorMode": "value",
"graphMode": "area",
"justifyMode": "auto",
"orientation": "auto",
"reduceOptions": {
"calcs": [
"last"
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
"expr": "count(vmalert_alerting_rules_last_evaluation_samples{job=~\"$job\", instance=~\"$instance\", group=~\"$group\"})",
"interval": "",
"legendFormat": "",
"refId": "A"
}
],
"title": "Alerting rules",
"type": "stat"
},
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"description": "Shows the total number of loaded recording rules across selected instances and groups.",
"fieldConfig": {
"defaults": {
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
"unitScale": true
},
"overrides": []
},
"gridPos": {
"h": 3,
"w": 5,
"x": 9,
"y": 1
},
"id": 7,
"options": {
"colorMode": "value",
"graphMode": "area",
"justifyMode": "auto",
"orientation": "auto",
"reduceOptions": {
"calcs": [
"last"
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
"expr": "count(vmalert_recording_rules_last_evaluation_samples{job=~\"$job\", instance=~\"$instance\", group=~\"$group\"})",
"interval": "",
"legendFormat": "",
"refId": "A"
}
],
"title": "Recording rules",
"type": "stat"
},
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"description": "Shows the total number of errors generated by recording/alerting rules for selected instances and groups.",
"fieldConfig": {
"defaults": {
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
"value": 1
}
]
},
"unitScale": true
},
"overrides": []
},
"gridPos": {
"h": 3,
"w": 5,
"x": 14,
"y": 1
},
"id": 8,
"options": {
"colorMode": "value",
"graphMode": "area",
"justifyMode": "auto",
"orientation": "auto",
"reduceOptions": {
"calcs": [
"last"
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
"expr": "(sum(increase(vmalert_alerting_rules_errors_total{job=~\"$job\", instance=~\"$instance\", group=~\"$group\"}[$__rate_interval])) or vector(0)) + \n(sum(increase(vmalert_recording_rules_errors_total{job=~\"$job\", instance=~\"$instance\", group=~\"$group\"}[$__rate_interval])) or vector(0))",
"interval": "",
"legendFormat": "",
"refId": "A"
}
],
"title": "Errors",
"type": "stat"
},
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"description": "Shows number of Recording Rules which produce no data.\n\n Usually it means that such rules are misconfigured, since they give no output during the evaluation.\nPlease check if rule's expression is correct and it is working as expected.",
"fieldConfig": {
"defaults": {
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
"value": 1
}
]
},
"unitScale": true
},
"overrides": []
},
"gridPos": {
"h": 3,
"w": 5,
"x": 19,
"y": 1
},
"id": 48,
"options": {
"colorMode": "value",
"graphMode": "area",
"justifyMode": "auto",
"orientation": "auto",
"reduceOptions": {
"calcs": [
"last"
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
"expr": "count(vmalert_recording_rules_last_evaluation_samples{job=~\"$job\", instance=~\"$instance\"} < 1) or 0",
"interval": "",
"legendFormat": "",
"range": true,
"refId": "A"
}
],
"title": "No data errors",
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
"h": 4,
"w": 9,
"x": 0,
"y": 4
},
"id": 45,
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
"showHeader": true
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
"h": 4,
"w": 15,
"x": 9,
"y": 4
},
"id": 4,
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
"sort": "asc"
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
"exemplar": false,
"expr": "sum(min_over_time(up{job=~\"$job\", instance=~\"$instance\"}[$__rate_interval])) by (job)",
"format": "time_series",
"instant": false,
"interval": "",
"legendFormat": "{{job}}",
"refId": "A"
}
],
"title": "Uptime",
"type": "timeseries"
},
{
"collapsed": false,
"datasource": {
"type": "datasource",
"uid": "grafana"
},
"gridPos": {
"h": 1,
"w": 24,
"x": 0,
"y": 8
},
"id": 11,
"panels": [],
"targets": [
{
"datasource": {
"type": "datasource",
"uid": "grafana"
},
"refId": "A"
}
],
"title": "Overview ($instance)",
"type": "row"
},
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"description": "Shows the number of fired alerts by job.",
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
"x": 0,
"y": 9
},
"id": 15,
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
"pluginVersion": "9.2.6",
"targets": [
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"editorMode": "code",
"exemplar": false,
"expr": "sum(increase(vmalert_alerts_fired_total{job=~\"$job\", instance=~\"$instance\"}[$__rate_interval])) by(job)",
"interval": "",
"legendFormat": "{{job}}",
"range": true,
"refId": "A"
}
],
"title": "Alerts fired total ($instance)",
"type": "timeseries"
},
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"description": "Top $topk groups by evaluation duration. Shows groups that take the most of time during the evaluation across all instances.\n\nThe panel uses MetricsQL functions and may not work with Prometheus.",
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
"unit": "s",
"unitScale": true
},
"overrides": []
},
"gridPos": {
"h": 8,
"w": 12,
"x": 12,
"y": 9
},
"id": 23,
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
"pluginVersion": "9.2.6",
"targets": [
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"editorMode": "code",
"exemplar": false,
"expr": "topk_max($topk, max(sum(\n    rate(vmalert_iteration_duration_seconds_sum{job=~\"$job\", instance=~\"$instance\", group=~\"$group\"}[$__rate_interval])\n/\n    rate(vmalert_iteration_duration_seconds_count{job=~\"$job\", instance=~\"$instance\", group=~\"$group\"}[$__rate_interval])\n) by(job, instance, group)) \nby(job, group))",
"interval": "",
"legendFormat": "{{group}} ({{job}})",
"range": true,
"refId": "A"
}
],
"title": "Top $topk groups avg evaluation duration ($group)",
"type": "timeseries"
},
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"description": "Shows how many requests (executions) per second vmalert sends to the configured datasource.",
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
"x": 0,
"y": 17
},
"id": 24,
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
"exemplar": false,
"expr": "sum(rate(vmalert_execution_total{job=~\"$job\", instance=~\"$instance\"}[$__rate_interval])) by (job)",
"interval": "",
"legendFormat": "{{job}}",
"range": true,
"refId": "A"
}
],
"title": "Rules execution rate ($instance)",
"type": "timeseries"
},
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"description": "Shows the error rate while executing configured rules. Non-zero value means there are some issues with existing rules. Check the logs to get more details.",
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
"y": 17
},
"id": 25,
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
"pluginVersion": "9.2.6",
"targets": [
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"editorMode": "code",
"exemplar": false,
"expr": "sum(rate(vmalert_execution_errors_total{job=~\"$job\", instance=~\"$instance\"}[$__rate_interval])) by(job) > 0",
"interval": "",
"legendFormat": "__auto",
"range": true,
"refId": "A"
}
],
"title": "Rules execution errors ($instance)",
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
"h": 7,
"w": 12,
"x": 0,
"y": 25
},
"id": 50,
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
"description": "Missed evaluation means that group evaluation time takes longer than the configured evaluation interval. \nThis may result in missed alerting notifications or recording rules samples. Try increasing evaluation interval or concurrency for such groups. See https://docs.victoriametrics.com/vmalert.html#groups\n\nIf rule expressions are taking longer than expected, please see https://docs.victoriametrics.com/Troubleshooting.html#slow-queries.\"",
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
"h": 7,
"w": 12,
"x": 12,
"y": 25
},
"id": 58,
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
"pluginVersion": "9.2.6",
"targets": [
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"editorMode": "code",
"exemplar": false,
"expr": "sum(increase(vmalert_iteration_missed_total{job=~\"$job\", instance=~\"$instance\"}[$__rate_interval])) by(job, group) > 0",
"interval": "1m",
"legendFormat": "__auto",
"range": true,
"refId": "A"
}
],
"title": "Missed evaluations ($instance)",
"type": "timeseries"
},
{
"collapsed": true,
"datasource": {
"type": "datasource",
"uid": "grafana"
},
"gridPos": {
"h": 1,
"w": 24,
"x": 0,
"y": 32
},
"id": 43,
"panels": [
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"description": "The precentage of used RSS memory\n\nIf you think that usage is abnormal or unexpected, please file an issue and attach memory profile if possible.",
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
"id": 37,
"links": [
{
"targetBlank": true,
"title": "Profiling",
"url": "https://docs.victoriametrics.com/vmagent.html#profiling"
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
"exemplar": false,
"expr": "max(\n    max_over_time(process_resident_memory_bytes{job=~\"$job\", instance=~\"$instance\"}[$__rate_interval])\n    /\n    vm_available_memory_bytes{job=~\"$job\", instance=~\"$instance\"}\n) by(job)",
"interval": "",
"legendFormat": "__auto",
"range": true,
"refId": "A"
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
"description": "Amount of used RSS memory\n\nIf you think that usage is abnormal or unexpected, please file an issue and attach memory profile if possible.",
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
"unit": "bytes",
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
"id": 57,
"links": [
{
"targetBlank": true,
"title": "Profiling",
"url": "https://docs.victoriametrics.com/vmagent.html#profiling"
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
"exemplar": false,
"expr": "max(\n    max_over_time(process_resident_memory_bytes{job=~\"$job\", instance=~\"$instance\"}[$__rate_interval])\n) by(job)",
"interval": "",
"legendFormat": "{{job}}",
"range": true,
"refId": "A"
}
],
"title": "Memory usage ($instance)",
"type": "timeseries"
},
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"description": "Shows the CPU usage percentage per vmalert instance. \nIf you think that usage is abnormal or unexpected pls file an issue and attach CPU profile if possible.",
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
"id": 35,
"links": [
{
"targetBlank": true,
"title": "Profiling",
"url": "https://docs.victoriametrics.com/vmagent.html#profiling"
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
"exemplar": false,
"expr": "max(\n  rate(process_cpu_seconds_total{job=~\"$job\", instance=~\"$instance\"}[$__rate_interval]) \n  / \n  vm_available_cpu_cores{job=~\"$job\", instance=~\"$instance\"}\n) by(job)",
"format": "time_series",
"interval": "",
"intervalFactor": 1,
"legendFormat": "{{job}}",
"range": true,
"refId": "A"
}
],
"title": "CPU usage %($instance)",
"type": "timeseries"
},
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"description": "Shows the max number of CPU cores used  by a `job` and the corresponding limit.",
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
"y": 11
},
"id": 56,
"links": [
{
"targetBlank": true,
"title": "Profiling",
"url": "https://docs.victoriametrics.com/vmagent.html#profiling"
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
"exemplar": false,
"expr": "max(rate(process_cpu_seconds_total{job=~\"$job\", instance=~\"$instance\"}[$__rate_interval])) by(job)",
"format": "time_series",
"interval": "",
"intervalFactor": 1,
"legendFormat": "{{job}}",
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
"expr": "min(process_cpu_cores_available{job=~\"$job\", instance=~\"$instance\"}) by(job)",
"format": "time_series",
"hide": false,
"interval": "",
"intervalFactor": 1,
"legendFormat": "limit ({{job}})",
"range": true,
"refId": "B"
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
"description": "Panel shows the percentage of open file descriptors in the OS.\nReaching the limit of open files can cause various issues and must be prevented.\n\nSee how to change limits here https://medium.com/@muhammadtriwibowo/set-permanently-ulimit-n-open-files-in-ubuntu-4d61064429a",
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
"decimals": 3,
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
"y": 19
},
"id": 39,
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
"exemplar": false,
"expr": "max(\n    max_over_time(process_open_fds{job=~\"$job\", instance=~\"$instance\"}[$__rate_interval])\n    /\n    process_max_fds{job=~\"$job\", instance=~\"$instance\"}\n) by(job)",
"format": "time_series",
"interval": "",
"intervalFactor": 2,
"legendFormat": "__auto",
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
"x": 12,
"y": 19
},
"id": 41,
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
"pluginVersion": "9.2.6",
"targets": [
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"editorMode": "code",
"expr": "sum(go_goroutines{job=~\"$job\", instance=~\"$instance\"}) by(job)",
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
"y": 27
},
"id": 59,
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
"targets": [
{
"datasource": {
"type": "datasource",
"uid": "grafana"
},
"refId": "A"
}
],
"title": "Resource usage",
"type": "row"
},
{
"collapsed": true,
"datasource": {
"type": "datasource",
"uid": "grafana"
},
"gridPos": {
"h": 1,
"w": 24,
"x": 0,
"y": 33
},
"id": 17,
"panels": [
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"description": "Shows top $topk current active (firing) alerting rules.\n\nThe panel uses MetricsQL functions and may not work with Prometheus.",
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
"y": 36
},
"id": 14,
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
"pluginVersion": "9.2.6",
"targets": [
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"editorMode": "code",
"exemplar": false,
"expr": "topk_max($topk, sum(vmalert_alerts_firing{job=~\"$job\", instance=~\"$instance\", group=~\"$group\"}) by(job, group, alertname) > 0)",
"interval": "",
"legendFormat": "{{group}}.{{alertname}} ({{job}})",
"range": true,
"refId": "A"
}
],
"title": "Top $topk active alerts ($group)",
"type": "timeseries"
},
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"description": "Shows the events when rule execution resulted into an error. Check the logs for more details.",
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
"x": 12,
"y": 36
},
"id": 13,
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
"pluginVersion": "9.2.6",
"targets": [
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"editorMode": "code",
"exemplar": false,
"expr": "sum(increase(vmalert_alerting_rules_errors_total{job=~\"$job\", instance=~\"$instance\", group=~\"$group\"}[$__rate_interval])) by(job, group, alertname) > 0",
"interval": "",
"legendFormat": "{{group}}.{{alertname}} ({{job}})",
"range": true,
"refId": "A"
}
],
"title": "Errors ($group)",
"type": "timeseries"
},
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"description": "Shows the current pending alerting rules per group.\nBy pending means the rule which remains active less than configured `for` parameter.",
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
"y": 44
},
"id": 20,
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
"sortBy": "Mean",
"sortDesc": true
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
"exemplar": false,
"expr": "sum(vmalert_alerts_pending{job=~\"$job\", instance=~\"$instance\", group=~\"$group\"}) by(job, group, alertname) > 0",
"interval": "",
"legendFormat": "{{group}}.{{alertname}} ({{job}})",
"range": true,
"refId": "A"
}
],
"title": "Pending ($group)",
"type": "timeseries"
},
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"description": "Shows the error rate for the attempts to send alerts to Alertmanager. If not zero it means there issues on attempt to send notification to Alertmanager and some alerts may be not delivered properly. Check the logs for more details.",
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
"y": 44
},
"id": 32,
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
"exemplar": false,
"expr": "sum(rate(vmalert_alerts_send_errors_total{job=~\"$job\", instance=~\"$instance\"}[$__rate_interval])) by(instance, addr) > 0",
"interval": "",
"legendFormat": "{{instance}} => {{addr}}",
"refId": "A"
}
],
"title": "Errors rate to Alertmanager",
"type": "timeseries"
},
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"description": "Shows how many alerts are sent to Alertmanager per second. Only active alerts are sent.",
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
"y": 52
},
"id": 26,
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
"exemplar": false,
"expr": "sum(rate(vmalert_alerts_sent_total{job=~\"$job\", instance=~\"$instance\"}[$__rate_interval])) by(job, addr) > 0",
"interval": "",
"legendFormat": "{{job}} => {{addr}}",
"range": true,
"refId": "A"
}
],
"title": "Requests rate to Alertmanager by job ($group)",
"type": "timeseries"
}
],
"targets": [
{
"datasource": {
"type": "datasource",
"uid": "grafana"
},
"refId": "A"
}
],
"title": "Alerting rules ($instance)",
"type": "row"
},
{
"collapsed": true,
"datasource": {
"type": "datasource",
"uid": "grafana"
},
"gridPos": {
"h": 1,
"w": 24,
"x": 0,
"y": 34
},
"id": 28,
"panels": [
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"description": "Shows the top $topk recording rules which generate the most of samples. Each generated sample is basically a time series which then ingested into configured remote storage. Rules with high numbers may cause the most pressure on the remote database and become a source of too high cardinality.\n\nThe panel uses MetricsQL functions and may not work with Prometheus.",
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
"y": 51
},
"id": 31,
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
"pluginVersion": "9.2.6",
"targets": [
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"editorMode": "code",
"exemplar": false,
"expr": "topk_max($topk, \n  max(\n    sum(vmalert_recording_rules_last_evaluation_samples{job=~\"$job\", instance=~\"$instance\", group=~\"$group\"}) by(job, instance, group, recording) > 0\n  ) by(job, group, recording)\n)",
"interval": "",
"legendFormat": "{{group}}.{{recording}} ({{job}})",
"range": true,
"refId": "A"
}
],
"title": "Top $topk rules by produced samples ($group)",
"type": "timeseries"
},
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"description": "Shows the rules which do not produce any samples during the evaluation. Usually it means that such rules are misconfigured, since they give no output during the evaluation.\nPlease check if rule's expression is correct and it is working as expected.",
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
"spanNulls": true,
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
"x": 12,
"y": 51
},
"id": 33,
"options": {
"legend": {
"calcs": [
"lastNotNull",
"max",
"mean"
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
"pluginVersion": "8.0.3",
"targets": [
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"editorMode": "code",
"exemplar": false,
"expr": "count(vmalert_recording_rules_last_evaluation_samples{job=~\"$job\", instance=~\"$instance\", group=~\"$group\"} < 1) by(job, group, recording)",
"interval": "",
"legendFormat": "{{group}}.{{recording}} ({{job}})",
"range": true,
"refId": "A"
}
],
"title": "Rules with 0 produced samples ($group)",
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
"y": 59
},
"id": 30,
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
"pluginVersion": "9.2.6",
"targets": [
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"editorMode": "code",
"exemplar": false,
"expr": "sum(increase(vmalert_recording_rules_errors_total{job=~\"$job\", instance=~\"$instance\", group=~\"$group\"}[$__rate_interval])) by(job, group, recording) > 0",
"interval": "",
"legendFormat": "{{group}}.{{recording}} ({{job}})",
"range": true,
"refId": "A"
}
],
"title": "Errors ($group)",
"type": "timeseries"
}
],
"targets": [
{
"datasource": {
"type": "datasource",
"uid": "grafana"
},
"refId": "A"
}
],
"title": "Recording rules ($instance)",
"type": "row"
},
{
"collapsed": true,
"gridPos": {
"h": 1,
"w": 24,
"x": 0,
"y": 35
},
"id": 55,
"panels": [
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
"showPoints": "auto",
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
}
},
"overrides": []
},
"gridPos": {
"h": 8,
"w": 12,
"x": 0,
"y": 17
},
"id": 52,
"options": {
"legend": {
"calcs": [],
"displayMode": "list",
"placement": "bottom",
"showLegend": true
},
"tooltip": {
"mode": "single",
"sort": "desc"
}
},
"targets": [
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"editorMode": "code",
"expr": "sum(rate(vmalert_remotewrite_sent_rows_total{job=~\"$job\", instance=~\"$instance\"}[$__rate_interval])) by(job)",
"legendFormat": "__auto",
"range": true,
"refId": "A"
}
],
"title": "Datapoints send rate ($instance)",
"type": "timeseries"
},
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"description": "Shows the number of datapoints dropped by vmalert while sending to the configured remote write URL. vmalert performs up to 5 retries before dropping the data. Check vmalert's error logs for the specific error message.",
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
"showPoints": "auto",
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
}
},
"overrides": []
},
"gridPos": {
"h": 8,
"w": 12,
"x": 12,
"y": 17
},
"id": 53,
"options": {
"legend": {
"calcs": [],
"displayMode": "list",
"placement": "bottom",
"showLegend": true
},
"tooltip": {
"mode": "single",
"sort": "desc"
}
},
"targets": [
{
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"editorMode": "code",
"expr": "sum(rate(vmalert_remotewrite_dropped_rows_total{job=~\"$job\", instance=~\"$instance\"}[$__rate_interval])) by(job) > 0",
"legendFormat": "__auto",
"range": true,
"refId": "A"
}
],
"title": "Datapoints drop rate ($instance)",
"type": "timeseries"
}
],
"title": "Remote write",
"type": "row"
}
],
"refresh": "",
"schemaVersion": 39,
"tags": [
"victoriametrics",
"vmalert"
],
"templating": {
"list": [
{
"current": {
"selected": true,
"text": "VictoriaMetrics",
"value": "P4169E866C3094E38"
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
"definition": "label_values(vm_app_version{version=~\"^vmalert.*\"}, job)",
"hide": 0,
"includeAll": true,
"multi": true,
"name": "job",
"options": [],
"query": {
"query": "label_values(vm_app_version{version=~\"^vmalert.*\"}, job)",
"refId": "StandardVariableQuery"
},
"refresh": 1,
"regex": "",
"skipUrlSync": false,
"sort": 0,
"type": "query"
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
"refId": "StandardVariableQuery"
},
"refresh": 1,
"regex": "",
"skipUrlSync": false,
"sort": 0,
"type": "query"
},
{
"allValue": ".*",
"current": {},
"datasource": {
"type": "prometheus",
"uid": "$ds"
},
"definition": "label_values(vmalert_iteration_duration_seconds{job=~\"$job\", instance=~\"$instance\"}, group)",
"hide": 0,
"includeAll": true,
"multi": true,
"name": "group",
"options": [],
"query": {
"query": "label_values(vmalert_iteration_duration_seconds{job=~\"$job\", instance=~\"$instance\"}, group)",
"refId": "StandardVariableQuery"
},
"refresh": 1,
"regex": "",
"skipUrlSync": false,
"sort": 0,
"type": "query"
},
{
"current": {
"selected": false,
"text": "5",
"value": "5"
},
"hide": 0,
"includeAll": false,
"multi": false,
"name": "topk",
"options": [
{
"selected": true,
"text": "5",
"value": "5"
},
{
"selected": false,
"text": "10",
"value": "10"
},
{
"selected": false,
"text": "20",
"value": "20"
},
{
"selected": false,
"text": "30",
"value": "30"
},
{
"selected": false,
"text": "40",
"value": "40"
},
{
"selected": false,
"text": "50",
"value": "50"
}
],
"query": "5, 10, 20, 30, 40, 50",
"queryValue": "",
"skipUrlSync": false,
"type": "custom"
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
"timepicker": {},
"timezone": "",
"title": "VictoriaMetrics - vmalert",
"uid": "LzldHAVnz",
"version": 1,
"weekStart": "",
"gnetId": 14950
}