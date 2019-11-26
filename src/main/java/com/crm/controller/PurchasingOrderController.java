package com.crm.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	@RequestMapping("/addpo")
	public String insert(PurchasingOrder record){
		 purchasingOrderSerice.insertSelective(record);
		return "redirect:/caigou_add.jsp";
		
	}
	
	@RequestMapping("/getporderId")
	public String selectByPrimaryKey(Integer porderId,Map<String,Object> data){
		PurchasingOrder porder = purchasingOrderSerice.selectByPrimaryKey(porderId);
	    data.put("porder", porder);
		return "forward:/caigou_update.jsp";
		
	}
	
	
	
	 
}
