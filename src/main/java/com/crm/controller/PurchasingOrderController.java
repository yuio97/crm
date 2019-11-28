package com.crm.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crm.bean.PurchasingOrder;
import com.crm.bean.PurchasingXq;
import com.crm.service.PurchasingOrderService;
import com.crm.service.PurchasingXqService;

@Controller
@RequestMapping("/purchasingOrder")
public class PurchasingOrderController {
	@Resource
	private PurchasingOrderService purchasingOrderSerice;
	
	@Resource
	private PurchasingXqService purchasingXqService; 
	
	@RequestMapping("getpurchasingOrderList")
	@ResponseBody
	public HashMap<String, Object> getPurchasingOrderList(){
		List<PurchasingOrder> purchasingOrderList = purchasingOrderSerice.getPurchasingOrderList();
		HashMap<String, Object> hashMap = new HashMap<>();
		hashMap.put("purchasingOrderList", purchasingOrderList);
		return hashMap;
		
	}
	@RequestMapping("/addpo")
	public String insert(@RequestBody PurchasingOrder record){
		System.out.println(record);
		 purchasingOrderSerice.insertSelective(record);
		return "redirect:/caigou_add.jsp";
		
	}
	
	@RequestMapping("/getporderId")
	public String selectByPrimaryKey(Integer porderId,Map<String,Object> data){
		PurchasingOrder porder = purchasingOrderSerice.selectByPrimaryKey(porderId);
		List<PurchasingXq> update = purchasingXqService.update(porderId);
	    data.put("update", update);
		return "forward:/caigou_update.jsp";
		
	}
	
	
	@RequestMapping("/getporderId1")
	public String selectByPrimaryKey1(Integer porderId,Map<String,Object> data){
		PurchasingOrder porder = purchasingOrderSerice.selectByPrimaryKey(porderId);
		List<PurchasingXq> purchasingXqList1 = purchasingXqService.getPurchasingXqList1(porderId);
		data.put("purchasingXqList1", purchasingXqList1);
		return "forward:/caigou_xq.jsp";
		
	}
	
	
	
	 
}
