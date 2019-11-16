package com.crm.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.crm.bean.Customer;
import com.crm.service.CustomSelectService;

@Controller
public class CustomSelectController {

	@Resource
	CustomSelectService customSelectService;

	@RequestMapping("/selectcus")
	public String select(Map<String, Object> data) {
		
		List<Customer> selecctCusList = customSelectService.selecctCusList();
		data.put("selecctCusList", selecctCusList);
		return "forward:/YuanGonglist_lwh.jsp";
	}
	
	
}
