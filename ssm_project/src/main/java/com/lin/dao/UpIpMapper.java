package com.lin.dao;

import org.springframework.stereotype.Repository;

import com.lin.model.UpIp;

@Repository 
public interface UpIpMapper {
    int deleteByPrimaryKey(Integer upId);

	UpIp selectcountByUpIp(UpIp upIp);

	void insertSelective(UpIp upIp);

	void updateByPrimaryKeySelective(UpIp result);

  
}