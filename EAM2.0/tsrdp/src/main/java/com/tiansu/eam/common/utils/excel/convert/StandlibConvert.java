package com.tiansu.eam.common.utils.excel.convert;

import com.thinkgem.jeesite.common.utils.SpringContextHolder;
import com.tiansu.eam.common.utils.excel.dao.ConvertDataDao;
import com.tiansu.eam.common.utils.excel.service.ConvertDataService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author zhangdf
 * @description
 * @create 2017-09-07 18:56
 **/
public class StandlibConvert implements IConvertClass{
    private volatile Map<String, Object> convertMap = null;

    private ConvertDataDao convertDataService= SpringContextHolder.getBean(ConvertDataService.class);
    @Override
    public Map<String, Object> getConvertDataMap() throws Exception {
        if(convertMap != null){
            return convertMap;
        }
        convertMap = new HashMap<String, Object>();

        Map<String, Object> dev_param=new HashMap<String, Object>();//入参对象
        dev_param.put("tabname", "eam_operation_library");//根据code查出ID
        dev_param.put("id", "id");
        dev_param.put("name", "library_code");

        List<Map<String, Object>> row_datas=convertDataService.getConvertData(dev_param);

        for(Map<String,Object> object : row_datas){

            convertMap.put(object.get("id").toString(), object.get("name"));

        }

        return convertMap;
    }

    @Override
    public void dispose() {

    }
}
