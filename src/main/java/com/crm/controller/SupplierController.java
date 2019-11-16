package com.crm.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.crm.bean.Supplier;
import com.crm.service.SupplierService;

@Controller
@RequestMapping("/supplier")
public class SupplierController {
	
	@Resource
	private SupplierService supplierService;
	
	
	@RequestMapping("/getSupplierList")
	public String getSupplierList(Map<String,Object> data){
		List<Supplier> supplierList = supplierService.getSupplierList();
		data.put("supplierList", supplierList);
		return "forward:/goods_add.jsp";
		
	}
	@RequestMapping("/addSupplier")
	public String addSupplier(Supplier supplier){
		supplierService.addSupplier(supplier);
		return "";
		
	}       

}
