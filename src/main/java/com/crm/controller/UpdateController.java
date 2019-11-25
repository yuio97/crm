package com.crm.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.crm.bean.PurchasingOrder;
import com.crm.service.PurchasingOrderService;

@Controller
@RequestMapping("/update")
public class UpdateController {
	@Resource
	private PurchasingOrderService purchasingOrderSerice; 
	
	@RequestMapping("/updatePurchasingOrder")
	public String updateById(PurchasingOrder porderId){
		int updateByPrimaryKeySelective = purchasingOrderSerice.updateByPrimaryKeySelective(porderId);
		return null;
		
	}

}
