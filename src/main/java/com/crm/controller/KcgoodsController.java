package com.crm.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crm.bean.Kcgoods;
import com.crm.dao.KcgoodsMapper;
import com.crm.service.KcgoodsService;
import com.github.pagehelper.PageInfo;


@Controller
@RequestMapping("/kc")
public class KcgoodsController {
	
	@Resource
	private KcgoodsService kcgoodsService;
	
@RequestMapping("getkcList")
@ResponseBody
public HashMap<String, Object> getKcgoodsList1(){
	List<Kcgoods> kcgoodsList = kcgoodsService.getKcgoodsList();
	System.out.println(kcgoodsList);
	HashMap<String, Object> hashMap = new HashMap<>();
	hashMap.put("kcgoodsList", kcgoodsList);
	return hashMap;
		
	}


}
	
