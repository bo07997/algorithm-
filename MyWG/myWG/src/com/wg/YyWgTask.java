package com.wg;

import java.awt.Rectangle;
import java.awt.Robot;
import java.awt.event.InputEvent;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
/*
 * 主要线程，用于执行鼠标操作
 */
public class YyWgTask implements Runnable {
    private WGdata data;
	private boolean hand_tag=false;
	//内部使用
    private int in_tag=0;
 
	public YyWgTask(WGdata data) {
		this.data =data;
	}

	public int isIn_Tag() {
		return in_tag;
	}

	public void setIn_Tag(int in_tag) {
		this.in_tag = in_tag;
	}

	public boolean isHand_tag() {
		return hand_tag;
	}

	public void setHand_tag(boolean hand_tag) {
		this.hand_tag = hand_tag;
	}

	@Override
	public void run() {
	main_race();
	}
	   private boolean waitWhileSuspended()   
               throws InterruptedException {  
       boolean result = false;
       //这是一个“繁忙等待”技术的示例。  
       //它是非等待条件改变的最佳途径，因为它会不断请求处理器周期地执行检查，   
       //更佳的技术是：使用Java的内置“通知-等待”机制  
		 if(hand_tag){
			 result = true;
		 }
       while ( hand_tag ) {  
           Thread.sleep(200);  
       }  
       return result;
   }  
private void main_race() {
	
		try {
			// 开始。准备。左上角数据
			Map<Integer, Integer> mapColor6 = new HashMap<Integer, Integer>();
			mapColor6.put(-2767710, 113);
			mapColor6.put(-2833503, 20);
			mapColor6.put(-2767709, 19);
			// 胜利。。正上方数据
			Map<Integer, Integer> mapColor7 = new HashMap<Integer, Integer>();
			mapColor7.put(-8644336, 117);
			mapColor7.put(-6743022, 79);
			// 失败。。正上方数据
			Map<Integer, Integer> mapColor8 = new HashMap<Integer, Integer>();
			mapColor8.put(-11713195, 116);
			mapColor8.put(-11581608, 109);
			Thread.sleep(2000);
			Robot robot = new Robot();

			
			while (true) {
				//挂起时执行，轮询等待
				waitWhileSuspended();
				// 移动到刷新处
				robot.mouseMove(780, 580);
				robot.mousePress(InputEvent.BUTTON1_MASK);
				robot.mouseRelease(InputEvent.BUTTON1_MASK);
				// 停顿一下再截图
				
				BufferedImage screenshot1 = (new Robot()).createScreenCapture(new Rectangle(595, 220, 90, 30));
				BufferedImage screenshot2 = (new Robot()).createScreenCapture(new Rectangle(595, 302, 90, 30));
				BufferedImage screenshot3 = (new Robot()).createScreenCapture(new Rectangle(595, 384, 90, 30));
				BufferedImage screenshot4 = (new Robot()).createScreenCapture(new Rectangle(595, 466, 90, 30));

				boolean result1 = new OCR().recognizeimge(data.getMapColor1(), screenshot1);
				if (result1) {
					
					// 移动到目标处
					robot.mouseMove(1015, 250);
					robot.mousePress(InputEvent.BUTTON1_MASK);
					robot.mouseRelease(InputEvent.BUTTON1_MASK);
					}
				
				
				boolean result2 = new OCR().recognizeimge(data.getMapColor2(), screenshot2);
				if ( result2) {
					
					// 移动到目标处
					robot.mouseMove(1015, 330);
					robot.mousePress(InputEvent.BUTTON1_MASK);
					robot.mouseRelease(InputEvent.BUTTON1_MASK);
					}
				
			
				boolean result3 = new OCR().recognizeimge(data.getMapColor3(), screenshot3);
				if (result3 ) {
					// 移动到目标处
					robot.mouseMove(1015, 410);
					robot.mousePress(InputEvent.BUTTON1_MASK);
					robot.mouseRelease(InputEvent.BUTTON1_MASK);
				}
				//挂起时执行，轮询等待
				waitWhileSuspended();
				boolean result4 = new OCR().recognizeimge(data.getMapColor4(), screenshot4);
				if (result4 ) {
					// 移动到目标处
					robot.mouseMove(1015, 490);
					robot.mousePress(InputEvent.BUTTON1_MASK);
					robot.mouseRelease(InputEvent.BUTTON1_MASK);
				}

				// 休眠等待
				Thread.sleep(3000);

				/*
				 * 进入成功？
				 */
				BufferedImage screenshot6 = (new Robot()).createScreenCapture(new Rectangle(195, 100, 20, 20));
				boolean result6 = new OCR().recognizeimge(mapColor6, screenshot6);
				if (result6 == true) {
					setIn_Tag(1); 
					for (int i3 = 0; i3 < 2; i3++) {
						Thread.sleep(2000);
						// 移动到准备处
						robot.mouseMove(1063, 484);
						robot.mousePress(InputEvent.BUTTON1_MASK);
						robot.mouseRelease(InputEvent.BUTTON1_MASK);
					}
					//挂起时执行，轮询等待
					waitWhileSuspended();
					while (true) {
						//挂起时执行，轮询等待,如果挂起则直接跳出这个循环
						if(waitWhileSuspended()==true){
							break;
						}
						Thread.sleep(5000);
						//挂起时执行，轮询等待,如果挂起则直接跳出这个循环
						if(waitWhileSuspended()==true){
							break;
						}
						BufferedImage screenshot7 = (new Robot()).createScreenCapture(new Rectangle(517, 204, 50, 50));
						boolean result7 = new OCR().recognizeimge(mapColor7, screenshot7);
						// 如果成功
						if (result7 == true) {
							for (int i2 = 0; i2 < 3; i2++) {
								// 移动到战利品
								robot.mouseMove(698, 305);
								robot.mousePress(InputEvent.BUTTON1_MASK);
								robot.mouseRelease(InputEvent.BUTTON1_MASK);
								Thread.sleep(3000);
							}
							Thread.sleep(3000);
							break;
						}
						// 如果失败
						BufferedImage screenshot8 = (new Robot()).createScreenCapture(new Rectangle(525, 190, 50, 50));
						boolean result8 = new OCR().recognizeimge(mapColor8, screenshot8);
						if (result8 == true) {
							robot.mouseMove(698, 305);
							robot.mousePress(InputEvent.BUTTON1_MASK);
							robot.mouseRelease(InputEvent.BUTTON1_MASK);
							Thread.sleep(3000);
							break;
						}
					}

				}
				// 如果从打怪状态出来，则重新进队
				if (in_tag == 1) {
					// 移动到组队
					robot.mouseMove(377, 588);
					robot.mousePress(InputEvent.BUTTON1_MASK);
					robot.mouseRelease(InputEvent.BUTTON1_MASK);
					Thread.sleep(2000);
					// 移动到妖气封印
					robot.mouseMove(372, 545);
					robot.mousePress(InputEvent.BUTTON1_MASK);
					robot.mouseRelease(InputEvent.BUTTON1_MASK);
					setIn_Tag(0);
					Thread.sleep(1000);
				}
			
			}
		}
		
catch (Exception e) {
			e.printStackTrace();
		}

		
}
}
