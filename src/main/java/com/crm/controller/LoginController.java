package com.crm.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.crm.dao.SysStaffInfoMapper;

@Controller
public class LoginController {
	
	@Resource
	public SysStaffInfoMapper sysStaffInfoMapper;
	
	@RequestMapping("/login")
	public String login(HttpServletRequest req) {
		String msg = (String)req.getAttribute(FormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME);
//		System.out.println(req.getParameter("loginUsername"));
		int state = 0;
		if(msg == null)
		{
			state = 4;
		}
		else if(msg.equals("UnknownAccountException"))
		{
			state = 1;
			System.out.println("账号名错误");
			
		}
		else if(msg.equals("IncorrectCredentialsException"))
		{
			state = 2;
			System.out.println("密码错误");
		}
		else if(msg.equals("AuthenticationException"))
		{
			state = 3;
			System.out.println("认证异常");
		}
		System.out.println(msg);
		
		return  "redirect:/login.jsp";	
	}
	
	@RequestMapping("/index")
	public String getindex(HttpServletRequest req) {

		
		return "redirect:/index.jsp";
	}
	
	@RequestMapping("/logout")
	public String logout() {
		return "redirect:/login.jsp";
	}
}
