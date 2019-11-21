package com.crm;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.crm.dao")  //说明这个包下的接口都是mapper,其使用时生成的实现类可以拿去注入到service
public class Application {
	public static void main(String[] args) {
		SpringApplication.run(Application.class, args);
	}

	
}
