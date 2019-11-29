package com.crm.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.crm.bean.SysAccount;
import com.crm.bean.SysPermission;
import com.crm.bean.SysRole;
import com.crm.dao.SysRoleMapper;
import com.crm.dao.SysStaffInfoMapper;
import com.crm.service.AccountService;
import com.crm.service.RoleService;
import com.mysql.fabric.xmlrpc.base.Data;

@Controller
public class LoginController {
	
	@Resource
	public SysStaffInfoMapper sysStaffInfoMapper;

	@Resource
	public  AccountService accountServiceImpl;
	
	@RequestMapping("/login")
	public String login(Map<String, Object> data,String name,String password) {
		
		Subject subject = SecurityUtils.getSubject();
		UsernamePasswordToken token = new UsernamePasswordToken(name, password);
		int i = 1;
		try {
			subject.login(token);
		} catch (UnknownAccountException e) {
			// TODO Auto-generated catch block
//			e.printStackTrace();

		}catch (IncorrectCredentialsException e) {
			// TODO: handle exception
		}
		if(subject.isAuthenticated())  //判断是否登录成功
		{	
			SysAccount user = (SysAccount)subject.getPrincipal();
			user.setSysAccountTime(new Date());
//			accountServiceImpl.updateByPrimaryKeySelective(user);
			return  "redirect:/child.jsp";
		}else {
			data.put("sta", i);
			return "forward:/login.jsp";
		}
		
		
	}
	
	@RequestMapping("/logou")
	public String setLoginTime() {
		Subject subject = SecurityUtils.getSubject();
		SysAccount user = (SysAccount)subject.getPrincipal();
		user.setSysLastlogin(user.getSysAccountTime());
		accountServiceImpl.updateByPrimaryKeySelective(user);
		return "redirect:/logout";
	}
	
	@RequestMapping("/logout")
	public String logout() {
		
		return "redirect:/login.jsp";
	}
}
