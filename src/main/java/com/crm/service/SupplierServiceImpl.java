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
	public void addSupplier(Supplier supplier) {
		supplierMapper.insertSelective(supplier);
		
	}
	@Override
	public void updateSupplier(Supplier supplier) {
		supplierMapper.updateByPrimaryKey(supplier);
		
	}
	@Override
	public void deleteSupplier(Integer supplierId) {
		supplierMapper.deleteByPrimaryKey(supplierId);
		
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

}
