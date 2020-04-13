package com.st.bean;

import java.util.List;

public class TreeBean {
private String per_id;
private String per_name;
private String id;
private String title;
private List<TreeBean> children;
public String getPer_id() {
	return per_id;
}
public void setPer_id(String per_id) {
	this.per_id = per_id;
}
public String getPer_name() {
	return per_name;
}
public void setPer_name(String per_name) {
	this.per_name = per_name;
}
public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public String getTitle() {
	return title;
}
public void setTitle(String title) {
	this.title = title;
}
public List<TreeBean> getChildren() {
	return children;
}
public void setChildren(List<TreeBean> children) {
	this.children = children;
}





}
