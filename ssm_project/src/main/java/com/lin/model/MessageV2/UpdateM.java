package com.lin.model.MessageV2;

import com.lin.model.Message;

public class UpdateM {

   private	Message message;
   private String username;
   private String birthday_str;
public Message getMessage() {
	return message;
}
public void setMessage(Message message) {
	this.message = message;
}
public String getUsername() {
	return username;
}
public void setUsername(String username) {
	this.username = username;
}

public String getBirthday_str() {
	return birthday_str;
}
public void setBirthday_str(String birthday_str) {
	this.birthday_str = birthday_str;
}
@Override
public String toString() {
	return "UpdateM [message=" + message + ", username=" + username + ", birthday_str=" + birthday_str + "]";
}

   
   
}
