package jin.service.source;

import java.util.List;

import jin.model.Source;
import jin.service.base.BaseServiceI;

public interface SourceServiceI extends BaseServiceI<Long, Source> {
	
	List<Source> selectByID(Long[] id);
	
	void delete(Source source,String baseDir);
}
