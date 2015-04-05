package jin.base.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jin.base.util.AjaxUtils;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class CacheInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		
		if(AjaxUtils.isAjaxRequest(request)){
			   response.setHeader("Cache-Control", "no-cache");  
	           response.setHeader("Pragma", "no-cache");  
	           response.setHeader("Expires", "0");  
		}
		return true;
	}

	
}
