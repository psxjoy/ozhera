/*
 * Copyright (C) 2020 Xiaomi Corporation
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 */

package run.mone.hera.operator.service;

import run.mone.hera.operator.bo.HeraStatus;
import run.mone.hera.operator.dto.DeployStateDTO;
import run.mone.hera.operator.dto.HeraOperatorDefineDTO;
import run.mone.hera.operator.dto.PodStateDTO;

import java.io.File;
import java.util.List;
import java.util.Map;

/**
 * Initialize the mone family bucket namespace.
 *
 * @author shanwb
 * @date 2022-06-17
 */

public interface HeraBootstrapInitService {
    
    void init();
    
    HeraOperatorDefineDTO getResource();
    
    HeraOperatorDefineDTO updateResource(HeraOperatorDefineDTO heraOperatorDefine);
    
    List<DeployStateDTO> crState();
    
    List<PodStateDTO> crState1();
    
    boolean crExists(String namespace);
    
    HeraStatus createOrReplaceCr();
    
    Boolean deleteCr();
    
    void deleteService(List<String> serviceNameList, String namespace, String serviceType);
    
    List<io.fabric8.kubernetes.api.model.Service> createAndListService(List<String> serviceNameList, String namespace,
            String yamlPath, String serviceType) throws InterruptedException;
    
    boolean checkLbServiceFailed(List<io.fabric8.kubernetes.api.model.Service> serviceList, String serviceType);
    
    Map<String, String> getServiceIpPort(List<io.fabric8.kubernetes.api.model.Service> serviceList, String serviceType);
    
    String getServiceType(List<io.fabric8.kubernetes.api.model.Service> serviceList);
    
    void executeSqlScript(File[] sqlFiles, String url, String userName, String pwd);
}