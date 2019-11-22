package com.crm.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crm.bean.Preorder;
import com.crm.service.PreOrderService;

@Controller
@RequestMapping("/preorder")
public class PreOrderController {

	@Resource
	private PreOrderService preOrderService;
	
	@RequestMapping("/select")
	@ResponseBody
	public List<Preorder> selectPre(Integer preId)
	{
		List<Preorder> selectPre = preOrderService.selectPre(preId);
		return selectPre;
	}
}
