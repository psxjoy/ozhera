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

/**
 *
 * @author zhanggaofeng1
 */
@Data
public class UserInfo {

    private String user;//用户账号
    private String name;//名称
    private String displayName;//展示名称
    private String departmentName;//部门
    private String firstDepartment;//一级部门（用于区分用户空间）
    private String secondDepartment;//二级部门（用于区分用户空间）
    private String email;//邮箱
    private String miID;//米id
    private String avatar;//头像图片
    private Boolean isAdmin;
    
}