package com.crm.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.crm.bean.SysAccount;
import com.crm.dao.SysAccountMapper;
import com.crm.service.AccountService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class AccountServiceImpl implements AccountService{
	
	@Resource
	private SysAccountMapper sysAccountMapper;
	
	@Override
	public boolean updateByPrimaryKeySelective(SysAccount account) {
		
		if(sysAccountMapper.updateByPrimaryKeySelective(account) == 0) {
			return false;
		}else {
			return true;
		}
		
	}

	@Override
	public SysAccount getAccountByAccountId(Integer id) {
		
		return sysAccountMapper.selectByPrimaryKey(id);
	}

	@Override
	public boolean updataAccountPass(SysAccount account) {
		if(sysAccountMapper.updateByPrimaryKeySelective(account) == 0) {
			return false;
		}else {
			return true;
		}
		
	}

	@Override
	public PageInfo<SysAccount> getAccountList(int pn) {
		
		PageHelper.startPage(pn, 10);
		List<SysAccount> accountList = sysAccountMapper.getAccountList();
		PageInfo<SysAccount> info = new PageInfo<SysAccount>(accountList);
		return info;
	}

	@Override
	public boolean delAccountByAccountId(int id) {
		if(sysAccountMapper.deleteByPrimaryKey(id) == 0) {
			return false;
		}
		else {
			return true;
		}
	}

	@Override
	public int addAccount(SysAccount account) {
		
		return sysAccountMapper.insertSelective(account);
	}

	@Override
	public PageInfo<SysAccount> getListByConditions(int id, String name, String start, String end) {
		PageHelper.startPage(id, 10);
		List<SysAccount> accountList = sysAccountMapper.getListConditions(name, start, end);
		PageInfo<SysAccount> info = new PageInfo<SysAccount>(accountList);
		return info;
	}
	

}
