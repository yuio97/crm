package com.crm.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crm.bean.Customer;
import com.crm.bean.Kcgoods;
import com.crm.bean.Preorder;
import com.crm.bean.PreorderDetails;
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
	
	@RequestMapping("/addPreOrder")
	@ResponseBody
	public Preorder addPreOrder(@RequestBody Preorder order)
	{
//		List<PreorderDetails> proDetaList = order.getProDetaList();
//		for (int i = 0; i < proDetaList.size(); i++) {
//			PreorderDetails preorderDetails = proDetaList.get(i);
//			System.out.println(preorderDetails.getKgoodsId());
//		}
		preOrderService.insertPre(order);
		
		return order;
	}
	
	
	@RequestMapping("/selectXq")
	public String selectPreXq(Integer id,Map<String, Object> map)
	{
		 List<Preorder> selectPreById = preOrderService.selectPreById(id);
		 map.put("date", selectPreById);
		return "forward:/vip_list_xq_two.jsp";
	}
	
	
	@RequestMapping("/selectXqUpdate")
	public String selectPreXqUpdate(Integer id,Map<String, Object> map)
	{
		 List<Preorder> selectPreById = preOrderService.selectPreById(id);
		 map.put("date", selectPreById);
		return "forward:/vip_list_xq_update_lwh.jsp";
	}
}
