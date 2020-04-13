package com.st.shiro;

import java.util.ArrayList;
import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.CredentialsException;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.st.bean.PermBean;
import com.st.bean.UserBean;
import com.st.service.RoleService;

@Component
public class Myrealm extends AuthorizingRealm {
	@Autowired
	RoleService roleS;
	/**
	 * 该方法一定是登录成功之后运行
	 * 每当取药权限认证时，会执行此方法
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		System.out.println("----------获取权限");
		// TODO Auto-generated method stub
		// 获取当前用户名
		String username = (String) SecurityUtils.getSubject().getPrincipal();
		List list = roleS.getPermByUsername(username);
		SimpleAuthorizationInfo sai = new SimpleAuthorizationInfo();
		// 需要一个字符串集合
		List<String> str_perm_list = getPermList(list);
		System.out.println(str_perm_list);
		sai.addStringPermissions(str_perm_list);
		return sai;
	}

	private List<String> getPermList(List list) {
		List<PermBean> PBlist = (List<PermBean>) list;
		List<String> str_perm_list = new ArrayList<String>();
		for (PermBean pb : PBlist) {
			str_perm_list.add(pb.getPer_code());
		}
		return str_perm_list;
	}

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		// TODO Auto-generated method stub
		// 获得用户名和密码
		String username = token.getPrincipal().toString();
		String password = new String((char[]) token.getCredentials());
		SimpleHash sh=new SimpleHash("md5",password);
		//盐值加密
		/*
		 * sh=new SimpleHash("md5", password,username); sh=new SimpleHash("md5",
		 * password, username, 12);
		 */
		// 数据库验证是否正确
		System.out.println(sh.toString());
		UserBean user = roleS.getUser(username);
		if (!sh.toString().equals(user.getPassword())) {
			throw new CredentialsException("密码不正确");
		}
		return new SimpleAuthenticationInfo(username, password, getName());
	}

}
