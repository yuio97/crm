package com.crm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class test {
	
	@RequestMapping("/test")
	public String test() {
		System.out.println("测试一下springboot");
		return "";
	}
}
