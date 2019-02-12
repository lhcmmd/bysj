package com.nyist.bysj.controller;

import com.github.tobato.fastdfs.domain.fdfs.StorePath;
import com.github.tobato.fastdfs.domain.proto.storage.DownloadByteArray;
import com.github.tobato.fastdfs.service.FastFileStorageClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@Controller
@RequestMapping("file")
public class FileController {
    @Autowired
    FastFileStorageClient fastFileStorageClient;


    @RequestMapping("fileUp")
    @ResponseBody
    public void fileUp( MultipartFile hfile) throws Exception{
        String oldName = hfile.getOriginalFilename();
        System.out.println("老名字-----"+oldName);
        String subName = hfile.getOriginalFilename().split("\\.")[1];
        System.out.println(subName+"(---subname)");
        StorePath path = fastFileStorageClient.uploadFile(hfile.getInputStream(), hfile.getSize(), subName,null);
        System.out.println("--------"+path);
    }

    @RequestMapping("queryImg")
    @ResponseBody
    public void queryImg(String imgUrl, HttpServletResponse response) throws IOException {
       imgUrl="/group2/M00/00/00/wKjCjlwmRIOAHOigAAAWm1IK5X0356.jpg";
        System.out.println(imgUrl+" ???????");
        String f[] = imgUrl.split("\\/");
        String group = f[1];
        String imgName = f[2]+"/"+f[3]+"/"+f[4]+"/"+f[5];
        byte[] bytes = fastFileStorageClient.downloadFile(group, imgName, new DownloadByteArray());
       /* FileOutputStream fileOutputStream = new FileOutputStream(new File("D:/img/5.png"));
        fileOutputStream.write(bytes);*/

        // 使用响应输出流，往client输出文件内容
        ServletOutputStream sos = response.getOutputStream();
        sos.write(bytes);

    }
}
