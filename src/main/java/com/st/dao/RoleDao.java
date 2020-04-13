package com.st.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.st.bean.UserBean;

@Repository
public interface RoleDao {
	
void role_perm(Map map);

UserBean getUser(String username);

List getPermByUsername(String username);

void role_del(String role_id);
}
