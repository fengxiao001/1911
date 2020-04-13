package com.st.action;

import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.URL;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.st.bean.LayJson;
import com.st.service.TestService;
@Controller
public class TestAction {
	@Autowired
	TestService test;
@RequestMapping("/addBM")
@ResponseBody
public String addBM() {
	test.addBM();
	return "ceshi";
}

@RequestMapping("/treeJson")
@ResponseBody
public List treeJson() {
	List list=test.treeJson();
	return list;
}

//查询查询表信息
@RequestMapping("/checkuser")
@ResponseBody
public LayJson checkuser(@RequestParam Map checktext) {
	System.out.println("-------------");
	System.out.println(checktext);
	List list=test.checkuser(checktext);
	LayJson json=new LayJson(list);
	return json;
}
//增加角色表信息
@RequestMapping("/insertuser")
@ResponseBody
public void insertuser(@RequestParam Map params) {
	test.insertuser(params);
}
//修改juese表信息
@RequestMapping("/updateuser")
@ResponseBody
public void updateuser(@RequestParam Map params) {
	test.updateuser(params);
}
//删除角色表信息
@RequestMapping("/deluser")
@ResponseBody
public void deluser(@RequestParam Map params) {
	test.deluser(params);
}

//跳权限页面
@RequestMapping("/role_perm_page/{role_id}")
public String role_perm_page(@PathVariable String role_id,HttpServletRequest  request) {
    request.setAttribute("role_id",role_id);
	return "index";
}
//用户的查询
@RequestMapping("chaxun")
@ResponseBody
public LayJson chaxun(@RequestParam Map params) {
	List list=test.chaxun(params);
	LayJson json=new LayJson(list);
	return json;
}
//用户增加
@RequestMapping("/insertyonghu")
@ResponseBody
public void insertyonghu(@RequestParam Map params) {
	test.insertyonghu(params);
}

//修改用户表信息
@RequestMapping("/updateyonghu")
@ResponseBody
public void updateyonghu(@RequestParam Map params) {
	test.updateyonghu(params);
}
//删除用户表信息
@RequestMapping("/delyonghu")
@ResponseBody
public void delyonghu(@RequestParam Map params) {
	test.delyonghu(params);
}

@RequestMapping("positionlist")
@ResponseBody
public LayJson positionlist() {
	List list=test.positionlist();
	LayJson json=new LayJson(list);
	return json;
}

@RequestMapping("/bumen")
public String bumen() {
	return "bumen";
}

@RequestMapping("/email")
public String email() {
	return "2";
}
/**
 * 发送邮件
 * @throws Exception
 */
@RequestMapping("/youjian")
@ResponseBody
public void youjian()throws Exception {
	//设置服务器属性
	Properties props=new Properties();
	props.setProperty("mail.host", "smtp.163.com");
	props.setProperty("mail.transport.protocol", "smtp");
	props.setProperty("mail.smtp.auth", "true");
	//创建会话
	Session session = Session.getInstance(props, new Authenticator() {
		   @Override
		   protected PasswordAuthentication getPasswordAuthentication() {
		    return new PasswordAuthentication("f13225388793@163.com", "YOMJTBMLMEJSPYZV");
		   }
		  });
	//开启调试模式
	session.setDebug(true);
	//获得传输对象
	Transport t=session.getTransport();
	t.connect("smtp.163.com",25,"f13225388793@163.com","feng8766438");
	//邮件内容
	Message message=new MimeMessage(session);
	message.setFrom(new InternetAddress("f13225388793@163.com") );
	message.setRecipient(Message.RecipientType.TO, new InternetAddress("gao1154458629@163.com"));
	message.setSubject("-------标题-------");
	String text="";
	URL url=new URL("http://localhost:8080/email");
    InputStream is=	url.openStream();
	char[] c_arr=new char[1024];
	int l=0;
	Reader r=new InputStreamReader(is);
	while((l=r.read(c_arr))>0) {
	text+=new String(Arrays.copyOf(c_arr, l));
	}
	message.setContent(text ,"text/html;charset=UTF-8");
	//发送邮件
	t.sendMessage(message, message.getAllRecipients());
	//关闭传输者流
	t.close();
}

@RequestMapping("/gonghai")
public String gonghai() {
	return "gonghai";
}
@RequestMapping("/privatekehu")
public String privatekehu() {
	return "privatekehu";
}

@RequestMapping("/findAllPattern")
@ResponseBody
public List findAllPattern() {
  List list=test.findAllPattern();
  System.out.println(list);
   return list;
}



}
