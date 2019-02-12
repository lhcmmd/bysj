package com.nyist.bysj.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ProImg implements Serializable {
    private Integer id;
    private String product_img;
    private Product product;
    private String status;
}
