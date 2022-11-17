package com.moudel.service;

import com.moudel.bean.Types;

import java.util.List;

public interface TypesService {
    List<Types> getAllTypes();
    boolean addTypes(Types types);
    boolean delTypes(Integer id);
    Types selectById(Integer id);
    boolean  updataTypes(Types types);
}
