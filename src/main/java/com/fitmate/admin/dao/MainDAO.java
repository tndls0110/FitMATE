package com.fitmate.admin.dao;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MainDAO {

    // layout
    String getname(String admin_id);

}
