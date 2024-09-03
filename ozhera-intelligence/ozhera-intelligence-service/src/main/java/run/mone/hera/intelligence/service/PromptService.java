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

package run.mone.hera.intelligence.service;

import run.mone.hera.intelligence.domain.rootanalysis.LogPromptResult;
import run.mone.hera.intelligence.domain.rootanalysis.MetricsPromptResult;
import run.mone.hera.intelligence.domain.rootanalysis.TracePromptResult;

public interface PromptService {
    
    /**
     * Conduct large model analysis based on trace data
     *
     * @param trace
     * @return
     */
    public TracePromptResult traceAnalysis(String trace);
    
    /**
     * Conduct large model analysis based on log data
     *
     * @param log
     * @return
     */
    public LogPromptResult logAnalysis(String log);
    
    /**
     * Conduct large model analysis based on metrics data
     *
     * @param metrics
     * @return
     */
    public MetricsPromptResult metricsAnalysis(String metrics);
    
    /**
     * Summarize a clear and concise root cause based on the analysis results from trace, log, and metrics.
     *
     * @param traceReason
     * @param logReason
     * @param metricsReason
     * @return
     */
    public String getSimpleReason(String traceReason, String logReason, String metricsReason);
}
