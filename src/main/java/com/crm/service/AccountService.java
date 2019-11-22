package com.crm.service;

import java.util.List;

import com.crm.bean.SysAccount;
import com.github.pagehelper.PageInfo;

public interface AccountService {
	
	public  boolean updateByPrimaryKeySelective(SysAccount account);
	
	public SysAccount getAccountByAccountId(Integer id);
	
	public boolean updataAccountPass(SysAccount account);
	
	public PageInfo<SysAccount> getAccountList(int id);
	
	public boolean delAccountByAccountId(int id);
	

		
}
