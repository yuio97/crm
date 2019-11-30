package com.crm.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crm.bean.PurchasingOrder;
import com.crm.bean.PurchasingXq;
import com.crm.service.PurchasingOrderService;
import com.crm.service.PurchasingXqService;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/purchasingOrder")
public class PurchasingOrderController {
	@Resource
	private PurchasingOrderService purchasingOrderSerice;
	
	@Resource
	private PurchasingXqService purchasingXqService; 
	
	//查看采购列表
	@RequestMapping("getpurchasingOrderList")
	@ResponseBody
	public HashMap<String, Object> getPurchasingOrderList(@RequestParam(defaultValue="1")int pn,String state){
        PageInfo<PurchasingOrder> pageInfo = purchasingOrderSerice.getPurchasingOrderList(state,pn);
		HashMap<String, Object> hashMap = new HashMap<>();
		hashMap.put("purchasingOrderList", pageInfo);
		return hashMap;
	}
	
	//添加采购表
	
	
	@RequestMapping("/addpo")
	public String insert(@RequestBody PurchasingOrder record){
		System.out.println(record);
		 purchasingOrderSerice.insertSelective(record);
		return "redirect:/caigou_add.jsp";
		
	}
	
	//修改采购表
	@RequestMapping("/getporderId")
	public String selectByPrimaryKey(Integer porderId,Map<String,Object> data){
		PurchasingOrder porder = purchasingOrderSerice.selectByPrimaryKey(porderId);
	    data.put("porder", porder);
		return "forward:/caigou_update.jsp";
		
	}
	
	//查看采购表详情
	@RequestMapping("/getporderId1")
	public String selectByPrimaryKey1(Integer porderId,Map<String,Object> data){
		List<PurchasingXq> purchasingXqList1 = purchasingXqService.getPurchasingXqList1(porderId);
		data.put("purchasingXqList1", purchasingXqList1);
		return "forward:/caigou_xq.jsp";
		
	}
	//根据时间查看采购单
	@RequestMapping("purchasingOrderList")
	@ResponseBody
	public PageInfo<PurchasingOrder> pOrderList(@RequestParam(defaultValue="1") int pn,String state,String start,String end){
		
		if(start != null && start != "") {
			start = start ;
		}
		if(end != null && end != "") {
			end = end  ;
		}
//		System.out.println(start);
		PageInfo<PurchasingOrder> pOrderList = purchasingOrderSerice.purchasingOrderList(pn, state, start, end);
		System.out.println(pOrderList.getList());
		return pOrderList;
	}
	
	 
}
