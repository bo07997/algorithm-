package com.lin.service.impl;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lin.dao.MessageMapper;
import com.lin.model.Message;
import com.lin.model.MessageV2.UpdateM;
import com.lin.service.MessageServiceI;
@Service("messageService")
public class MessageServiceimpl implements MessageServiceI {

	@Resource
	private MessageMapper messageMapper;
	
	
	@Autowired
	public void setMessageMapper(MessageMapper messageMapper) {
		this.messageMapper = messageMapper;
	}



	@Override
	public Message getMessageById(int messageId) {
		return messageMapper.selectByPrimaryKey(messageId);
	}



	@Override
	public boolean updateByPrimaryKeySelective(Message message) {
		return messageMapper.updateByPrimaryKeySelective(message);
	}

}
