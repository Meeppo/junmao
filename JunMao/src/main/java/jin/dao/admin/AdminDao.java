package jin.dao.admin;

import jin.base.hibernate.dao.BaseDao;
import jin.model.Admin;

import org.springframework.stereotype.Repository;

@Repository
public class AdminDao extends BaseDao<Long, Admin> implements AdminDaoI {

	@Override
	public Admin selectByName(String name) {
		String hql = "from Admin where deleteflag = '0' and name = ?";
		return (Admin) queryObject(hql, name);
	}



	
	
}
