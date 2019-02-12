package com.nyist.bysj.service;

import com.nyist.bysj.entity.ProImg;
import com.nyist.bysj.entity.Product;
import com.nyist.bysj.mapper.ProMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("productService")
@Transactional
public class ProductServiceImpl implements ProductService {
    @Autowired
    ProMapper proMapper;

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public Product queryById(Integer id) {
        Product product = proMapper.queryById(id);
        if (product==null){
            System.out.println("kong-------");

        }else {
            System.out.println(product);
        }
        return product;
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public String queryCoverImg(Integer id) {
        return proMapper.queryCoverImg(id);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<ProImg> queryDetailImg(Integer id) {
        return proMapper.queryDetailImg(id);
    }

    @Override
    public Map queryAllPro(int page, int rows) {
        int start=(page-1)*rows;
        List<Product> list = proMapper.queryAllPro(start, rows);
        if(list==null){System.out.println("fenye空");}
        else{for(Product p:list){System.out.println("fenye"+p);}}
        int total = proMapper.getCount();
        Map map = new HashMap();
        map.put("total", total);
        map.put("rows", list);
        return map;
    }

    @Override
    public Map queryProImg(int page, int rows, Integer pid) {
        int start=(page-1)*rows;
        List<ProImg> list = proMapper.queryAllProImg(start,rows,pid);
        if(list==null){System.out.println("fenye空");}
        else{for(ProImg p:list){System.out.println("fenye"+p);}}
        int total = proMapper.getProImgCount(pid);
        Map map = new HashMap();
        map.put("total", total);
        map.put("rows", list);
        return map;
    }


}
