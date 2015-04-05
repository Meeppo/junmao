package jin.base.util;

import java.util.regex.Pattern;

public class StringUtils {
	
	/**
	 * check string is or not empty
	 * @param str
	 * @return
	 */
	public static boolean isEmpty(String str){
		return str == null || Pattern.matches(" *", str);
	}
	
	/**
	 * check string is or not empty
	 * @param str
	 * @return
	 */
	public static boolean isNotEmpty(String str){
		return !isEmpty(str);
	}
}
