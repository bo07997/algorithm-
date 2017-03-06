package com.lin.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class testdate {

	public static void main(String[] args) {
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");//小写的mm表示的是分钟  
		String dstr="2008-4-24";  
		Date date = null;
		try {
			date = sdf.parse(dstr);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
		System.out.println(date);
	}
}
