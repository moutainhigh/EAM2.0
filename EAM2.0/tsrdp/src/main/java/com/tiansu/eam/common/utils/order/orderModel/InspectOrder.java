package com.tiansu.eam.common.utils.order.orderModel;

import com.tiansu.eam.common.utils.order.enums.DispatchTypeEnum;
import com.tiansu.eam.common.utils.order.enums.OrderTypeEnum;

/**
 * @author wangjl
 * @description 巡检工单
 * @create 2017-09-05 11:06
 **/
public class InspectOrder  {

//    @Override
    public OrderTypeEnum getOrderType() {
        return OrderTypeEnum.INSPECT_ORDER;
    }

//    @Override
    public DispatchTypeEnum getCurrentDispType() throws RuntimeException {
        return null;
    }

//    @Override
    public DispatchTypeEnum[] getAllDispTypes() {
        return new DispatchTypeEnum[0];
    }


}
