package com.st.action;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.st.bean.LayJson;
import com.st.service.IPerService;

@Controller
public class PerAction {
	/**
	 * Service
	 */
@Autowired
IPerService pertest;

@RequestMapping("/checkper")
@ResponseBody
public LayJson checkper(@RequestParam Map params) {
List list=pertest.checkper(params);
LayJson json=new LayJson(list);
return json;
}

@RequestMapping("/permission")
public String permission() {
	return "permission";
}

@RequestMapping("/insertper")
@ResponseBody
public void insertper(@RequestParam Map params) {
	pertest.insertper(params);
}

@RequestMapping("updateper")
@ResponseBody
public void updateper(@RequestParam Map params) {
    pertest.updateper(params);
}

@RequestMapping("/delper")
@ResponseBody
public void delper(@RequestParam Map params) {
	pertest.delper(params);
}
}
