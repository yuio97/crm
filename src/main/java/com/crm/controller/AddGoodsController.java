package com.crm.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crm.bean.AddGood;
import com.crm.bean.Goods;
import com.crm.service.AddGoodsService;
import com.crm.service.GoodsService;

@Controller
@RequestMapping("addgoods")
public class AddGoodsController {
	@Resource
	private AddGoodsService addGoodsService;
	
	@Resource
	private GoodsService  goodsService;
	
	@RequestMapping("GoodsList")
	@ResponseBody
	public List<Goods> getgoodsList(){
		return goodsService.getGoodsList();
	}
	
	@RequestMapping("insertAddgoods")
	public String insertAddgoods(AddGood record){
		addGoodsService.insertSelective(record);
		return "forward:/addgoods_add.jsp";
		
	}
	
	
}
