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
	private SqlSessionTemplate st;
	@Override
	public void addSupplier(Supplier supplier) {
		SupplierMapper supp = st.getMapper(SupplierMapper.class);
		supp.insertSelective(supplier);
		
	}
	@Override
	public void updateSupplier(Supplier supplier) {
		SupplierMapper mapper = st.getMapper(SupplierMapper.class);
		mapper.updateByPrimaryKey(supplier);
		
	}
	@Override
	public void deleteSupplier(Integer supplierId) {
		SupplierMapper mapper = st.getMapper(SupplierMapper.class);
		mapper.deleteByPrimaryKey(supplierId);
		
	}
	@Override
	public List<Supplier> getSupplierList() {
		 
		return null;
	}
	@Override
	public PageInfo<Supplier> getSupplierList(int pn, int size) {
		SupplierMapper mapper = st.getMapper(SupplierMapper.class);
		PageHelper.startPage(pn, size);
		List<Supplier> supplierList = mapper.getSupplierList();
		PageInfo<Supplier> pageInfo = new PageInfo<Supplier>(supplierList);
		return pageInfo;
	}

}
