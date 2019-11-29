package com.crm.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crm.bean.Supplier;
import com.crm.service.SupplierService;

@Controller
@RequestMapping("/supplier")
public class SupplierController {
	
	@Resource
	private SupplierService supplierService;
	
	
	@RequestMapping("/SupplierList")
	public String getSupplierList(Map<String,Object> data){
		List<Supplier> supplierList = supplierService.getSupplierList();
		data.put("supplierList", supplierList);
		return "forward:/supplier_list.jsp";
		
	}
	
	@RequestMapping("/getSupplierList")
	@ResponseBody
	public List<Supplier> getSupplierList(){
		List<Supplier> supplierList = supplierService.getSupplierList();
		return supplierList ;
		
	}
	
	@RequestMapping("/addSupplier")
	public String addSupplier(Supplier supplier){
		supplierService.addSupplier(supplier);
		return "forward:/supplier_add.jsp";
		
	}  
	@RequestMapping("/selectById")
	public String selectById(Integer supplierId,Map<String,Object> data){
		Supplier supplierList = supplierService.selectByPrimaryKey(supplierId);
		data.put("supplierList", supplierList);
		return "forward:/supplier_update.jsp";
		
	}

}
