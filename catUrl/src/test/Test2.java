package test;

import java.util.regex.Matcher;
import java.util.regex.Pattern;
/*
 * ≤‚ ‘”√
 */
public class Test2 {

	public static void main(String[] args) {
	/*	Pattern p = Pattern.compile("1.*?foo(.*?)x");  
		//Matcher m = p.matcher("xfooxxxxxxfoo");  
		Matcher m = p.matcher("111111xfoo2xfoo2xxxxxxfoo11");  
		while (m.find()) {  
		    System.out.println(m.group(0) + "\t");  
		}  */
		Pattern p = Pattern.compile("x(.*?)oof(.*?)1");  
		//Matcher m = p.matcher("xfooxxxxxxfoo");  
		Matcher m = p.matcher("x2oofx111111");  
		while (m.find()) {  
		    System.out.println(m.group(0) + "\t");  
		}  
	}

}
