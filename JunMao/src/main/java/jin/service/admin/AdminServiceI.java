package jin.service.admin;

import jin.model.Admin;
import jin.service.base.BaseServiceI;

public interface AdminServiceI extends BaseServiceI<Long, Admin> {
	
	
	public Admin selectByName(String name);
}
