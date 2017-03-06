package com.lin.service;

import com.lin.model.Message;
import com.lin.model.MessageV2.UpdateM;

public interface MessageServiceI {

	//通过ID查看用户具体信息
	public Message getMessageById(int  messageId);

	public boolean updateByPrimaryKeySelective(Message message);
	
}
