package com.nyist.bysj;

import com.github.tobato.fastdfs.FdfsClientConfig;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.EnableMBeanExport;
import org.springframework.context.annotation.Import;
import org.springframework.jmx.support.RegistrationPolicy;
import tk.mybatis.spring.annotation.MapperScan;

@MapperScan("com.nyist.bysj.mapper")
@SpringBootApplication
@Import(FdfsClientConfig.class)
// 解决jmx重复注册b ean的问题
@EnableMBeanExport(registration = RegistrationPolicy.IGNORE_EXISTING)
public class BysjApplication {

    public static void main(String[] args) {
        SpringApplication.run(BysjApplication.class, args);
    }

}

