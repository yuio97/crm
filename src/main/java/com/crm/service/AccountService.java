package com.crm.service;

import com.crm.bean.SysAccount;

public interface AccountService {
	
	public  boolean updateByPrimaryKeySelective(SysAccount account);
}