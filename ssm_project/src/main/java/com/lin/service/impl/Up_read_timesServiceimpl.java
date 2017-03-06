package com.lin.service.impl;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lin.dao.ReadIpMapper;
import com.lin.dao.UpIpMapper;
import com.lin.model.ReadIp;
import com.lin.model.UpIp;
import com.lin.service.Up_read_timesServicesI;
@Service("up_read_timesService")
public class Up_read_timesServiceimpl implements Up_read_timesServicesI {
	@Resource
	private UpIpMapper upIpMapper;

	@Resource
	private ReadIpMapper readIpMapper;
	
	@Autowired
	public void setUpIpMapper(UpIpMapper upIpMapper) {
		this.upIpMapper = upIpMapper;
	}
	@Autowired
	public void setReadIpMapper(ReadIpMapper readIpMapper) {
		this.readIpMapper = readIpMapper;
	}

	@Override
	public String getRemoteHost(HttpServletRequest request) {
		  String ip = request.getHeader("x-forwarded-for");
		    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)){
		        ip = request.getHeader("Proxy-Client-IP");
		    }
		    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)){
		        ip = request.getHeader("WL-Proxy-Client-IP");
		    }
		    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)){
		        ip = request.getRemoteAddr();
		    }
		    return ip.equals("0:0:0:0:0:0:0:1")?"127.0.0.1":ip;
	}

	@Override
	public UpIp getcountByUpIp(UpIp upIp) {
		return upIpMapper.selectcountByUpIp(upIp);
	}

	@Override
	public void addUpIp(UpIp upIp) {
      upIpMapper.insertSelective(upIp);		
	}

	@Override
	public void updateUpIp(UpIp result) {

		upIpMapper.updateByPrimaryKeySelective(result);
	}

	@Override
	public ReadIp getcountByReadIp(ReadIp readIp) {
		return readIpMapper.selectByReadIp(readIp);
	}
	@Override
	public void addReadIp(ReadIp readIp) {

		readIpMapper.insertSelective(readIp);
	}
	
}
