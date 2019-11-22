package com.crm.controller;


import java.io.File;
import java.io.IOException;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.crm.bean.Goods;
import com.crm.service.GoodsService;

@Controller
@RequestMapping("/goods1")
public class GoodsController2 {
	@Resource
	private GoodsService goodsService;
	
	@RequestMapping("/updategoods")

	public String upload(Goods goods,MultipartFile gImg,HttpServletRequest req) throws IllegalStateException, IOException
	{
		String showPath = null;
		//判断文件是否存在
		if(gImg != null && !gImg.isEmpty())
		{
		
			String realPath = req.getServletContext().getRealPath("/upload");
			File dir = new File(realPath);
			if(!dir.exists())
			{
				dir.mkdirs();
			}
			//获取原始文件名
			String originalFilename = gImg.getOriginalFilename();
			
			//截取出后缀名
			String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
			
			String fileName =  System.currentTimeMillis() + ext;
			String savePath = realPath + "/" + fileName;
			
			//存储文件到服务器
			gImg.transferTo(new File(savePath));
			showPath = "upload/"+fileName;
			
		}
		
		System.out.println(showPath);
		goods.setGoodsImg(showPath);
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
