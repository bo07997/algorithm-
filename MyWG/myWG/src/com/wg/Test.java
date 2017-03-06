package com.wg;

import java.awt.Rectangle;
import java.awt.Robot;
import java.awt.event.InputEvent;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/*
 * 测试用
 */
public class Test {

    /** */
    /**
     * @param args
     */
    public static void main(String[] args) {
     
        try {
        	
		        	/*
		        	 * 椒图数据      
		        	 */
			      /*   Map<Integer, Integer> mapColor1 = new HashMap<Integer, Integer>();
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
        	        mapColor4.put(-2243946, 13);*/
			        
        	
		        	/*
		        	 * 鬼使黑数据      
		        	 */
        	      Map<Integer, Integer> mapColor1 = new HashMap<Integer, Integer>();
        	        mapColor1.put(-2175564, 867);
        	       mapColor1.put(-2835566, 90);
        	       mapColor1.put(-2967152, 90);
        	        Map<Integer, Integer> mapColor2 = new HashMap<Integer, Integer>();
        	        mapColor2.put(-2175564, 990);
        	        mapColor2.put(-2110030, 90);
        	        mapColor2.put(-2111326, 90);
        	        Map<Integer, Integer> mapColor3 = new HashMap<Integer, Integer>();
        	        mapColor3.put(-2175564, 1126);
        	        mapColor3.put(-2109514, 17);
        	        mapColor3.put(-2109771, 16);
        	        Map<Integer, Integer> mapColor4 = new HashMap<Integer, Integer>();
        	        mapColor4.put(-2175564, 1091);
        	        mapColor4.put(-2109514, 16);
        	        mapColor4.put(-2109771, 16);
        	      
        	        //开始。准备。左上角数据
        	        Map<Integer, Integer> mapColor6 = new HashMap<Integer, Integer>();
        	        mapColor6.put(-2767710, 113);
        	        mapColor6.put(-2833503, 20);
        	        mapColor6.put(-2767709, 19);
        	      //胜利。。正上方数据
        	        Map<Integer, Integer> mapColor7 = new HashMap<Integer, Integer>();
        	        mapColor7.put(-8644336, 117);
        	        mapColor7.put(-6743022, 79);
        	        //失败。。正上方数据
        	        Map<Integer, Integer> mapColor8 = new HashMap<Integer, Integer>();
        	        mapColor8.put(-11713195, 116);
        	        mapColor8.put(-11581608, 109);
        	Thread.sleep(2000);
        	Robot robot=new	Robot() ;
        	
        	int tag = 0;
        	while( true){
        		//移动到刷新处
                 robot.mouseMove(780, 580) ;
            	  robot.mousePress(InputEvent.BUTTON1_MASK);
                  robot.mouseRelease(InputEvent.BUTTON1_MASK);
                  //停顿一下再截图
                  Thread.sleep(500);
        BufferedImage screenshot1 = (new Robot()).createScreenCapture(new Rectangle(595,  
        	220,90,30)); 
        BufferedImage screenshot2 = (new Robot()).createScreenCapture(new Rectangle(595,  
            302,90,30)); 
        BufferedImage screenshot3 = (new Robot()).createScreenCapture(new Rectangle(595,  
            384,90,30)); 
        BufferedImage screenshot4 = (new Robot()).createScreenCapture(new Rectangle(595,  
            466,90,30)); 

        boolean result1 =new OCR().recognizeimge(mapColor1,screenshot1);
        if(result1==true){
         	//移动到目标处
          	robot.mouseMove(1015, 250) ;
          	robot.mousePress(InputEvent.BUTTON1_MASK);
             robot.mouseRelease(InputEvent.BUTTON1_MASK);
          }
        boolean result2 =new OCR().recognizeimge(mapColor2,screenshot2);
       if(result2==true){
        	//移动到目标处
         	robot.mouseMove(1015, 330) ;
         	robot.mousePress(InputEvent.BUTTON1_MASK);
            robot.mouseRelease(InputEvent.BUTTON1_MASK);
         }
        boolean result3 =new OCR().recognizeimge(mapColor3,screenshot3);
       if(result3==true){
        	//移动到目标处
         	robot.mouseMove(1015, 410) ;
         	robot.mousePress(InputEvent.BUTTON1_MASK);
            robot.mouseRelease(InputEvent.BUTTON1_MASK);
         }
        boolean result4 =new OCR().recognizeimge(mapColor4,screenshot4);
        if(result4==true){
        	//移动到目标处
         	robot.mouseMove(1015, 490) ;
         	robot.mousePress(InputEvent.BUTTON1_MASK);
            robot.mouseRelease(InputEvent.BUTTON1_MASK);
         }
   
      //休眠等待
      Thread.sleep(3000);
     
    
    	   /*
           * 进入成功？
           */
      BufferedImage screenshot6 = (new Robot()).createScreenCapture(new Rectangle(195,  
	            100,20,20)); 
          boolean result6 =new OCR().recognizeimge(mapColor6,screenshot6);
          if(result6==true){
        	  tag=1;
        	  for(int i3=0;i3<2;i3++){
        		  Thread.sleep(2000);
             	//移动到准备处
            	robot.mouseMove(1063, 484) ;
            	robot.mousePress(InputEvent.BUTTON1_MASK);
              robot.mouseRelease(InputEvent.BUTTON1_MASK);
        	  }
        	  while(true){
        		  Thread.sleep(5000);
        		  BufferedImage screenshot7 = (new Robot()).createScreenCapture(new Rectangle(517,  
        	                 204,50,50)); 
                  boolean result7 =new OCR().recognizeimge(mapColor7,screenshot7);
                  //如果成功
                  if(result7==true){
                	  for(int i2=0;i2<3;i2++){
                		//移动到战利品
                	      	robot.mouseMove(698, 305) ;
                	      	robot.mousePress(InputEvent.BUTTON1_MASK);
                	        robot.mouseRelease(InputEvent.BUTTON1_MASK);
                	        Thread.sleep(3000);
                	  }
                	  Thread.sleep(3000);
                	  break;
                  }
                  //如果失败
                  BufferedImage screenshot8 = (new Robot()).createScreenCapture(new Rectangle(525,  
                          190,50,50)); 
                  boolean result8=new OCR().recognizeimge(mapColor8,screenshot8);
                  if(result8==true){
                	  robot.mouseMove(698, 305) ;
          	      	robot.mousePress(InputEvent.BUTTON1_MASK);
          	        robot.mouseRelease(InputEvent.BUTTON1_MASK);
          	      Thread.sleep(3000);
          	        break;
                  }
        	  }
        	  
          }
          //如果从打怪状态出来，则重新进队
          if(tag==1){
        	//移动到组队
          	robot.mouseMove(377, 588) ;
          	robot.mousePress(InputEvent.BUTTON1_MASK);
            robot.mouseRelease(InputEvent.BUTTON1_MASK);
            Thread.sleep(2000);
        	//移动到妖气封印
          	robot.mouseMove(372, 545) ;
          	robot.mousePress(InputEvent.BUTTON1_MASK);
            robot.mouseRelease(InputEvent.BUTTON1_MASK);
            tag=0;
            Thread.sleep(1000);
          }
      }
    
        	
   
    
        } catch (IOException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
