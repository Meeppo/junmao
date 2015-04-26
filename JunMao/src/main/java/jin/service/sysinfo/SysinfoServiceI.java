package jin.service.sysinfo;

import jin.model.Sysinfo;
import jin.service.base.BaseServiceI;

public interface SysinfoServiceI extends BaseServiceI<Long, Sysinfo> {
	
	public Sysinfo selectInfo();
}
