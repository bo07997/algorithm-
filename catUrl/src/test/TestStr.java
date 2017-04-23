package test;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
/*
 * 正则匹配规则验证
 */
public class TestStr {

	public static StringBuffer findAndout(String sources,String regEx,String re_regEx,int tag) {
		//翻转前
		StringBuffer string =new StringBuffer();
		//翻转后匹配
		StringBuffer result = new StringBuffer();
		
	    
	    // 编译正则表达式
	    Pattern pattern = Pattern.compile(regEx);
	    // 忽略大小写的写法
	    // Pattern pat = Pattern.compile(regEx, Pattern.CASE_INSENSITIVE);
	    Matcher matcher = pattern.matcher(sources);
	    // 查找字符串中是否有匹配正则表达式的字符/字符串
	    
	    while(matcher.find()){
	    	 
	    	string.append(matcher.group(0));
	    	if(tag==1){
	    		//翻转匹配
	    		 // 编译正则表达式
	    	    Pattern pattern2 = Pattern.compile(re_regEx);
	    	    // 忽略大小写的写法
	    	    // Pattern pat = Pattern.compile(regEx, Pattern.CASE_INSENSITIVE);
	    	    //将匹配到的字符翻转
	    	    StringBuffer re_buffer =new StringBuffer();
	    	    for(int i=string.length()-1;i>=0;i--){
	    	    	re_buffer.append(string.charAt(i));
	    	    }
	    	    Matcher matcher2 = pattern2.matcher(re_buffer);
	    	    if(matcher2.find()){
	    	    	String temp=matcher2.group();
	    	    	for(int i=temp.length()-1;i>=0;i--){
	    	    	result.append(temp.charAt(i));
	    	    	}
	    	    }
	    	    result.append("\n");
	    		break;
	    	}
	    	
	    }
	    return result;
	 
	}
	   public static void printTest(InputStream string) throws IOException
	    {
	        BufferedReader bufr = 
	            new BufferedReader(new InputStreamReader(string));
	        PrintWriter out = new PrintWriter(new FileWriter("CatResult.txt"),true);
	        String line = null;
	        while((line=bufr.readLine())!=null)
	        {
	            if("over".equals(line))
	                break;
	            out.println(line);
	            //out.flush();
	        }
	        out.close();
	        bufr.close();
	    }   
}
