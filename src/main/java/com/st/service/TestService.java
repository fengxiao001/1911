package com.st.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.TransactionCallback;
import org.springframework.transaction.support.TransactionTemplate;

import com.st.dao.TestDao;

@Service
public class TestService {
	@Autowired
	TestDao testd;
	@Autowired
	TransactionTemplate transT;

//一个方法可以作为一个事务
//@Transactional
	public void addBM() {
		// 新增部门数据
		// 新增两个部门信息
		// 事务----整体--
		// 1、
		
		
		
		//编程式处理
		transT.execute(new TransactionCallback<Boolean>() {

			@Override
			public Boolean doInTransaction(TransactionStatus status) {
				// TODO Auto-generated method stub
				try {
					Map map = new HashMap();
					UUID uuid = UUID.randomUUID();
					map.put("uuid", uuid.toString());
					map.put("bmname", "人力部");
					testd.addBM(map);
					//System.out.println(1 / 0);
					// 2、
					uuid = UUID.randomUUID();
					map.put("uuid", uuid.toString());
					map.put("bmname", "市场部");
					testd.addBM(map);
				}catch (Exception e) {
					status.setRollbackOnly();
					// TODO: handle exception
					return false;
				}
				return true;
			}

		});
		
	}
	public void addBM2() {
		
	}
	
	public List treeJson() {
		List list=testd.treeJson();
        return list;	
	}
	public List checkuser(Map params) {
		// TODO Auto-generated method stub
		List list=testd.checkuser(params);
		return list;
	}
	public void insertuser(Map params) {
		// TODO Auto-generated method stub
		testd.insertuser(params);
	}
	public void updateuser(Map params) {
		// TODO Auto-generated method stub
		testd.updateuser(params);
		
	}
	public void deluser(Map params) {
		// TODO Auto-generated method stub
		testd.deluser(params);
		
	}
	//用户查询
	public List chaxun(Map params) {
		// TODO Auto-generated method stub
		 List list=testd.chaxun(params);
		return list;
	}
	public void insertyonghu(Map params) {
		// TODO Auto-generated method stub
		testd.insertyonghu(params);
		
	}
	//修改用户信息
	public void updateyonghu(Map params) {
		// TODO Auto-generated method stub
		testd.updateyonghu(params);
		
	}
	public void delyonghu(Map params) {
		// TODO Auto-generated method stub
		testd.delyonghu(params);
		
	}
	public List positionlist() {
		// TODO Auto-generated method stub
	List list=testd.positionlist();
		return list;
	}
	public List findAllPattern() {
		// TODO Auto-generated method stub
		List list=testd.findAllPattern();
		return list;
	}
}
