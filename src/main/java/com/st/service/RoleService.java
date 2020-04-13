package com.st.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.st.bean.UserBean;
import com.st.dao.RoleDao;

@Service
public class RoleService {
	@Autowired
	RoleDao roleD;
public UserBean getUser(String username) {
	return roleD.getUser(username);
	
}
	/**
	 * 保存角色和权限的关联
	 * 
	 * @param role_id
	 * @param perms
	 */
	public void role_perm(String role_id, String perms) {
		// TODO Auto-generated method stub
		// 1、将perms转为集合
		List list = toList(perms);
		Map map = new HashMap();
		map.put("role_id", role_id);
		map.put("perms", list);
		roleD.role_perm(map);
	}

	private List toList(String perms) {
		List list = new ArrayList();
		String[] perm_arr = perms.split(",");
		for (String str : perm_arr) {
			if (!str.trim().equals("")) {
				list.add(str);
			}
		}
		return list;

	}
	
	public List getPermByUsername(String username) {
		return roleD.getPermByUsername(username);
	}
	public void role_del(String role_id) {
		// TODO Auto-generated method stub
		roleD.role_del(role_id);
	}
	
}
