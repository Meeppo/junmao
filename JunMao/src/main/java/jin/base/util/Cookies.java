package jin.base.util;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Cookies {
	

	public HttpServletRequest request;
	
	public HttpServletResponse response;
	
	/**
	 * cookie生命周期
	 * default 一周
	 */
	private int maxAge = 60*60*24*6;
	
	public void addCookie(Cookie cookie){
		response.addCookie(cookie);
	}
	
	public void addCookie(String name,String value){
		
		Cookie cookie = new Cookie(name, value);
		cookie.setMaxAge(maxAge);
		response.addCookie(cookie);
	}
	
	public Cookie getCookie(String name){
		
		Cookie[] cookies = request.getCookies();
		if(cookies != null){
			for (Cookie cookie : cookies) {
				if(cookie.getName().equals(name)){
					return cookie;
				}
			}
		}
		
		return null;
	}
	
	public boolean removeCookie(String name){
		Cookie cookie = getCookie(name);
		if(cookie != null){
			cookie.setMaxAge(0);
			response.addCookie(cookie);
			return true;
		}
		
		return false;
	}
}
