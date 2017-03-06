package com.Action;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import com.wg.YyWgTask;
/*
 * 挂起按钮事件
 */
public class HandAction implements ActionListener{
	private YyWgTask task ;
	
	  public HandAction(){
		  
	  }
		public HandAction(YyWgTask task) {
		this.task = task;
	}
		


	@Override
	public void actionPerformed(ActionEvent e) {
	task.setHand_tag(true);
	}

}
