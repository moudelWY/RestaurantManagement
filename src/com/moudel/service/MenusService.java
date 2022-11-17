package com.moudel.service;

import com.moudel.bean.Menus;
import com.moudel.bean.Page;

public interface MenusService {
    Page selectMenus(Page page);
    Integer menusAllCount();
    Integer menusAllPage(Integer perPageCount);
    boolean delMenus(Integer id);
    Menus selectMenusById(Integer id);
    boolean  updateMenus(Menus menus);
    boolean  chekMenusByNameIfExistence(Menus menus);//是否存在相同名字的不同菜品
    boolean  addMenus(Menus menus);
}
