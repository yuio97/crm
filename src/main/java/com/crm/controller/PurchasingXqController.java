package com.crm.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crm.bean.PurchasingXq;
import com.crm.service.PurchasingXqService;

@Controller
@RequestMapping("/purchasingXq")
public class PurchasingXqController {
	@Resource
	private PurchasingXqService purchasingXqService;  
	
	@RequestMapping("/purchasingXqlist")
	@ResponseBody
	public List<PurchasingXq> getpurchasingXqList(){
		List<PurchasingXq> purchasingXqList = purchasingXqService.getPurchasingXqList();
		return purchasingXqList;
		
	}
	
	@RequestMapping("/Xqlist")
	@ResponseBody
	public List<PurchasingXq> getpurchasingXqList1(Integer porderId ){
		List<PurchasingXq> purchasingXqList1 = purchasingXqService.getPurchasingXqList1(porderId);
		System.out.println(purchasingXqList1);
		return purchasingXqList1;
		
		
		
	}
	
	
	
	
	
	

}
