package test;


import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JEditorPane;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JRadioButton;
import javax.swing.JTextField;

import action.CatAction;
import model.ComModel;

public class Test {

	public static void main(String[] args) {
		
			   JFrame frame=new JFrame();
			   frame.setSize(400, 450);
			 
			   //设置不可变
			   frame.setResizable(false);
			   //去掉布局
			   frame.setLayout(null);
			
			   /*
			    * 爬取URL
			    */
			   JLabel cat_label1 =new JLabel("爬取界面:");
			   cat_label1.setBounds(20, 20, 70, 30);
			   frame.add(cat_label1);
			   JTextField jt1 = new JTextField("http://www.hltm.tv/view/1018.html");
			   jt1.setBounds(100, 20, 250, 30);
			   frame.add(jt1);
			   /*
			    * 样例URL，（*）表示替换
			    */
			   JLabel cat_label2 =new JLabel("样例URL:");
			   cat_label2.setBounds(20, 60, 70, 30);
			   frame.add(cat_label2);
			   JTextField jt2 = new JTextField("ftp://hltm.cc@wt7.hltm.cc:(*)/[火影忍者][(*)][红旅首发www.hltm.cc][720P][旋风字幕组].mp4");
			   jt2.setBounds(100, 60, 250, 30);
			   frame.add(jt2);
			   /*
			    * 筛选条件，最多3个
			    */
			   //筛选条件1
			  ComModel comModel1=new ComModel(frame, 80);
			  ComModel comModel2=new ComModel(frame, 160);
			  ComModel comModel3=new ComModel(frame, 240);
			/*
			 * 编码
			 */
			  JLabel last_label3 =new JLabel("编码:");
			  last_label3.setBounds(50, 370, 50, 30);
			   frame.add(last_label3);
			   JTextField last_jt = new JTextField("UTF-8");
			   last_jt.setBounds(110, 370, 50, 30);
			   frame.add(last_jt);
			   /*
			    * 爬取按钮
			    */
			   JButton button = new JButton("开始爬取");
			   button.setBounds(240, 370, 120, 30);
			   frame.add(button);
			   ActionListener cActionListener =  new CatAction(comModel1,comModel2,comModel3
					   ,jt1,jt2,last_jt);
			   button.addActionListener(cActionListener);
			   //设置可见
			   frame.setVisible(true);
			   //设置关闭
			   frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE); 
	}

}
