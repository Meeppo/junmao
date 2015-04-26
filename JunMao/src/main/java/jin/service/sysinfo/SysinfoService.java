package jin.service.sysinfo;

import jin.dao.sysinfo.SysinfoDaoI;
import jin.model.Sysinfo;
import jin.service.base.BaseService;

import org.springframework.stereotype.Service;

@Service
public class SysinfoService extends BaseService<Long, Sysinfo, SysinfoDaoI> implements
		SysinfoServiceI {

	@Override
	public Sysinfo selectInfo() {
		String hql = "from Sysinfo ";
		return (Sysinfo) dao.queryObject(hql);
	}


}
