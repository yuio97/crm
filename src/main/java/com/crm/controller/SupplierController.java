package com.crm.controller;

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
	
	public String addSupplier(Supplier supplier){
		supplierService.addSupplier(supplier);
		return "";
		
	}       

}
