package com.lin.dao;

import com.lin.model.MessageInfo;

public interface MessageInfoMapper {
    boolean deleteByPrimaryKey(Integer infoid);

    int insert(MessageInfo record);

    boolean insertSelective(MessageInfo record);

    MessageInfo selectByPrimaryKey(Integer infoid);

    int updateByPrimaryKeySelective(MessageInfo record);

    int updateByPrimaryKey(MessageInfo record);
}