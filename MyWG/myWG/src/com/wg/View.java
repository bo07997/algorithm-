package com.wg;

import java.awt.Button;
import java.awt.Frame;
import java.awt.Label;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.HashMap;
import java.util.Map;

import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;

import com.Action.HandAction;
import com.Action.JcbAction;
import com.Action.ReHandAction;
import com.Action.StartAction;

/*
 * 界面创建
 */
public class View {
	private ActionListener start_action1;
	private ActionListener start_action2;
	private Frame frame;
	
	public Frame getFrame() {
		return frame;
	}
	public void setFrame(Frame frame) {
		this.frame = frame;
	}

   public Frame createframe(){
	   JFrame frame=new JFrame();
	   frame.setSize(300, 200);
	 
	   //设置不可变
	   frame.setResizable(false);
	   //去掉布局
	   frame.setLayout(null);
	   /*
	    * 添加按钮
	    */
	   //开始
	   JButton start_button = new JButton("刷起");
	   start_button.setBounds(5,130,70,35);
	   frame.add(start_button);
	   //挂起
	   JButton hand_button = new JButton("挂起");
	   hand_button.setBounds(120,130,70,35);
	   frame.add(hand_button);
	 //恢复线程
	   JButton re_hand_button = new JButton("恢复");
	   re_hand_button.setBounds(220,130,70,35);
	   frame.add(re_hand_button);
	   /*
	    * 标题
	    */
	   JLabel choose_label =new JLabel("选择类型:");
	   choose_label.setBounds(20, 60, 70, 30);
	   frame.add(choose_label);
	   String str1[] = {"椒图","小黑" };  
	    JComboBox  jcb = new JComboBox(str1);  
	   jcb.setBounds(100, 60, 70, 30);
	   frame.add(jcb);
	   //设置可见
	   frame.setVisible(true);
	   //设置关闭
	   frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE); 
	   /*
	    * 以下是后台部分
	    */
	   /*
   	 * 椒图数据      
   	 */
     Map<Integer, Integer> mapColor1 = new HashMap<Integer, Integer>();
       mapColor1.put(-2175564, 1274);
       mapColor1.put(-2835566, 90);
       mapColor1.put(-2967152, 90);
       Map<Integer, Integer> mapColor2 = new HashMap<Integer, Integer>();
       mapColor2.put(-2175564, 1407);
       mapColor2.put(-2110030, 90);
       mapColor2.put(-2111326, 90);
       mapColor2.put(-2178151, 12);
       Map<Integer, Integer> mapColor3 = new HashMap<Integer, Integer>();
       mapColor3.put(-2175564, 1540);
       mapColor3.put(-2244202, 17);
       mapColor3.put(-2178407, 12);
       Map<Integer, Integer> mapColor4 = new HashMap<Integer, Integer>();
       mapColor4.put(-2175564, 1496);
       mapColor4.put(-2309739, 20);
       mapColor4.put(-2243946, 13);
       /*
        * 石巨数据
        * -2175564=1318, -2110029=91, -2835566=90, -2967152=90, 
        * -2175564=1447, -2110030=91, -2111326=90,-2178151=13,
        */
	   
	 /*  Map<Integer, Integer> mapColor1 = new HashMap<Integer, Integer>();
       mapColor1.put(-2175564, 1318);
       mapColor1.put(-2110029, 91);
       mapColor1.put(-2835566, 90);
       mapColor1.put(-2967152, 90);
       Map<Integer, Integer> mapColor2 = new HashMap<Integer, Integer>();
       mapColor2.put(-2175564, 1447);
       mapColor2.put(-2110030, 91);
       mapColor2.put(-2111326, 90);
       mapColor2.put(-2178151, 13);
       Map<Integer, Integer> mapColor3 = new HashMap<Integer, Integer>();
       mapColor3.put(-2175564, 1540);
       mapColor3.put(-2244202, 17);
       mapColor3.put(-2178407, 12);
       Map<Integer, Integer> mapColor4 = new HashMap<Integer, Integer>();
       mapColor4.put(-2175564, 1496);
       mapColor4.put(-2309739, 20);
       mapColor4.put(-2243946, 13);*/

   	/*
   	 * 鬼使黑数据      
   	 */
     Map<Integer, Integer> mapColor5 = new HashMap<Integer, Integer>();
       mapColor5.put(-2175564, 867);
      mapColor5.put(-2835566, 90);
      mapColor5.put(-2967152, 90);
       Map<Integer, Integer> mapColor6 = new HashMap<Integer, Integer>();
       mapColor6.put(-2175564, 990);
       mapColor6.put(-2110030, 90);
       mapColor6.put(-2111326, 90);
       Map<Integer, Integer> mapColor7 = new HashMap<Integer, Integer>();
       mapColor7.put(-2175564, 1126);
       mapColor7.put(-2109514, 17);
       mapColor7.put(-2109771, 16);
       Map<Integer, Integer> mapColor8 = new HashMap<Integer, Integer>();
       mapColor8.put(-2175564, 1091);
       mapColor8.put(-2109514, 16);
       mapColor8.put(-2109771, 16);
       /*
        * 绑定事件
        */
	 
	   //数据注入
	   WGdata data1 = new WGdata();
	   WGdata data2= new WGdata();
	   data1.setMapColor1(mapColor1);
		data1.setMapColor2(mapColor2);
		data1.setMapColor3(mapColor3);
		data1.setMapColor4(mapColor4);
		data2.setMapColor1(mapColor5);
		data2.setMapColor2(mapColor6);
		data2.setMapColor3(mapColor7);
		data2.setMapColor4(mapColor8);
	   //创建线程
	   YyWgTask task1 =new YyWgTask(data1); 
	   YyWgTask task2 =new YyWgTask(data2); 
		Thread t1 = new Thread(task1);
		Thread t2 = new Thread(task2);
		//创建事件
		 start_action1=new StartAction(t1);
		 start_action2=new StartAction(t2);
	   //挂起事件
		 ActionListener handAction1 =new HandAction(task1);
		 ActionListener handAction2 =new HandAction(task2);
/*
 * 默认绑定椒图事件 
 */
	//开始按钮
	start_button.addActionListener(start_action1);
	//挂起按钮
	hand_button.addActionListener(handAction1);
	

//文本选择事件
JcbAction jcbAction = new JcbAction(jcb,start_action1,start_action2,handAction1,handAction2,start_button,hand_button);
jcb.addItemListener(jcbAction);
	//hand_button.removeActionListener(handAction);
	//恢复线程事件
ReHandAction reHandAction = new ReHandAction(jcb, task1, task2);
re_hand_button.addActionListener(reHandAction);
	   return frame;
   }
}
