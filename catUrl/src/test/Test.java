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
			 
			   //���ò��ɱ�
			   frame.setResizable(false);
			   //ȥ������
			   frame.setLayout(null);
			
			   /*
			    * ��ȡURL
			    */
			   JLabel cat_label1 =new JLabel("��ȡ����:");
			   cat_label1.setBounds(20, 20, 70, 30);
			   frame.add(cat_label1);
			   JTextField jt1 = new JTextField("http://www.hltm.tv/view/1018.html");
			   jt1.setBounds(100, 20, 250, 30);
			   frame.add(jt1);
			   /*
			    * ����URL����*����ʾ�滻
			    */
			   JLabel cat_label2 =new JLabel("����URL:");
			   cat_label2.setBounds(20, 60, 70, 30);
			   frame.add(cat_label2);
			   JTextField jt2 = new JTextField("ftp://hltm.cc@wt7.hltm.cc:(*)/[��Ӱ����][(*)][�����׷�www.hltm.cc][720P][������Ļ��].mp4");
			   jt2.setBounds(100, 60, 250, 30);
			   frame.add(jt2);
			   /*
			    * ɸѡ���������3��
			    */
			   //ɸѡ����1
			  ComModel comModel1=new ComModel(frame, 80);
			  ComModel comModel2=new ComModel(frame, 160);
			  ComModel comModel3=new ComModel(frame, 240);
			/*
			 * ����
			 */
			  JLabel last_label3 =new JLabel("����:");
			  last_label3.setBounds(50, 370, 50, 30);
			   frame.add(last_label3);
			   JTextField last_jt = new JTextField("UTF-8");
			   last_jt.setBounds(110, 370, 50, 30);
			   frame.add(last_jt);
			   /*
			    * ��ȡ��ť
			    */
			   JButton button = new JButton("��ʼ��ȡ");
			   button.setBounds(240, 370, 120, 30);
			   frame.add(button);
			   ActionListener cActionListener =  new CatAction(comModel1,comModel2,comModel3
					   ,jt1,jt2,last_jt);
			   button.addActionListener(cActionListener);
			   //���ÿɼ�
			   frame.setVisible(true);
			   //���ùر�
			   frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE); 
	}

}
