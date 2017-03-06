package com.lin.service;

import com.lin.model.MessageInfo;

public interface MessageInfoServiceI {

	public boolean deleteInfoById(int id);

	public boolean addInfo(MessageInfo messageInfo);
}
