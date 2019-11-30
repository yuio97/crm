package com.crm.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crm.bean.Customer;
import com.crm.service.CustomSelectService;

@Controller
@RequestMapping("/cus")
public class CustomSelectController {

	@Resource
	CustomSelectService customSelectService;

	@RequestMapping("/selectcus")
	@ResponseBody
	public List<Customer> select() {
		
		List<Customer> selecctCusList = customSelectService.selecctCusList();
		return selecctCusList;
	}
	
	@RequestMapping("/addcus")
	@ResponseBody
	public Map<String, Object> addcus(Customer cus)
	{
		customSelectService.insertcus(cus);
		HashMap<String, Object> map = new HashMap<String, Object>();
		return map;
	}
	
	@RequestMapping("/del")
	public String del(Integer id) 
	{
		customSelectService.del(id);
		return "redirect:/YuanGonglist_kehu.jsp";
	}
	
	
}
