package com.crm.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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
	@RequestMapping("/upload")
	public String upload(Goods goods,MultipartFile goodsImg,HttpServletRequest req) throws IllegalStateException, IOException
	{
		String showPath = null;
		//判断文件是否存在
		if(goodsImg != null && !goodsImg.isEmpty())
		{
			String realPath = req.getServletContext().getRealPath("/upload");
			File dir = new File(realPath);
			if(!dir.exists())
			{
				dir.mkdirs();
			}
			
			//获取原始文件名
			String originalFilename = goodsImg.getOriginalFilename();
			
			//截取出后缀名
			String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
			
			String fileName =  System.currentTimeMillis() + ext;
			String savePath = realPath + "/" + fileName;
			
			//存储文件到服务器
			goodsImg.transferTo(new File(savePath));
			showPath = "upload/"+fileName;
			
		}
		
		System.out.println(showPath);
		System.out.println(goods.getGoodsName());
		return "";
	}
	
	
	
	@RequestMapping("/addgoods")
	public void insert(Goods goods){
		goodsService.insertSelective(goods);
		
	}
		
	

	

}
