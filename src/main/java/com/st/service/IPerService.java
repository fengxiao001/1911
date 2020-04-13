package com.st.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.st.dao.IPerD;

@Service
public class IPerService {
@Autowired
IPerD perd;
	
	
	public List checkper(Map params) {
		// TODO Auto-generated method stub
		List list=perd.checkper(params);
		return list;
	}


	public void insertper(Map params) {
		// TODO Auto-generated method stub
		perd.insertper(params);
		
	}


	public void updateper(Map params) {
		// TODO Auto-generated method stub
		perd.updateper(params);
		
	}


	public void delper(Map params) {
		// TODO Auto-generated method stub
		perd.delper(params);
	}

	
	
}
