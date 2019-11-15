package com.crm.controller;

import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.crm.bean.SysAccount;
import com.crm.service.AccountService;
import com.crm.serviceImpl.AccountServiceImpl;

@Controller
public class PersonController {
	
	@Resource
	public AccountService accountServiceImpl;
	
	@RequestMapping("/updatePass")
	public String updatePass(SysAccount account) {
		
		Subject subject = SecurityUtils.getSubject();
		SysAccount user = (SysAccount) subject.getPrincipal();
		
		account.setSysAccountId(user.getSysAccountId());
		if(accountServiceImpl.updateByPrimaryKeySelective(account)) {
			return "redirect:login.jsp";
		}
		return null;
				
	}
}
