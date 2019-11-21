package com.crm.controller;

import java.lang.ProcessBuilder.Redirect;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crm.bean.Customer;
import com.crm.bean.Procurement;
import com.crm.service.OrderService;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	@Resource
	private OrderService orderService;
	
	@RequestMapping("/getOrderList")
	@ResponseBody
	public List<Procurement> getOrderList(Integer clientId)
	{
		
		 List<Procurement> selectData = orderService.selectData(clientId);
		
		
		return selectData;
	}
	
	
	@RequestMapping("/getOrderOne")
	public String getDeta(Integer id)
	{
		Procurement selectData = orderService.getProcurementById(id);
		
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		
		 hashMap.put("data", selectData);
		 
		 
		 return "forward:/dateils_lwh.jsp";
	}
	
	
}
