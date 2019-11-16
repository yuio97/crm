package com.crm.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crm.bean.Customer;
import com.crm.service.CustomSelectService;

@Controller
public class CustomSelectController {

	@Resource
	CustomSelectService customSelectService;

	@RequestMapping("/selectcus")
	@ResponseBody
	public List<Customer> select() {
		
		List<Customer> selecctCusList = customSelectService.selecctCusList();
		return selecctCusList;
	}
	
	
}
