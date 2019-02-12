package com.nyist.bysj.controller;

import com.nyist.bysj.entity.CartItem;
import com.nyist.bysj.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("cart")
public class CartController {
    @Autowired
    CartService cartService;

    @RequestMapping("addCart")
    public String addCCart(HttpSession session,Integer userId,Integer proId){
        System.out.println(userId+"------"+proId);
        String loginFlag = (String) session.getAttribute("login");
        System.out.println(loginFlag);
        if ("ok".equals(loginFlag)){
            System.out.println("11111111111");
            cartService.addToCart(proId,userId);
            return "redirect:/cart.jsp?userid="+userId;
        } else{
            session.setAttribute("loginTo","toCart");
            session.setAttribute("proId",proId);
            return "redirect:/login.jsp";
        }

    }

    @RequestMapping("queryCart")
    @ResponseBody
    public List<CartItem> queryCart(Integer userid){
        System.out.println(cartService.queryCart(userid));
        return cartService.queryCart(userid);
    }
}
