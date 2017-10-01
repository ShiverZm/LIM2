package com.java1234.util;
import java.io.InputStream;  
import java.util.Properties;  
/**  
 * ����·���»�ȡ��Դ�ļ������ж�д  
 * @author zhangwenchao  
 *  
 */  
public class PropertyUtil {  
  
    private static Properties prop = null;  
    private static String path=null;
    /**  
     * ��ʼ��Propertiesʵ��  
     * @param propertyName  
     * @throws Exception  
     */ 
    public PropertyUtil() {
    	
	}
    public synchronized static void initProperty(String propertyName) throws Exception {  
        if (prop == null) {  
            prop = new Properties();  
            InputStream inputstream = null;  
            ClassLoader cl = PropertyUtil.class.getClassLoader();   
            System.out.println(cl);  
            if  (cl !=  null ) {          
                inputstream = cl.getResourceAsStream(propertyName);          
            }  else {          
                inputstream = ClassLoader.getSystemResourceAsStream(propertyName);          
            }     
  
            if (inputstream == null){  
                throw new Exception("inputstream " + propertyName+ " open null");  
            }  
            prop.load(inputstream);  
            inputstream.close();  
            inputstream = null;  
        }  
    }  
    /**  
     * ��ȡ����  
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
            System.out.println(PropertyUtil.getValueByKey("fileResource.properties","projectFilePathOnWindow"));  
              
        } catch (Exception e) {  
              
            e.printStackTrace();  
        }  
    }  
}