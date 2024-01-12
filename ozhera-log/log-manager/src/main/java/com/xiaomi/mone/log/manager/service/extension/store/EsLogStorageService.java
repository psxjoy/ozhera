package com.xiaomi.mone.log.manager.service.extension.store;

import com.xiaomi.mone.log.manager.model.dto.LogStorageData;

import java.util.ArrayList;
import java.util.List;

/**
 * @author wtt
 * @version 1.0
 * @description
 * @date 2023/11/10 14:28
 */
public class EsLogStorageService implements LogStorageService {

    @Override
    public boolean createTable(LogStorageData logStorageData) {
        return false;
    }

    @Override
    public boolean updateTable(LogStorageData logStorageData) {
        return false;
    }

    @Override
    public boolean deleteTable(LogStorageData logStorageData) {
        return false;
    }

    @Override
    public List<String> getColumnList(Long clusterId, String tableName) {
        return new ArrayList<>();
    }
}
