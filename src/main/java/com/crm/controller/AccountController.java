package com.crm.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crm.Util.CharUtil;
import com.crm.bean.SysAccount;
import com.crm.bean.SysStaffInfo;
import com.crm.service.AccountService;
import com.crm.service.StaffInfoService;
import com.github.pagehelper.PageInfo;

@Controller
public class AccountController {
	
	@Resource
	public  AccountService accountServiceImpl;
	
	@Resource
	public StaffInfoService staffInfoService;
	
	//员工修改密码
	@RequestMapping("/updateAccountPass")
	@ResponseBody
	public HashMap<String, String> updatePass(String pass,String sysAccountPass,Map<String, Object> data) {
		
		HashMap<String, String> hashMap = new HashMap<>();
		

		Subject subject = SecurityUtils.getSubject();
		SysAccount user = (SysAccount) subject.getPrincipal();
		
		SysAccount account = new SysAccount();
		
		if(CharUtil.passwordMd5(pass, user.getSysAccountSalt()).equals(user.getSysAccountPass()))
		{
			String  password= CharUtil.passwordMd5(sysAccountPass, user.getSysAccountSalt());
			account.setSysAccountId(user.getSysAccountId());
			account.setSysAccountPass(password);
			
			boolean r = accountServiceImpl.updataAccountPass(account);

			if(r) {
				hashMap.put("sta", "0");
				subject.logout();
				return hashMap;
			}else {
				hashMap.put("sta", "1");
				return hashMap;
			}
		}	
		System.out.println("密码错误");
		hashMap.put("sta", "2");
		return hashMap;
	}
	
	
	//获得员工账号信息
	@RequestMapping("/getAccountList")
	@ResponseBody
	public PageInfo<SysAccount> getAccountList(@RequestParam(defaultValue="1") int pn) {
		PageInfo<SysAccount> accountList = accountServiceImpl.getAccountList(pn);		
		return accountList;
		
	}
	
	
	//根据员工id获得员工信息
	@RequestMapping("/getStaffInfo")
	public String getStaffInfo(String id,Map<String , Object> data) {
//		System.err.println(id);
		SysStaffInfo info = staffInfoService.getStaffInfoByStaffId(Integer.valueOf(id));
		data.put("info", info);
		return "forward:/staffInfo.jsp";
	}
	
	//锁定用户账号
	@RequestMapping("/lockAccount")
	@ResponseBody
	public HashMap<String, String> updateSta(String accountId,String sta){
		
		HashMap<String, String> hashMap = new HashMap<>();
		
		SysAccount account = new SysAccount();
		account.setSysAccountId(Integer.valueOf(accountId));
		if(sta.equals("1")) {
			account.setSysAccountSta("0");
		}else
		{
			account.setSysAccountSta("1");
		}
		
		boolean b = accountServiceImpl.updateByPrimaryKeySelective(account);
		
		if(b) {
			hashMap.put("sta", "1");
		}else {
			hashMap.put("sta", "0");
		}
		return hashMap;
		
	}
	
	//修改员工信息
	@RequestMapping("/updateStaff")
	public String updateStaff(SysStaffInfo info) {
		
		staffInfoService.updateStaff(info);
		return "forward:staffList.jsp";
		
	}
	
	//修改员工信息
	@RequestMapping("/goUpdateStaff")
	public String getStaff(String staffId,Map<String, Object> data) {
		
		SysStaffInfo info = staffInfoService.getStaffInfoByStaffId(Integer.valueOf(staffId));
		data.put("info", info);
		return "forward:updateStaff.jsp";		
	}
	
	@RequestMapping("/delAccount")
	@ResponseBody
	public String delAccount(int[] accountId) {
		for (int i = 0; i < accountId.length; i++) {
			accountServiceImpl.delAccountByAccountId(accountId[i]);
		}
		return null;
		
	}
	
	@RequestMapping("/addStaff")
	public String AddStaff(SysStaffInfo info) {
		
		return null;
		
	}
	
}
