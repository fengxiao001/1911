package com.st.action;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.st.service.RoleService;

@Controller
@RequestMapping("/sys")
public class RoleAction {
	@Autowired
	private RoleService roleS;
	
	//跳转后台管理
	@RequestMapping("/houtai")
	public String houtai() {
		return "houtai";
	}
	
	//跳转角色页面
	@RequestMapping("/juese")
	//判断权限
	@RequiresPermissions("user_system")
	public String juese() {
		return "yonghu";
	}
	
	//跳转用户界面
	@RequestMapping("/yonghu")
	public String yonghu() {
		return "user";
	}
}
