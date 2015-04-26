package jin.base.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jin.model.Admin;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthInterceptor extends HandlerInterceptorAdapter{

	private final static String LOGIN = "/JunMao/sign/back/in";
	
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		
		Admin user= (Admin) request.getSession().getAttribute("admin");
		
		if(user != null){
			return true;
		}else{
			response.getWriter().print("<script>window.open('"+LOGIN+"','_top');</script>");
			return false;
		}
		
		
	}

	
}
