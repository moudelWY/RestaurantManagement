package com.moudel.dao;

import com.moudel.bean.Types;

import java.util.List;

public interface TypesDao {
    List<Types> getAllTypes();
    int addTypes(Types types);
    Types selectByName(String name );
    Types selectById(Integer id);
    int  updataTypes(Types types);
    int delTypes(Integer id);

}
