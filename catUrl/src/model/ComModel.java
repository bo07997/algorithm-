package model;

import java.awt.Frame;

import javax.swing.JLabel;
import javax.swing.JRadioButton;
import javax.swing.JTextField;
/*
 * 需要频繁使用的组件
 */
public class ComModel {
private Frame frame;	
private	 JRadioButton jr1;
private	 JRadioButton jr11;
private	 JRadioButton jr12;
private	 JTextField jt11;
private	 JLabel jLabel11;
private	 JTextField jt12;
private	 JLabel jLabel12;
private	 JTextField jt13;
private	 JLabel jLabel121;


//无参构造函数
public ComModel() {
}
//有参构造函数
public ComModel(Frame frame,int y) {
	this.frame = frame;
	  //第一行
	   JRadioButton jr1= new JRadioButton();
	   jr1.setBounds(40,y+60,20,20);
	   frame.add(jr1);
	   this.jr1=jr1;
	   JRadioButton jr11= new JRadioButton();
	   jr11.setBounds(60,y+40,20,20);
	   frame.add(jr11);
	   this.jr11=jr11;
	   JRadioButton jr12= new JRadioButton();
	   jr12.setBounds(60,y+80,20,20);
	   frame.add(jr12);
	   this.jr12 = jr12;
	   JTextField jt11 = new JTextField();
	   jt11.setBounds(100, y+30, 50, 30);
	   frame.add(jt11);
	   this.jt11 = jt11;
	   JLabel jLabel11 = new JLabel("------------");
	   jLabel11.setBounds(160, y+30, 50, 30);
	   frame.add(jLabel11);
	   this.jLabel11 = jLabel11;
	   JTextField jt12 = new JTextField();
	   jt12.setBounds(220, y+30, 50, 30);
	   frame.add(jt12);
	   this.jt12 = jt12;
	   JLabel jLabel12 = new JLabel("    步长:");
	   jLabel12.setBounds(280, y+30, 50, 30);
	   frame.add(jLabel12);
	   this.jLabel12 = jLabel12;
	   JTextField jt13 = new JTextField("1");
	   jt13.setBounds(330, y+30, 50, 30);
	   frame.add(jt13);
	   this.jt13 = jt13;
	  //第二行
	   JLabel jLabel121 = new JLabel(" 模糊匹配");
	   jLabel121.setBounds(100, y+75, 80, 30);
	   frame.add(jLabel121);
	   this.jLabel121 = jLabel121;
}
public Frame getFrame() {
	return frame;
}

public void setFrame(Frame frame) {
	this.frame = frame;
}
public JRadioButton getJr1() {
	return jr1;
}
public void setJr1(JRadioButton jr1) {
	this.jr1 = jr1;
}
public JRadioButton getJr11() {
	return jr11;
}
public void setJr11(JRadioButton jr11) {
	this.jr11 = jr11;
}
public JRadioButton getJr12() {
	return jr12;
}
public void setJr12(JRadioButton jr12) {
	this.jr12 = jr12;
}
public JTextField getJt11() {
	return jt11;
}
public void setJt11(JTextField jt11) {
	this.jt11 = jt11;
}
public JLabel getjLabel11() {
	return jLabel11;
}
public void setjLabel11(JLabel jLabel11) {
	this.jLabel11 = jLabel11;
}
public JTextField getJt12() {
	return jt12;
}
public void setJt12(JTextField jt12) {
	this.jt12 = jt12;
}
public JLabel getjLabel12() {
	return jLabel12;
}
public void setjLabel12(JLabel jLabel12) {
	this.jLabel12 = jLabel12;
}
public JTextField getJt13() {
	return jt13;
}
public void setJt13(JTextField jt13) {
	this.jt13 = jt13;
}
public JLabel getjLabel121() {
	return jLabel121;
}
public void setjLabel121(JLabel jLabel121) {
	this.jLabel121 = jLabel121;
}

}
