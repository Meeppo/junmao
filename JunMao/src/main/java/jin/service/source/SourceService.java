package jin.service.source;

import java.io.File;
import java.util.List;

import jin.dao.source.SourceDaoI;
import jin.model.Source;
import jin.service.base.BaseService;

import org.springframework.stereotype.Service;
@Service
public class SourceService extends BaseService<Long, Source, SourceDaoI> implements
		SourceServiceI {

	@Override
	public List<Source> selectByID(Long[] id) {
		return dao.selectByID(id);
	}

	@Override
	public void delete(Source source,String baseDir) {
		
		dao.delete(source.getId());
		File file = new File(baseDir + source.getRealName());
		if(file.exists())
		file.delete();
	}



}
