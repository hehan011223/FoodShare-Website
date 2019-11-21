package com.myblog.utils;

public final class StringUtils {

	public static boolean isBlank(String str) {
		boolean b = true;
		if (str == null) {
			b = true;
		} else {
			int strLen = str.length();
			if (strLen == 0) {
				b = true;
			}

			for (int i = 0; i < strLen; i++) {
				if (!Character.isWhitespace(str.charAt(i))) {
					b = false;
					break;
				}
			}
		}
		return b;
	}

}
