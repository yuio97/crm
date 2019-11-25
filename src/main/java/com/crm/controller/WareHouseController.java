package com.crm.controller;


import java.util.List;
import java.util.Map;

import javax.annotation.Resource;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crm.bean.WareHouse;

import com.crm.service.WareHouseService;

@Controller
@RequestMapping("house")
public class WareHouseController {
	
	@Resource
	private WareHouseService wareHouseService;
	
	
	@RequestMapping("getwareHouseList")
	public String getWareHouseList(Map<String,Object> data){
		 List<WareHouse> wareHouseList = wareHouseService.getWareHouseList();
		 data.put("wareHouseList", wareHouseList);
		
		 return "forward:/warehouse_list.jsp";
			
		}
	@RequestMapping("addWarehouse")
	public String addwarehouse(WareHouse wareHouse){
		wareHouseService.addWareHouse(wareHouse);
		return "forward:/warehouse_add.jsp";
		
	}
	@RequestMapping("selectById")
	public String warehouseselectById(Integer warehouseId,Map<String,Object> data){
		WareHouse selectById = wareHouseService.selectById(warehouseId);
		data.put("selectById", selectById);
		return "forward:/warehouse_update.jsp";
		
	}
	


}
