package action;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.swing.JLabel;
import javax.swing.JTextField;

import org.omg.CORBA.Request;

import model.ComModel;
import test.Test;
import test.TestStr;
import test.Testurl;
/*
 * ������
 */
public class CatAction implements ActionListener{
private  JTextField jt1;
private  JTextField jt2;
private ComModel comModel1;
private ComModel comModel2;
private ComModel comModel3;
private JTextField last_jt;
public CatAction(ComModel comModel1, ComModel comModel2, ComModel comModel3,
		 JTextField jt1, JTextField jt2,JTextField last_jt) {
	this.comModel1 = comModel1;
	this.comModel2 = comModel2;
	this.comModel3 = comModel3;
	this.jt1 = jt1;
	this.jt2 = jt2;
	this.last_jt = last_jt;
}
@Override
public void actionPerformed(ActionEvent e) {
	int location1=-1,location2=-1,location3=-1;
	//�������
	 StringBuffer result=new StringBuffer();
	//������ƥ��ת��Ϊ�ɱ��ַ���
	StringBuffer jBuffer2 = new StringBuffer(jt2.getText());
	/*
	 * ��ȡ����
	 */
	URL url =null;
	try {
		 url =new URL(jt1.getText());
	} catch (MalformedURLException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
	Testurl testurl = new Testurl();
	String str_html ="";
	try {
		 str_html = testurl.getSources(url,last_jt.getText());
	} catch (IOException e1) {
		e1.printStackTrace();
	}
	/*
	 * ƥ�䣬������������±�
	 */
	StringBuffer stringBuffer3=new StringBuffer(jBuffer2);
	  
		  for(int j=0;j<stringBuffer3.length();j++){
			  //����[] {}
			  if(stringBuffer3.charAt(j)=='['||stringBuffer3.charAt(j)==']'
					  ||stringBuffer3.charAt(j)=='{'||stringBuffer3.charAt(j)=='}'){
				  //�����
				  stringBuffer3.replace(j, j+1, ".");
				  //Դ�������
				  jBuffer2.replace(j, j+1, ".");
			  }
			  //�ҵ�Ŀ��
			  if(stringBuffer3.charAt(j)=='('){
				  //��֤����
				  if((stringBuffer3.length()>j+2)){
					  //��֤�Ƿ�ȫ������
					  if(stringBuffer3.charAt(j+1)=='*'&&stringBuffer3.charAt(j+2)==')'){
					       //�滻
						  stringBuffer3.replace(j, j+3, ".*?");
						  //����λ�ü�¼
						  if(location1==-1){
							  location1=j;
						  }
						  else if(location2==-1) {
							  location2=j;
						}
						  else{
							  location3 = j;
						  }
					  }
				  }
			  }
		  }
	  
	//1.ȫ��ģ��ƥ��
  if(((comModel1.getJr1().isSelected()&&!comModel1.getJr11().isSelected())||(!comModel1.getJr1().isSelected()))
		  &&
		  ((comModel2.getJr1().isSelected()&&!comModel2.getJr11().isSelected())||(!comModel2.getJr1().isSelected()))
		  &&
		  ((comModel3.getJr1().isSelected()&&!comModel3.getJr11().isSelected())||(!comModel3.getJr1().isSelected()))
		  ){
	result= TestStr.findAndout(str_html, stringBuffer3.toString(),"",0);
	   InputStream is = new ByteArrayInputStream(result.toString().getBytes());
	    try {
	    	TestStr.printTest(is);
		} catch (IOException e1) {
			e1.printStackTrace();
		}
  }
  //�е���ƥ��
  else{
	  //�ж��Ƿ�׼ƥ��
	  boolean judge1=comModel1.getJr1().isSelected()&&comModel1.getJr11().isSelected();
	  boolean judge2=comModel2.getJr1().isSelected()&&comModel2.getJr11().isSelected();
	  boolean judge3=comModel3.getJr1().isSelected()&&comModel3.getJr11().isSelected();
	  int start=0,end=0,hop=1;
	  //��ʼ��
	  int a=0;int b=0; int c=0;
	  if(judge1==true){
		  start = Integer.parseInt(comModel1.getJt11().getText());
		  end = Integer.parseInt(comModel1.getJt12().getText());
		  hop = Integer.parseInt(comModel1.getJt13().getText());
		  a=Integer.parseInt(comModel1.getJt11().getText());
	  }
	  else if (judge2==true) {
		  start = Integer.parseInt(comModel2.getJt11().getText());
		  end = Integer.parseInt(comModel2.getJt12().getText());
		  hop = Integer.parseInt(comModel2.getJt13().getText());
		  b=Integer.parseInt(comModel2.getJt11().getText());
	}
	  else{
		  start = Integer.parseInt(comModel3.getJt11().getText());
		  end = Integer.parseInt(comModel3.getJt12().getText());
		  hop = Integer.parseInt(comModel3.getJt13().getText());
		  c=Integer.parseInt(comModel3.getJt11().getText());
	  }
	 
	  for(;start<=end;start+=hop){
		  StringBuffer tBuffer=new StringBuffer(jBuffer2);
		  if(location1!=-1){
			  if(judge1==true){
				  tBuffer.replace(location1, location1+3, String.valueOf(a));
				  a+=Integer.parseInt(comModel1.getJt13().getText());
			  }
			  else{
				  tBuffer.replace(location1,location1+3, ".*?");
			  }
		  }
		  if(location2!=-1){
			  if(judge2==true){
				  tBuffer.replace(location2, location2+3, String.valueOf(b));
				  b+=Integer.parseInt(comModel2.getJt13().getText());
			  }
			  else{
				  tBuffer.replace(location2,location2+3, ".*?");
			  }
		  }
		  if(location3!=-1){
			  if(judge3==true){
				  tBuffer.replace(location3, location3+3, String.valueOf(c));
				  c+=Integer.parseInt(comModel3.getJt13().getText());
			  }
			  else{
				  tBuffer.replace(location3,location3+3, ".*?");
			  }
		  }
		  //��ȡ��תƥ�����
		  StringBuffer re_tBuffer = new StringBuffer();
		  for(int i=tBuffer.length()-1;i>=0;){
			  //�ж��Ƿ�ģ��ƥ��
			  if(i>=2){
			  if(tBuffer.charAt(i)=='?'&&tBuffer.charAt(i-1)=='*'&&tBuffer.charAt(i-2)=='.'){
				  re_tBuffer.append(".*?");
				  i-=3;
				  
			  }
			 
			  }
			  re_tBuffer.append(tBuffer.charAt(i));
			  i--;
		  }
		  //ƥ��
		  StringBuffer temp= TestStr.findAndout(str_html, tBuffer.toString(),re_tBuffer.toString(),1);
		  
		  if(temp.toString()!=null&&!"".equals(temp.toString().trim())){
		 result.append(temp.toString());
		  }
	  }
	  InputStream is = new ByteArrayInputStream(result.toString().getBytes());
	    try {
	    	TestStr.printTest(is);
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	  
  }
  
}

}
