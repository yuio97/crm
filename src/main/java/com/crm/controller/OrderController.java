package com.crm.controller;

import java.lang.ProcessBuilder.Redirect;
import java.util.List;

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
	
	
}
