package com.moudel.utils;

import com.alibaba.druid.pool.DruidDataSource;
import com.alibaba.druid.pool.DruidDataSourceFactory;

import javax.sql.DataSource;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;

public class JdbcUtils {
    //声明连接池对象
    private static DruidDataSource dataSource;
    private static ThreadLocal<Connection> tl = new ThreadLocal<Connection>();

    //获取连接池对象
    public static DataSource getDataSource(){
        return dataSource;
    }

    static {
        Properties properties = new Properties();
        try {
            InputStream is = JdbcUtils.class.getResourceAsStream("/database.properties");
            properties.load(is);
            //创建连接池
            dataSource = (DruidDataSource) DruidDataSourceFactory.createDataSource(properties);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //获取连接
    public static Connection getConnection() throws SQLException {
        Connection conn = tl.get();
        if(conn == null) {
            return dataSource.getConnection();
        }
        return conn;
    }
    //开启事务
    public static void beginTransaction() throws SQLException {
        Connection conn = tl.get();
        if(conn != null) {
            throw new SQLException("已经开启事务，不能重复开启");
        }
        conn = getConnection();
        conn.setAutoCommit(false);
        tl.set(conn);
    }
    //提交事务
    public static void commitTransaction() throws SQLException {
        Connection conn = tl.get();
        if(conn == null) {
            throw new SQLException("连接为空，不能提交事务");
        }
        conn.commit();
        conn.close();
        tl.remove();
    }
    //回滚事务
    public static void rollbackTransaction() throws SQLException {
        Connection conn = tl.get();
        if(conn == null) {
            throw new SQLException("连接为空，不能回滚事务");
        }
        conn.rollback();
        conn.close();
        tl.remove();
    }
}
