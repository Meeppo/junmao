package jin.controller.exception;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jin.base.exception.BusinessException;
import jin.base.util.AjaxUtils;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class GlobalExceptionHandler {
	
	@ExceptionHandler(Exception.class)
	public String exceptionHandler(Exception e,HttpServletRequest request,HttpServletResponse response){
		
		e.printStackTrace();
		if(AjaxUtils.isAjaxRequest(request)){
			try {
				response.getWriter().print(e.getMessage());
				return null;
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
		}
		
		return "errors/404";
	}
	
	@ExceptionHandler(BusinessException.class)
	public String businessExceptionHandler(BusinessException e,HttpServletRequest request){
		e.printStackTrace();
		return "errors/404";
	}
}
