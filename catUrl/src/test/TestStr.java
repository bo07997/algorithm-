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
 * ����ƥ�������֤
 */
public class TestStr {

	public static StringBuffer findAndout(String sources,String regEx,String re_regEx,int tag) {
		//��תǰ
		StringBuffer string =new StringBuffer();
		//��ת��ƥ��
		StringBuffer result = new StringBuffer();
		
	    
	    // ����������ʽ
	    Pattern pattern = Pattern.compile(regEx);
	    // ���Դ�Сд��д��
	    // Pattern pat = Pattern.compile(regEx, Pattern.CASE_INSENSITIVE);
	    Matcher matcher = pattern.matcher(sources);
	    // �����ַ������Ƿ���ƥ��������ʽ���ַ�/�ַ���
	    
	    while(matcher.find()){
	    	 
	    	string.append(matcher.group(0));
	    	if(tag==1){
	    		//��תƥ��
	    		 // ����������ʽ
	    	    Pattern pattern2 = Pattern.compile(re_regEx);
	    	    // ���Դ�Сд��д��
	    	    // Pattern pat = Pattern.compile(regEx, Pattern.CASE_INSENSITIVE);
	    	    //��ƥ�䵽���ַ���ת
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
