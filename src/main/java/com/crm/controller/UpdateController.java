package com.crm.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.crm.bean.PurchasingOrder;
import com.crm.bean.Supplier;
import com.crm.bean.WareHouse;
import com.crm.service.PurchasingOrderService;
import com.crm.service.SupplierService;
import com.crm.service.WareHouseService;

@Controller
@RequestMapping("/update")
public class UpdateController {
	@Resource
	private PurchasingOrderService purchasingOrderSerice; 
	
	@Resource
	private WareHouseService wareHouseService;
	
	@Resource
	private SupplierService supplierService;
	
	
	@RequestMapping("/updatePurchasingOrder")
	public String updateById(PurchasingOrder porderId){
		 purchasingOrderSerice.updateByPrimaryKeySelective(porderId);
		return "forward:/caigou_list.jsp";
		
	}
	
	@RequestMapping("/updateWarehouse")
	public String updateById(WareHouse wareHouse){
		wareHouseService.updateWareHouse(wareHouse);
		return "redirect:/house/getwareHouseList";
		
	}
	@RequestMapping("/updateSupplier")
	public String updateById(Supplier supplier){
		System.out.println(supplier.getSupplierId());
		supplierService.updateSupplier(supplier);
		return "redirect:/supplier_list.jsp";
		
		
	}
	

}
