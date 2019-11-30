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
		return "forward:/vip_list_xq_update.jsp";
	}
	
	@RequestMapping("/updateOrder")
	@ResponseBody
	public Map<String, Object> updateOrder(@RequestBody Preorder preorder)
	{
		preOrderService.updateOrder(preorder);
		 Map<String, Object> map = new HashMap<String, Object>();
		return map;
	}
	
	
	@RequestMapping("/del")
	public String del(Integer id)
	{
		List<Preorder> list = preOrderService.selectPreById(id);
		Preorder preorder = list.get(0);
		List<PreorderDetails> proDetaList = preorder.getProDetaList();
		boolean state = true;
		for (int i = 0; i < proDetaList.size(); i++) {
			Integer kcNumSell = proDetaList.get(i).getKcNumSell();
			Integer kcNum = proDetaList.get(i).getKcgoods().getKcNum();
			if(kcNumSell > kcNum)
			{
				state = false;
				break;
			}
		}
		if(state)
		{
			for (int i = 0; i < proDetaList.size(); i++) {
				Integer kcNumSell = proDetaList.get(i).getKcNumSell();
				Integer kcNum = proDetaList.get(i).getKcgoods().getKcNum();
				Integer kcgoodsId = proDetaList.get(i).getKcgoods().getKcgoodsId();
				
				kcNum = kcNum - kcNumSell;
				preOrderService.insertpro(preorder);
				preOrderService.updatekc(kcgoodsId, kcNum);
				preOrderService.del(preorder.getPreorderId());
			}
			
		}
		else
		{
			
		}
		return "forward:/vip_list_lwh.jsp";
	}
	
	
	@RequestMapping("/tijiao")
	@ResponseBody
	public boolean tijiao(Integer id) {
		List<Preorder> list = preOrderService.selectPreById(id);
		Preorder preorder = list.get(0);
		List<PreorderDetails> proDetaList = preorder.getProDetaList();
		boolean state = true;
		for (int i = 0; i < proDetaList.size(); i++) {
			Integer kcNumSell = proDetaList.get(i).getKcNumSell();
			Integer kcNum = proDetaList.get(i).getKcgoods().getKcNum();
			System.out.println(kcNumSell +"  "+kcNum);
			if(kcNumSell > kcNum)
			{
				state = false;
				break;
			}
		}
		
		return state;
	}
	
	@RequestMapping("/realdel")
	public String realdel(Integer rid)
	{
		preOrderService.realdel(rid);
		return "redirect:/vip_list_lwh.jsp";
	}
	
}
