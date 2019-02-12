package com.nyist.bysj.controller;

import com.nyist.bysj.entity.User;
import com.nyist.bysj.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
@RequestMapping("user")
public class UserController {
    @Autowired
    UserService userServicce;

    @RequestMapping("/userLogin.do")
    //@ResponseBody
    public String login(String username, String password, HttpSession session, HttpServletResponse resp){
        String loginTo = (String) session.getAttribute("loginTo");
        if("toCart".equals(loginTo)){
            User user = userServicce.login(username,password);
            if (user.getPassword().equals(password) && user.getUsername().equals(username)){
                session.setAttribute("login","ok");
                session.setAttribute("userId",user.getId());
            }
           /* try {
                resp.sendRedirect("cart.jsp");
            } catch (IOException e) {
                e.printStackTrace();
            }*/
            return "redirect:/product-detail.jsp?id="+session.getAttribute("proId");
        }
        return null;
    }


}
