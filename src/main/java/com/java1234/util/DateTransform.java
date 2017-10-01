package com.java1234.util;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 日期格式转化工具类
 * @author zsw
 *
 */
public class DateTransform {
    public static String transform(Date date) {
    	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	String dateAfter=sdf.format(date);
    	return dateAfter;
    }
}
