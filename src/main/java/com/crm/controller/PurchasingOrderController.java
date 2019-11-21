package com.crm.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crm.bean.PurchasingOrder;
import com.crm.service.PurchasingOrderService;

@Controller
@RequestMapping("/purchasingOrder")
public class PurchasingOrderController {
	@Resource
	private PurchasingOrderService purchasingOrderSerice;
	
	@RequestMapping("getpurchasingOrderList")
	@ResponseBody
	public HashMap<String, Object> getPurchasingOrderList(){
		List<PurchasingOrder> purchasingOrderList = purchasingOrderSerice.getPurchasingOrderList();
		HashMap<String, Object> hashMap = new HashMap<>();
		hashMap.put("purchasingOrderList", purchasingOrderList);
		return hashMap;
		
	}
}
