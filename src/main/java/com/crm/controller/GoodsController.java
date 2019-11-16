package com.crm.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crm.bean.Goods;
import com.crm.service.GoodsService;

@Controller
@RequestMapping("/goods")
public class GoodsController {
	@Resource
	private GoodsService goodsService;
	
	@RequestMapping("/goodsList")
	public String getGoodsList(Map<String,Object> data){
		List<Goods> goodsList = goodsService.getGoodsList();
		System.out.println(goodsList);
		data.put("goodsList", goodsList);
		return "forward:/goods_list.jsp";
			
		}
	
	@RequestMapping("/addgoods")
	public void insert(Goods goods){
		goodsService.insertSelective(goods);	
	}
		
	

	

}
