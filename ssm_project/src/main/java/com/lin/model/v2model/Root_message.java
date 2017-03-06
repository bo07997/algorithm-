package com.lin.model.v2model;

import com.lin.model.User;

public class Root_message {

private User user;
private String job;
private String contact;
public User getUser() {
	return user;
}
public void setUser(User user) {
	this.user = user;
}
public String getJob() {
	return job;
}
public void setJob(String job) {
	this.job = job;
}
public String getContact() {
	return contact;
}
public void setContact(String contact) {
	this.contact = contact;
}
public String getName() {
	return this.user.getName();
}
public void setName(String name) {
	this.user.setName(name); 
}
public String getPassword() {
	return this.user.getPassword();
}
public void setPassword(String password) {
	this.user.setPassword(password);
}


}
