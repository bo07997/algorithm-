package com.lin.model;

public class UpIp {
    private Integer upId;

    private Integer bId;

    private String ip;

    private Integer up_down;
    public Integer getUpId() {
        return upId;
    }

    public void setUpId(Integer upId) {
        this.upId = upId;
    }

    public Integer getbId() {
        return bId;
    }

    public void setbId(Integer bId) {
        this.bId = bId;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip == null ? null : ip.trim();
    }

	public Integer getUp_down() {
		return up_down;
	}

	public void setUp_down(Integer up_down) {
		this.up_down = up_down;
	}
    
}