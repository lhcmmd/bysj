package com.nyist.bysj.service;

import com.nyist.bysj.entity.CartItem;
import com.nyist.bysj.entity.Product;
import com.nyist.bysj.mapper.ProMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.HashOperations;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.data.redis.core.RedisTemplate;

import java.util.*;

@Service("cartService")
@Transactional
public class CartServiceImpl implements CartService{
    @Autowired
    RedisTemplate redisTemplate;
    @Autowired
    ProMapper proMapper;
    @Override
    @Transactional(propagation = Propagation.REQUIRED,readOnly = true)
    public void addToCart(Integer pid, Integer userid) {

        System.out.println(pid+"test"+userid);
        HashOperations hashOps = redisTemplate.opsForHash();
        Map<String, CartItem> map = hashOps.entries(userid.toString());

        System.out.println(map);
        if(map.size()==0){
            System.out.println("testkong000");
            Product product = proMapper.queryById(pid);
            CartItem ct = new CartItem(1,product.getPrice(),product);
            hashOps.put(userid.toString(), pid.toString(), ct);
        }else{
            //CartItem ctt = map.get(pid.toString());
            if(map.containsKey(pid)){
                CartItem ct = map.get(pid);
                ct.setCount(ct.getCount() + 1);
                ct.setPrice(ct.getProduct().getPrice() * ct.getCount());
                hashOps.put(userid.toString(), pid, ct);
            }else{
                Product product = proMapper.queryById(pid);
                CartItem ct = new CartItem(1,product.getPrice(),product);
                //map.put(pid.toString(), ct);
                hashOps.put(userid.toString(), pid.toString(), ct);

                Map<String,CartItem> mapp =  new HashMap<String,CartItem>();
                //mapp = hashOps.entries(userid.toString());
            }


        }
    }


    @Override
    public List<CartItem> queryCart(Integer userid) {
        HashOperations hashOps = redisTemplate.opsForHash();
        Map<String,CartItem> map = hashOps.entries(userid.toString());
        Set<String> keys = map.keySet();
        List<CartItem> list = new ArrayList<CartItem>();
        for(String s:keys){
            CartItem c = map.get(s);
            list.add(c);
        }
        return list;
    }
}
