package com.lin.service.impl;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lin.dao.BlogMapper;
import com.lin.dao.MessageInfoMapper;
import com.lin.model.MessageInfo;
import com.lin.service.MessageInfoServiceI;
@Service("messageInfoService")
public class MessageInfoServiceimpl implements MessageInfoServiceI {

	@Resource
	private MessageInfoMapper messageInfoMapper;
	
	@Autowired
	public void setBlogMapper(MessageInfoMapper messageInfoMapper) {
		this.messageInfoMapper = messageInfoMapper;
	}
	
	
	@Override
	public boolean deleteInfoById(int id) {
		return messageInfoMapper.deleteByPrimaryKey(id);
	}


	@Override
	public boolean addInfo(MessageInfo messageInfo) {
		return messageInfoMapper.insertSelective(messageInfo);
	}

}
