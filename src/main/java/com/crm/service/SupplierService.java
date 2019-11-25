package com.crm.service;

import java.util.List;

import com.crm.bean.Supplier;
import com.github.pagehelper.PageInfo;

public interface SupplierService {
	
	 public void addSupplier(Supplier supplier);
	 
	 public void updateSupplier(Supplier supplier);
	 
	 public void deleteSupplier(Integer supplierId);
	 
	 public List<Supplier> getSupplierList();
	 
	 Supplier selectByPrimaryKey(Integer supplierId);
	 
	 public PageInfo<Supplier> getSupplierList(int pn,int size); 

}
