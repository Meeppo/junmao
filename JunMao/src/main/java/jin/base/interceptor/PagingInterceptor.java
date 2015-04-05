package jin.base.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jin.base.paging.SystemContext;
import jin.base.util.StringUtils;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class PagingInterceptor extends HandlerInterceptorAdapter {

	

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		
		try {
			Integer offset = Integer.parseInt(request.getParameter("pageOffset"));
			SystemContext.setPageOffset(offset);
		} catch (Exception e) {
		}
		try {
			Integer pagesize = Integer.parseInt(request.getParameter("pageSize"));
			SystemContext.setPageSize(pagesize);
		} catch (Exception e) {
		}
		
		String order = request.getParameter("order");
		if(StringUtils.isNotEmpty(order) && order.indexOf(" ") == -1){
			SystemContext.setOrder(order);
		}
		
		String sort = request.getParameter("sort");
		if(StringUtils.isNotEmpty(sort) && sort.indexOf(" ") == -1){
			SystemContext.setSort(sort);
		}
		
		
		return true;
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		
		SystemContext.removeOrder();
		SystemContext.removePageOffset();
		SystemContext.removePageSize();
		SystemContext.removeSort();
		
		
	}


	
	
}
