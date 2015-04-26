package jin.dao.source;

import java.util.List;

import jin.base.hibernate.dao.BaseDao;
import jin.model.Source;

import org.springframework.stereotype.Repository;

@Repository
public class SourceDao extends BaseDao<Long, Source> implements SourceDaoI {

	@Override
	public List<Source> selectByID(Long[] ids) {
		
		String hql = "from Source where deleteflag = '0' and id in (";
		for (int i = 0;i < ids.length; i++) {
			hql += "?,";
		}
		hql += ")";
		hql = hql.replace(",)", ")");
		return list(hql, ids);
	}

	
}
