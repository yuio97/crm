package com.crm.controller;

import java.lang.ProcessBuilder.Redirect;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.crm.service.OrderService;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	@Resource
	private OrderService orderService;
	
	public String getOrderList(Integer clientId)
	{
		orderService.selectData(clientId);
		
		Redirect:
		return null;
	}
	
	
}
