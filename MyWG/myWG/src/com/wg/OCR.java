package com.wg;
import java.awt.image.BufferedImage;
import java.util.HashMap;
import java.util.Map;
/*
 * 此处不用ORC，单纯的处理颜色，比较数据
 */
public class OCR {
    
    //私人的  获取颜色值
    public  boolean recognizeimge(Map<Integer, Integer> mapColor1,BufferedImage screenshot) throws Exception {

        /************ 降噪处理***begin ***/
       
        int width = screenshot.getTileWidth();
        int height = screenshot.getTileHeight();

   
        /*
         * 对标本截图Image进行处理。一个二重循环，用image.getRGB方法来取得每个点的颜色， 然后对颜色计数，并放到一个HashMap里去
         */
        Map<Integer, Integer> mapColor2 = new HashMap<Integer, Integer>();
        for (int i = 0; i < width; i++)
            for (int j = 0; j < height; j++) {
                int color = screenshot.getRGB(i, j);
                Integer count = mapColor2.get(color);
                if (count == null)
                    count = 0;
                count++;
                mapColor2.put(color, count);
            }

    
        /*
         * 比较2个
         */
        int end = compareColor(mapColor1, mapColor2);
        if(end<8){
        	return true;
        	
        }
        return false;
    }
    public int compareColor(Map<Integer, Integer> map1,Map<Integer, Integer> map2){
    	if(map1==null||map1.size()==0){
    		return 9999;
    	}
    	int result = 0;
    	  for (int key : map1.keySet()) {
    		  if(map2.get(key)==null){
    			  return 99999;
    		  }
    		  else{
    			  
    		   result +=map1.get(key) >map2.get(key)?map1.get(key) -map2.get(key):map2.get(key) -map1.get(key);
    		  }
    		  }
    	return result;
    }
}