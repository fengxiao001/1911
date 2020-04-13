package com.st.bean;

import java.util.List;

public class PositionBean {
	
	private String value;
	private String title;
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	@Override
	public String toString() {
		return "PositionBean [value=" + value + ", title=" + title + "]";
	}
}
