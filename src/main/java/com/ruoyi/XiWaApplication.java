package com.ruoyi;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

/**
 * 启动程序
 * 
 * @author ljh
 */
@SpringBootApplication(exclude = { DataSourceAutoConfiguration.class })
@MapperScan("com.ruoyi.project.*.*.mapper")
public class XiWaApplication {

    public static void main(String[] args){
        SpringApplication.run(XiWaApplication.class, args);
        System.out.println("(♥◠‿◠)ﾉﾞ  喜娃启动成功   ლ(´ڡ`ლ)ﾞ");
    }

}