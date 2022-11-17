package com.moudel.test;

import com.moudel.bean.Admin;
import com.moudel.bean.Types;
import com.moudel.bean.Users;
import com.moudel.service.impl.AdminServiceImpl;
import com.moudel.service.impl.TypesServiceImpl;
import com.moudel.service.impl.UserServiceImpl;
import com.moudel.utils.JdbcUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.junit.Test;

import javax.sql.DataSource;
import java.util.List;

public class MyTest {
    @Test
    public void JDBCUtilsTest() {
        try {
            DataSource dataSource = JdbcUtils.getDataSource();
            QueryRunner queryRunner = new QueryRunner(dataSource);
            String sql = "select * from admin";
            List<Admin> query = queryRunner.query(sql, new BeanListHandler<Admin>(Admin.class));
            System.out.println(query);
        } catch (Exception throwables) {
            throwables.printStackTrace();
        }
    }
    @Test
    public  void  adminServiceTest(){
        Admin admin = new AdminServiceImpl().adminLoginChek("root", "root");
        System.out.println(admin);
    }
    @Test
    public  void userRegisterServiceTest(){
        Users users = new Users(null, "asd", "sad", "daf5", "asd45", "asd", "asd", "sad", "daf5", "asd45", "asd", "asdas");
        boolean b = new UserServiceImpl().registerChek(users);
        System.out.println(b);
    }
    @Test
    public  void typesAddServiceTest(){
        boolean b = new TypesServiceImpl().addTypes(new Types(null,"dsfsdsdgjv"));
        System.out.println(b);
    }

    @Test
    public   void  typesUpdateServiceTest(){
        boolean b = new TypesServiceImpl().updataTypes(new Types(19, "水饺"));
        System.out.println(b);
    }
}
