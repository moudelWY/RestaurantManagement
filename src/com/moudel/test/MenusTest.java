package com.moudel.test;

import com.moudel.bean.Menus;
import com.moudel.bean.Page;
import com.moudel.dao.impl.MenusDaoImpl;
import com.moudel.service.impl.MenuServiceImpl;
import com.moudel.utils.PageUtil;
import org.junit.Test;

public class MenusTest {
 @Test
    public void  menusDaoSelectMenusTest(){
        MenusDaoImpl menusDao = new MenusDaoImpl();
     Page page = PageUtil.createPage(3, 3, 1);
     //List<MenusVO> menusVOS = menusDao.selectMenus(page);
     //   menusVOS.stream().forEach(System.out::println);
    }

    @Test
    public  void menusCheServiceTest(){
        MenuServiceImpl menuService = new MenuServiceImpl();
        Menus menus = new Menus();
        menus.setId(35);
        menus.setName("test~~");
        boolean b = menuService.updateMenus(menus);
        System.out.println(b);
    }

    @Test
    public  void  menusIfAbsentChekOfService(){
        MenuServiceImpl menuService = new MenuServiceImpl();
        Menus menus = new Menus();
        menus.setId(15);
        menus.setName("五香11驴肉");
        boolean b = menuService.chekMenusByNameIfExistence(menus);
        System.out.println(b);
    }
}
