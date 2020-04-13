package com.st.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.CredentialsException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.st.service.RoleService;

@Controller
public class AnonAction {
	@Autowired
	private RoleService roleS;


@RequestMapping("/login")
public String login() {
	return "login";
}
@RequestMapping("/tologin")
public String tologin() {
	return "tologin";
}
@RequestMapping("/login_system")
public String login_system(String username,String password,HttpServletRequest request) {
	//使用用户名和密码生成安全令牌
	UsernamePasswordToken token=new UsernamePasswordToken(username,password);
  //获取当前访问用户的对象
    Subject sub=SecurityUtils.getSubject();
    try {
	//带着令牌登录，找realm
    sub.login(token);//执行开始登录方法--执行realm
    }catch(CredentialsException ce) {
    	request.setAttribute("mes", ce.getMessage());
    	return "login";
    }
    return "houtai";
}

/**
 * 保存分配权限
 */
	@RequestMapping("/role_perm/{role_id}/{perms}")
	public void role_perm(@PathVariable String role_id,@PathVariable String perms) {
		System.out.println("----"+role_id);
		System.out.println(perms);
		roleS.role_del(role_id);
	    roleS.role_perm(role_id,perms);
	}

}
