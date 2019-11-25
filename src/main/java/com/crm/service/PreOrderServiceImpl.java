package com.crm.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.crm.bean.Preorder;
import com.crm.dao.PreorderMapper;


@Service("preOrderService")
public class PreOrderServiceImpl implements PreOrderService{

	@Resource
	private PreorderMapper preorderMapper;
	
	@Override
	public List<Preorder> selectPre() {

		List<Preorder> selectPre = preorderMapper.selectPre();
		return selectPre;
	}

}
