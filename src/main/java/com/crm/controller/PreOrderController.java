package com.crm.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crm.bean.Customer;
import com.crm.bean.Kcgoods;
import com.crm.bean.Preorder;
import com.crm.service.PreOrderService;

@Controller
@RequestMapping("/preorder")
public class PreOrderController {

	@Resource
	private PreOrderService preOrderService;
	
	@RequestMapping("/select")
	@ResponseBody
	public List<Preorder> selectPre()
	{
		List<Preorder> selectPre = preOrderService.selectPre();
		return selectPre;
	}
	
	@RequestMapping("/selectadd")
	@ResponseBody
	public Map<String, Object> selectGoodsNum()
	{
		List<Kcgoods> goodsNum = preOrderService.selectGoodsNum();
		List<Customer> cus = preOrderService.selectCus();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("goodsNum", goodsNum);
		map.put("cus", cus);
		return map;
	}
}
