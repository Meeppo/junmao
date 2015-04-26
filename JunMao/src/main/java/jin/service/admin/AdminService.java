package jin.service.admin;

import org.springframework.stereotype.Service;

import jin.dao.admin.AdminDaoI;
import jin.model.Admin;
import jin.service.base.BaseService;

@Service
public class AdminService extends BaseService<Long, Admin, AdminDaoI> implements AdminServiceI {

	@Override
	public Admin selectByName(String name) {
		return dao.selectByName(name);
	}

}
