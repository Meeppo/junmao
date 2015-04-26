package jin.dao.source;

import java.util.List;

import jin.base.hibernate.dao.IBaseDao;
import jin.model.Source;

public interface SourceDaoI extends IBaseDao<Long, Source> {
	
	public List<Source> selectByID(Long[] id);
}
