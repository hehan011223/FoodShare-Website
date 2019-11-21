package com.myblog.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtils {

	public static final String pattern_date = "yyyy-MM-dd";

	public static final String pattern_time = "yyyy-MM-dd HH:mm:ss";

	public static String formatDate(Date date) {
		System.out.println("formatDate:"+date);
		return formatDate(date, pattern_time);
	}

	public static String formatDate(Date date, String pattern) {
		SimpleDateFormat dateFormat = new SimpleDateFormat(pattern);
		return dateFormat.format(date);		
	}
}