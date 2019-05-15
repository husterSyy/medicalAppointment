package com;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.transaction.annotation.EnableTransactionManagement;


@EnableTransactionManagement
@MapperScan(basePackages="com.dao")
@SpringBootApplication//(scanBasePackages = {"com.org.n3r.idworker","com.dao"})
public class ssmspringboot {
     public static void main(String[] args){
    	  SpringApplication.run(ssmspringboot.class,args);
      }
}
