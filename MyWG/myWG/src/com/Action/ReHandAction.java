package com.Action;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JComboBox;

import com.wg.YyWgTask;
/*
 * 恢复按钮事件
 */
public class ReHandAction implements ActionListener{
	private JComboBox  jb;
	//2个线程run方法
	private YyWgTask yyWgTask1;
	private YyWgTask yyWgTask2;
	
	public ReHandAction() {
	}



	public ReHandAction(JComboBox jb, YyWgTask yyWgTask1, YyWgTask yyWgTask2) {
		super();
		this.jb = jb;
		this.yyWgTask1 = yyWgTask1;
		this.yyWgTask2 = yyWgTask2;
	}



	@Override
	public void actionPerformed(ActionEvent e) {
		String s=(String)jb.getSelectedItem();
		if(s.equals("椒图")&&!"".equals(s.trim())){
			yyWgTask1.setHand_tag(false);
		}
		if(s.equals("小黑")&&!"".equals(s.trim())){
			yyWgTask2.setHand_tag(false);
		}
		}
	}

