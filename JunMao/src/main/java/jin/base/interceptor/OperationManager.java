package jin.base.interceptor;

import java.lang.reflect.Method;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import jin.model.Admin;

import org.aspectj.lang.JoinPoint;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

/**
 * 为添加和修改操作添加操作人和时间
 * @author jinxin
 *
 */
public class OperationManager{


	public void before(JoinPoint joinpoint) throws Exception {
		
		String methodName = joinpoint.getSignature().getName();
		Long creater = null;
		try {
			Admin admin = (Admin) getSession().getAttribute("admin");
			creater = admin.getId();
		} catch (Exception e) {
		}
		
		if(methodName.startsWith("add")){
			Method createdDate = getMethodByName("setCreateddate",joinpoint,Date.class);
			if(createdDate !=null) createdDate.invoke(joinpoint.getArgs()[0], new Date());
			Method insert = getMethodByName("setCreatedby",joinpoint,Long.class);
			if(insert != null) insert.invoke(joinpoint.getArgs()[0], creater);
			

		}
		else if(methodName.startsWith("update")){
			Method updatedDate = getMethodByName("setUpdateddate",joinpoint,Date.class);
			if(updatedDate != null) updatedDate.invoke(joinpoint.getArgs()[0], new Date());
			Method updater = getMethodByName("setUpdatedby",joinpoint,Long.class);
			if(updater != null) updater.invoke(joinpoint.getArgs()[0], creater);
		}
	}
	
	
	private Method getMethodByName(String methodName,JoinPoint joinPoint,Class<?> paramClass){
		try {
			Method method = joinPoint.getArgs()[0].getClass().getMethod(methodName,paramClass);
			return method;
		} catch (SecurityException e) {
		} catch (NoSuchMethodException e) {
		}
		return null;
	}
	
	private  HttpServletRequest getRequest(){
		RequestAttributes ra = RequestContextHolder.getRequestAttributes();  
		return  ra == null ? null :((ServletRequestAttributes)ra).getRequest();  
	}
	
	private  HttpSession getSession(){
		HttpServletRequest request = getRequest();  
		return  request==null ? null : request.getSession();
	}
}
