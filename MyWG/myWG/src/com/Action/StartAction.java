package com.Action;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import com.wg.YyWgTask;

/*
 * 开始按钮事件
 */
public class StartAction implements ActionListener {
private Thread t ;
  public StartAction(){
	  
  }
	public StartAction(Thread t) {
	this.t = t;
}





	
	@Override
	public void actionPerformed(ActionEvent e) {
		t.start();
		
	}

}
