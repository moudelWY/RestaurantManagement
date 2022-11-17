package com.moudel.service.impl;

import com.moudel.bean.Admin;
import com.moudel.dao.AdminDao;
import com.moudel.dao.impl.AdminDaoImpl;
import com.moudel.service.AdminService;

public class AdminServiceImpl implements AdminService {
   AdminDao adminDao =   new AdminDaoImpl();
    @Override
    public Admin adminLoginChek(String name, String pwd) {
        Admin admin = adminDao.getAdminByName(name);
        return admin != null && admin.getPwd().equals(pwd)?admin:null;
    }
}
