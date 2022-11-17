package com.moudel.controller;

import com.moudel.bean.Admin;
import com.moudel.service.AdminService;
import com.moudel.service.impl.AdminServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/admin/AdminController")
public class AdminController extends HttpServlet {
    private AdminService adminService = new AdminServiceImpl();

    private void login(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("userName");
        String password = req.getParameter("password");
        Admin admin = adminService.adminLoginChek(username, password);
        //  System.out.println(username+"=========="+password+"========"+admin);
        if (admin != null) {
            req.getSession().setAttribute("admin", admin);
            resp.sendRedirect(req.getContextPath()+"/admin/main.jsp");
        } else {
            req.getSession().setAttribute("err", "用户名或密码错误~");
            req.getRequestDispatcher("/admin/login.jsp").forward(req, resp);
        }

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("doget............");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if ("login".equals(action)) {
            this.login(req, resp);
        }
    }
}
