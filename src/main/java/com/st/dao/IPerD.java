package com.st.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public interface IPerD {

	List checkper(Map params);

	void insertper(Map params);

	void updateper(Map params);

	void delper(Map params);

}
