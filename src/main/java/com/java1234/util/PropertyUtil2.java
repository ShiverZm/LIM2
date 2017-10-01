package com.java1234.util;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;  
import java.util.Properties;  
/**  
 * 从类路径下获取资源文件并进行读写  
 * @author zhangwenchao  
 *  
 */  
public class PropertyUtil2 {  
  
    private static Properties prop = null;  
    private static String path=null;
    /**  
     * 初始化Properties实例  
     * @param propertyName  
     * @throws Exception  
     */ 
    public PropertyUtil2() {
    	this.path=this.getClass().getResource("/").getPath();
	}
    public synchronized static void initProperty(String propertyName) throws Exception {  
        if (prop == null) {  
            prop = new Properties();  
            InputStream inputstream =new FileInputStream(new File(path+"/"+propertyName));
            prop.load(inputstream);  
            inputstream.close();  
            inputstream = null;  
        }  
    }  
    /**  
     * 读取数据  
     * @param propertyName  
     * @param key  
     * @return  
     */  
    public static String getValueByKey(String propertyName, String key) {  
        String result = "";  
        try {  
            initProperty(propertyName);  
            result = prop.getProperty(key);  
            return result;  
        } catch (Exception e) {  
            e.printStackTrace();  
            return "";  
        }  
    }  
  
    public static void main(String[] s) {  
          
        try {  
            System.out.println(new PropertyUtil2().getValueByKey("fileResource.properties","projectFilePathOnWindow"));  
              
        } catch (Exception e) {  
              
            e.printStackTrace();  
        }  
    }  
}