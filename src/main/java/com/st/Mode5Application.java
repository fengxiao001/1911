package com.st;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@SpringBootApplication
@MapperScan(basePackages = "com.st.dao")
//开启事务
@EnableTransactionManagement
public class Mode5Application {
	public static void main(String[] args) {
		SpringApplication.run(Mode5Application.class, args);
	}
}
