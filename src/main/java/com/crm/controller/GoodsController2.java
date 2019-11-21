package com.crm.controller;


import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.crm.bean.Goods;
import com.crm.service.GoodsService;

@Controller
@RequestMapping("/goods1")
public class GoodsController2 {
	@Resource
	private GoodsService goodsService;
	
	@RequestMapping("/updategoods")
	public String update(Goods goods){
		System.out.println(goods);
		goodsService.updateByPrimaryKey(goods);
		return "redirect:/goods/goodsList";
		
	
	}
	@RequestMapping("/getGoodsId")	
	public String selectBygoodsId1(Goods goodsId,Map<String,Object> data){
		Goods select = goodsService.select(goodsId);
		data.put("goodslist", select); 
		
		return "redirect:/goods/delectgoods";
		
	}
	
	

}
