package com.moudel.dao.impl;

import com.moudel.bean.Admin;
import com.moudel.dao.AdminDao;
import com.moudel.utils.JdbcUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import java.sql.SQLException;

public class AdminDaoImpl implements AdminDao {

    @Override
    public Admin getAdminByName(String name) {
        QueryRunner queryRunner = new QueryRunner(JdbcUtils.getDataSource());
        String sql = "select * from admin where name = ?";
        Object[] params = new Object[]{name};
        Admin query = null;
        try {
            query = queryRunner.query(sql, new BeanHandler<Admin>(Admin.class),params);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return query;
    }
}
