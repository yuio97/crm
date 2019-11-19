package com.crm.controller;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.crm.Util.CharUtil;
import com.crm.bean.SysAccount;
import com.crm.service.AccountService;

@Controller
public class AccountController {
	
	@Resource
	public  AccountService accountServiceImpl;
	
	@RequestMapping("/updateAccountPass")
	public String updatePass(String pass,String sysAccountPass,Map<String, Object> data) {
		

		Subject subject = SecurityUtils.getSubject();
		SysAccount user = (SysAccount) subject.getPrincipal();
		
		SysAccount account = new SysAccount();
		
		if(CharUtil.passwordMd5(pass, user.getSysAccountSalt()).equals(user.getSysAccountPass()))
		{
			String  password= CharUtil.passwordMd5(sysAccountPass, user.getSysAccountSalt());
			account.setSysAccountId(user.getSysAccountId());
			account.setSysAccountPass(password);
			
			boolean r = accountServiceImpl.updataAccountPass(account);
			System.out.println(r);
			if(r) {
				return "redirect:/logout";
			}else {
				return "forward:/My_mim.jsp?sta=1";
			}
		}	
		System.out.println("密码错误");
		return "forward:/My_mim.jsp?sta=2";
	}
}
