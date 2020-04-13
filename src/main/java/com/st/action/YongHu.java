package com.st.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.st.bean.LayJson;
import com.st.service.IYongHu;

@Controller
public class YongHu {
 @Autowired
 IYongHu test;
 
 
 @RequestMapping("/checkyonghu")
 @ResponseBody
 public LayJson checkyonghu(@RequestParam Map params) {
	List list= test.checkyonghu(params);
	LayJson json=new LayJson(list);
	return json;
 }

 @RequestMapping("/kehu")
 public String kehu() {
	 return "kehu";
 }
 
 
 @RequestMapping("/insertkehu")
 @ResponseBody
 public void insertkehu(@RequestParam  Map params) {
	 System.out.println(params);
	 test.insertkehu(params);
 }
 
 @RequestMapping("/updatekehu")
 @ResponseBody
 public void updatekehu(@RequestParam  Map params) {
	 test.updatekehu(params);
 }
 
 @RequestMapping("/delkehu")
 @ResponseBody
 public void delkehu(@RequestParam Map params) {
	 test.delkehu(params);
 }
 
 @RequestMapping("/checkbumen")
 @ResponseBody
 public LayJson checkbumen(@RequestParam Map params) {
	List list= test.checkbumen(params);
	LayJson json=new LayJson(list);
	return json;
 }
 
 @RequestMapping("/insertbumen")
 @ResponseBody
 public void insertbumen(@RequestParam Map params) {
    test.insertbumen(params);
 }
 
 @RequestMapping("/updatebumen")
 @ResponseBody
 public void updatebumen(@RequestParam Map params) {
	 test.updatebumen(params);
 }
 
 @RequestMapping("/delbumen")
 @ResponseBody
 public void delbumen(@RequestParam Map params) {
	 test.delbumen(params);
 }
 
 
 @RequestMapping("/findAll")
 @ResponseBody
 public List findAll() {
    List list=test.findAll();
    return list;
    
 }
 
 @RequestMapping("/updatepingji")
 @ResponseBody
 public void updatepingji(@RequestParam Map params) {
	 test.updatepingji(params);
 }
 
 @RequestMapping("/transfer/{faceid}")
 public String transfer(@PathVariable String faceid,HttpServletRequest  request) {
	 System.out.println(faceid);
	 request.setAttribute("faceid", faceid);
	 return "tranfer";
 }
 
 //用户分配角色存储
 @RequestMapping("/xxxUser")
 @ResponseBody
 public void xxxUser(@RequestParam Map params) {
	 test.xxxUser(params);
 }
 
 //公海客户查询
 @RequestMapping("/checkgonghai")
 @ResponseBody
 public LayJson checkgonghai(@RequestParam Map params) {
	 System.out.println(params);
	List list= test.checkgonghai(params);
	LayJson json=new LayJson(list);
	return json;
 }
 
 //私人客户查询
 @RequestMapping("/checkpri")
 @ResponseBody
 public LayJson checkpri() {
	 List list=test.checkpri();
	 LayJson json=new LayJson(list);
	 return json;
 }
 
 //跟单
 @RequestMapping("/updategendan")
 @ResponseBody
 public void updategendan(@RequestParam Map params) {
	 params.put("customer_public", 0);
	 System.out.println(params);
	 test.updategendan(params);
 }
 
}
