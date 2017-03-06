package com.Action;

import java.awt.Frame;
import java.awt.event.ActionListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;

import javax.swing.JButton;
import javax.swing.JComboBox;
/*
 * 改变标签事件 小黑OR椒图
 */
public class JcbAction implements ItemListener{
private JComboBox  jb;
//2个事件
private ActionListener start_action1;
private ActionListener start_action2;
//2个事件
private ActionListener hand_action1;
private ActionListener hand_action2;
//2个按钮
private JButton start_button ;
private JButton hand_button;

	public JcbAction(JComboBox jb, ActionListener start_action1, ActionListener start_action2, 
			ActionListener hand_action1,ActionListener hand_action2,
		JButton start_button, JButton hand_button) {
	super();
	this.jb = jb;
	this.start_action1 = start_action1;
	this.start_action2 = start_action2;
	this.hand_action1 = hand_action1;
	this.hand_action2 = hand_action2;
	this.start_button = start_button;
	this.hand_button = hand_button;
}

	@Override
	public void itemStateChanged(ItemEvent e) {
		if(e.getStateChange() == ItemEvent.SELECTED)
        {
            String s=(String)jb.getSelectedItem();
            if(s.equals("椒图")&&!"".equals(s.trim())){
            	//更改开始按钮的事件
                start_button.removeActionListener(start_action2);
                start_button.addActionListener(start_action1);
              //更改挂起按钮的事件
                hand_button.removeActionListener(hand_action2);
                hand_button.addActionListener(hand_action1);
                }
            if(s.equals("小黑")&&!"".equals(s.trim())){
            	//更改开始按钮的事件
            	start_button.removeActionListener(start_action1);
            	start_button.addActionListener(start_action2);
            	//更改挂起按钮的事件
            	hand_button.removeActionListener(hand_action1);
                hand_button.addActionListener(hand_action2);
            }
        }
	}

}
