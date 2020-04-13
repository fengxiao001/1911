package com.st.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;
@Repository
public interface TestDao {
 void addBM(Map params);
 List treeJson();
List checkuser(Map params);
void insertuser(Map params);
void updateuser(Map params);
void deluser(Map params);
//用户的查询
List chaxun(Map params);
//用户增加
void insertyonghu(Map params);
//用户修改
void updateyonghu(Map params);
//用户删除
void delyonghu(Map params);
//查询角色信息
List positionlist();
List findAllPattern();
}
