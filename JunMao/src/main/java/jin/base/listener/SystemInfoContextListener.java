package jin.base.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import jin.model.Sysinfo;
import jin.service.sysinfo.SysinfoServiceI;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

/**
 * 添加系统基本信息
 * @author Jin
 *
 */
public class SystemInfoContextListener implements ServletContextListener {
	
	
	private SysinfoServiceI sysinfoService;
	
	private ApplicationContext context;
	@Override
	public void contextInitialized(ServletContextEvent sce) {
		
		this.context = WebApplicationContextUtils.getWebApplicationContext(sce.getServletContext());
		sysinfoService = context.getBean(SysinfoServiceI.class);
		Sysinfo info = sysinfoService.selectInfo();
		sce.getServletContext().setAttribute("sysinfo", info);
		
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
	
		

	}

	

}
