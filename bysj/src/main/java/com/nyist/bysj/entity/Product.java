package com.nyist.bysj.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Product implements Serializable {
    private Integer id;
    private String name;
    private Double price;
    private String cover_img;
    private Date pub_date;
    private Integer sale_num;
    private Integer left_num;
    private Integer recommand;
    private String brand;
    private String agent_shop;
    private Double ckprice;
}
