package com.crm.serviceImpl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.crm.bean.SysAccount;
import com.crm.dao.SysAccountMapper;
import com.crm.service.AccountService;

@Service
public class AccountServiceImpl implements AccountService{
	
	@Resource
	private SysAccountMapper sysAccountMapper;
	
	@Override
	public boolean updateByPrimaryKeySelective(SysAccount account) {
		
		if(sysAccountMapper.updateByPrimaryKey(account) == 0) {
			return false;
		}else {
			return true;
		}
		
	}

}
