package com.nyist.bysj.service;

import com.nyist.bysj.entity.ProImg;
import com.nyist.bysj.entity.Product;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface ProductService {
    public Product queryById(Integer id);

    //查封面图片
    public String queryCoverImg(Integer id);

    //前台查看详细图片
    public List<ProImg> queryDetailImg(Integer id);
    //后台查看商品
    public Map queryAllPro(int page, int rows);

    //后台查商品详情图（分页）
    public Map queryProImg(int page, int rows,Integer pid);
    //

}
