package com.linkai;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.linkai.mapper")
public class LinkaiApplication {

    public static void main(String[] args) {
        SpringApplication.run(LinkaiApplication.class, args);
    }

}
