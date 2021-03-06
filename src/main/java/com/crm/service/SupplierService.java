package com.crm.service;

import java.util.List;

import com.crm.bean.Supplier;
import com.github.pagehelper.PageInfo;

public interface SupplierService {
	
	 public int addSupplier(Supplier supplier);
	 
	 public int updateSupplier(Supplier supplier);
	 
	 public int deleteSupplier(Integer supplierId);
	 
	 public List<Supplier> getSupplierList();
	 
	 Supplier selectByPrimaryKey(Integer supplierId);
	
	 List<Supplier> chaSupplierList(Supplier supplier);
	 
	 public PageInfo<Supplier> getSupplierList(int pn,int size); 

}
