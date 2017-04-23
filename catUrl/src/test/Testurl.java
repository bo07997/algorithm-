package test;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.ObjectOutput;
import java.io.ObjectOutputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
/*
 * 通过URL获取源码
 */
public  class Testurl {


	public String getSources(URL url,String code) throws IOException{
		// URL url1=new URL("http://www.ygdy8.com/html/dongman/hy/20150102/47033.html");
		if(url==null){
			return null;
		}
		    URLConnection uConnection =url.openConnection();
		    InputStream inputStream= uConnection.getInputStream();
		    String htm_str = InputStream2String(inputStream,code);
			return htm_str;
	}
	 public  String InputStream2String(InputStream in_st,String charset) throws IOException{
	        BufferedReader buff = new BufferedReader(new InputStreamReader(in_st, charset));
	        StringBuffer res = new StringBuffer();
	        String line = "";
	        while((line = buff.readLine()) != null){
	            res.append(line);
	        }
	        return res.toString();
	    }
}
