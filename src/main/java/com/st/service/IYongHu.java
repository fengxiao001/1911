package com.st.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.st.dao.YongHuD;

@Service
public class IYongHu {
@Autowired
YongHuD test;
	
	public List checkyonghu(Map params) {
		// TODO Auto-generated method stub
		List list=test.checkyonghu(params);
		return list;
	}

	public void insertkehu(Map params) {
		// TODO Auto-generated method stub
		test.insertkehu(params);
		
	}

	public void updatekehu(Map params) {
		// TODO Auto-generated method stub
		test.updatekehu(params);
	}

	public void delkehu(Map params) {
		// TODO Auto-generated method stub
		test.delkehu(params);
	}

	public List checkbumen(Map params) {
		// TODO Auto-generated method stub
		List list=test.checkbumen(params);
		return list;
	}

	public void insertbumen(Map params) {
		test.insertbumen(params);
	}

	public void updatebumen(Map params) {
		// TODO Auto-generated method stub
		test.updatebumen(params);
		
	}

	public void delbumen(Map params) {
		// TODO Auto-generated method stub
		test.delbumen(params);
	}

	public List findAll() {
		// TODO Auto-generated method stub
		List list=test.findAll();
		return list;
	}

	public void updatepingji(Map params) {
		// TODO Auto-generated method stub
		test.updatepingji(params);
		
	}

	public void xxxUser(Map params) {
		System.out.println("ser"+params);
		String str=(String)params.get("role_id");
		String regex="\"value\":\"(.*?)\"";
		Pattern p=Pattern.compile(regex);
		Matcher m=p.matcher(str);
		List list = new ArrayList();
		while (m.find()){
			list.add(m.group(1));
		}
		params.put("role_id", list);
		System.out.println("service:"+params);
		test.delUser_role(params);
		test.xxxUser(params);
	}

	public List checkgonghai(Map params) {
		// TODO Auto-generated method stub
	List list=test.checkgonghai(params);
		return list;
	}

	public List checkpri() {
		List list=test.checkpri();
		return list;
	}

	public void updategendan(Map params) {
		// TODO Auto-generated method stub
		test.updategendan(params);
		
	}
}
