package com.st.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;
@Repository
public interface YongHuD {
	List checkyonghu(Map params);

	void insertkehu(Map params);

	void updatekehu(Map params);

	void delkehu(Map params);

	List checkbumen(Map params);

	void insertbumen(Map params);

	void updatebumen(Map params);

	void delbumen(Map params);

	List findAll();

	void updatepingji(Map params);

	void xxxUser(Map params);

	void delUser_role(Map params);

	List checkgonghai(Map params);

	List checkpri();

	void updategendan(Map params);


}
