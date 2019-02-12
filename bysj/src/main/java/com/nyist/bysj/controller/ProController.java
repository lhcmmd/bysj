package com.nyist.bysj.controller;

import com.github.tobato.fastdfs.domain.proto.storage.DownloadByteArray;
import com.github.tobato.fastdfs.service.FastFileStorageClient;
import com.nyist.bysj.entity.ProImg;
import com.nyist.bysj.entity.Product;
import com.nyist.bysj.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("pro")
public class ProController {
    @Autowired
    ProductService productService;
    @Autowired
    FastFileStorageClient fastFileStorageClient;

    @RequestMapping("proDetail")
    @ResponseBody
    public Product proDetail(Integer id){
        System.out.println("-----------"+id);
        return productService.queryById(id);
    }

    @RequestMapping("proImg")
    @ResponseBody
    public void queryImg(Integer id,String imgUrl, HttpServletResponse response) throws IOException {
      //  imgUrl="/group2/M00/00/00/wKjCjlwmRIOAHOigAAAWm1IK5X0356.jpg";
        imgUrl = productService.queryCoverImg(id);
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

    @RequestMapping("detailImg")
    @ResponseBody
    //详细图片的地址
    public List<ProImg> queryDetailImg(Integer id){
        List<ProImg> list = productService.queryDetailImg(id);
        for (ProImg proImg : list) {
            System.out.println(proImg);
        }
        return productService.queryDetailImg(id);
    }

    //详细图片展示
    @RequestMapping("imgList")
    @ResponseBody
    public void imgList(String url, HttpServletResponse response) throws IOException {
        //  imgUrl="/group2/M00/00/00/wKjCjlwmRIOAHOigAAAWm1IK5X0356.jpg";
      //  imgUrl = productService.queryCoverImg(id);
        System.out.println(url+" ???????");
        String f[] = url.split("\\/");
        String group = f[1];
        String imgName = f[2]+"/"+f[3]+"/"+f[4]+"/"+f[5];
        byte[] bytes = fastFileStorageClient.downloadFile(group, imgName, new DownloadByteArray());
       /* FileOutputStream fileOutputStream = new FileOutputStream(new File("D:/img/5.png"));
        fileOutputStream.write(bytes);*/

        // 使用响应输出流，往client输出文件内容
        ServletOutputStream sos = response.getOutputStream();
        sos.write(bytes);
    }

    //后台查商品
    @RequestMapping("getPro")
    @ResponseBody
    public Map getPersonByName( int page, int rows){
        return productService.queryAllPro(page,rows);
    }
    //后台查商品图片
    @RequestMapping("getProImg")
    @ResponseBody
    public Map getProImg( int page, int rows,Integer pid){
        return productService.queryProImg(page,rows,pid);
    }

}
