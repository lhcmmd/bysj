package com.nyist.bysj.mapper;

import com.nyist.bysj.entity.ProImg;
import com.nyist.bysj.entity.Product;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface ProMapper extends Mapper<Product> {
    //查参数
    public Product queryById(Integer id);
    //查封面图片
    public String queryCoverImg(Integer id);

    //详细图片
    public List<ProImg> queryDetailImg(Integer id);

    //后台分页查所有
    public List<Product> queryAllPro(@Param("start")int start,@Param("rows")int rows);
    //后台查总记录
    public int getCount();

    //后台分页查商品详情图
    public List<ProImg> queryAllProImg(@Param("start")int start,@Param("rows")int rows,@Param("pid")Integer pid);
    //后台查详情图数量
    public int getProImgCount(@Param("pid")Integer pid);

}
