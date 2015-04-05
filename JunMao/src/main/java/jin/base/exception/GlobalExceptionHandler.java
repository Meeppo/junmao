package jin.base.exception;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class GlobalExceptionHandler {
	
	@ExceptionHandler(Exception.class)
	public String exceptionHandler(Exception e,HttpServletRequest request){
		return "errors/404.jsp";
	}
	
	@ExceptionHandler(BusinessException.class)
	public String businessExceptionHandler(BusinessException e,HttpServletRequest request){
		return "errors/404.jsp";
	}
}
