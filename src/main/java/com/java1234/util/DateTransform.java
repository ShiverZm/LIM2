package com.java1234.util;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * ���ڸ�ʽת��������
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
