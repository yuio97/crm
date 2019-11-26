package com.crm.service;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.crm.bean.Supplier;
import com.crm.dao.SupplierMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service("supplier")
public class SupplierServiceImpl implements SupplierService{
	
	@Resource
	private SupplierMapper  supplierMapper;
	
	@Override
	public int addSupplier(Supplier supplier) {
		return supplierMapper.insertSelective(supplier);
		
	}
	@Override
	public int updateSupplier(Supplier supplier) {
		return supplierMapper.updateByPrimaryKeySelective(supplier);
		
	}
	@Override
	public int deleteSupplier(Integer supplierId) {
		return supplierMapper.deleteByPrimaryKey(supplierId);
		
	}
	@Override
	public List<Supplier> getSupplierList() {
		List<Supplier> supplierList = supplierMapper.getSupplierList();
		return supplierList;
	}
	@Override
	public PageInfo<Supplier> getSupplierList(int pn, int size) {
		List<Supplier> supplierList = supplierMapper.getSupplierList(); 
		PageHelper.startPage(pn, size);
		PageInfo<Supplier> pageInfo = new PageInfo<Supplier>(supplierList);
		return pageInfo;
	}
	@Override
	public Supplier selectByPrimaryKey(Integer supplierId) {
		Supplier selectByPrimaryKey = supplierMapper.selectByPrimaryKey(supplierId);
		return selectByPrimaryKey;
	}
	@Override
	public List<Supplier> chaSupplierList(Supplier supplier) {
		return  supplierMapper.chaSupplierList(supplier);
		
	}

}
