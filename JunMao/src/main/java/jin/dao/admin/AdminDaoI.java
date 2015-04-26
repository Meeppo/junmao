package jin.dao.admin;

import jin.base.hibernate.dao.IBaseDao;
import jin.model.Admin;

public interface AdminDaoI extends IBaseDao<Long, Admin> {
	
	public Admin selectByName( String name);
}
