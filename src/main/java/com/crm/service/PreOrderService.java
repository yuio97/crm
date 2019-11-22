package com.crm.service;

import java.util.List;

import com.crm.bean.Preorder;

public interface PreOrderService {

	public List<Preorder> selectPre(Integer preId);
}
