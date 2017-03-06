package com.lin.dao;

import com.lin.model.ReadIp;

public interface ReadIpMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ReadIp record);

    int insertSelective(ReadIp record);

    ReadIp selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ReadIp record);

    int updateByPrimaryKey(ReadIp record);

	ReadIp selectByReadIp(ReadIp readIp);
}