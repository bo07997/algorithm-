package com.lin.service;

import com.lin.model.ReadIp;
import com.lin.model.UpIp;
/*
 * 2表合一
 */
public interface Up_read_timesServicesI {
	/*
	 * 以下是up_ip表
	 */
	//获取request的IP地址
	public String getRemoteHost(javax.servlet.http.HttpServletRequest request);
   //查询是否重复IP
	public UpIp getcountByUpIp(UpIp upIp);
	//添加记录
	public void addUpIp(UpIp upIp);
	//更新IP记录
	public void updateUpIp(UpIp result);
	/*
	 * 以下是read_ip表
	 */
	//查询是否重复IP
	public ReadIp getcountByReadIp(ReadIp readIp);
	//添加阅读人次的IP记录
	public void addReadIp(ReadIp readIp);
}
