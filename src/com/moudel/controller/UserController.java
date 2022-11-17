package com.moudel.controller;

import com.moudel.bean.Users;
import com.moudel.service.UserService;
import com.moudel.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/users/UserController")
public class UserController  extends HttpServlet {
    private UserService userService =   new UserServiceImpl();
    private   void  UserLogin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{

        String name = req.getParameter("name");
        String pwd = req.getParameter("pwd");
        Users users = userService.loginChek(name, pwd);
        if (users != null){
            req.getSession().setAttribute("users",users);
            req.getSession().setAttribute("WelComInfo","亲爱的"+users.getName()+"您好!&nbsp;&nbsp;欢迎光临!");
            resp.sendRedirect(req.getContextPath()+"/qiantai/index.jsp");
        }else {
            req.getSession().setAttribute("WelComInfo","用户名或密码错误~");
            req.getRequestDispatcher("/qiantai/login.jsp").forward(req,resp);
        }


    }
    private  void  loginOut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getSession().invalidate();
        resp.sendRedirect("/qiantai/login.jsp");
    }
    private  void  userRegister(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String pwd = req.getParameter("pwd");
        String realname = req.getParameter("realname");
        String sex = req.getParameter("sex");
        String age = req.getParameter("age");
        String card = req.getParameter("card");
        String address = req.getParameter("address");
        String phone = req.getParameter("phone");
        String email = req.getParameter("email");
        String code = req.getParameter("code");
        String type = req.getParameter("type");
        Users users = new Users(null, name, pwd, realname, sex, age, card, address, phone, email, code, type);
        boolean b = userService.registerChek(users);

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if ("login".equals(action)){
            this.UserLogin(req, resp);
        }else if ("loginOut".equals(action)){
            this.loginOut(req, resp);
        }else if ("register".equals(action)){
            this.userRegister(req, resp);
        }
    }
}
