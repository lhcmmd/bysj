package com.nyist.bysj.service;

import java.util.List;

public interface CartService {
    public void addToCart(Integer pid,Integer userid);

    public List queryCart(Integer userid);
}
