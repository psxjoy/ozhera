/*
 *  Copyright (C) 2020 Xiaomi Corporation
 *
 *    Licensed under the Apache License, Version 2.0 (the "License");
 *    you may not use this file except in compliance with the License.
 *    You may obtain a copy of the License at
 *
 *        http://www.apache.org/licenses/LICENSE-2.0
 *
 *    Unless required by applicable law or agreed to in writing, software
 *    distributed under the License is distributed on an "AS IS" BASIS,
 *    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *    See the License for the specific language governing permissions and
 *    limitations under the License.
 */
package org.apache.ozhera.monitor.service.model;

import lombok.Data;

import java.io.Serializable;

/**
 * @author gaoxihui
 * @date 2021/7/10 12:48 PM
 */
@Data
public class GrafanaResponse implements Serializable {
    Integer id;
    Integer version;
    String slug;
    String status;
    String uid;
    String url;
    String mimonitor_version;

//    {"id":4,"slug":"ye-wu-jian-kong-zzytest","status":"success","uid":"mione","url":"/d/mione/ye-wu-jian-kong-zzytest","version":5}
}