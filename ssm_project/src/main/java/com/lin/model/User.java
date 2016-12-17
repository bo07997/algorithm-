package com.lin.model;

public class User {
    private int uId;

    private String name;

    private String username;

    private String password;

    private int messageid;

    public int getuId() {
        return uId;
    }

    public void setuId(int uId) {
        this.uId = uId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public int getMessageid() {
        return messageid;
    }

    public void setMessageid(int messageid) {
        this.messageid = messageid;
    }

	@Override
	public String toString() {
		return "User [uId=" + uId + ", name=" + name + ", username=" + username + ", password=" + password
				+ ", messageid=" + messageid + "]";
	}
    
}