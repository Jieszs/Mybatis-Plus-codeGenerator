package com.jiesz.mybatis.plus.generator.config;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@EnableTransactionManagement
@Configuration
@MapperScan("com.jiesz.mybatis.plus.generator.mapper")
public class MybatisPlusConfig {

}

