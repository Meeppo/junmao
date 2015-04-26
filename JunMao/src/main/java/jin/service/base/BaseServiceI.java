package jin.service.base;

import java.util.List;


public interface BaseServiceI<FK,T> {
	
	public T selectById(FK id);
	
	public void add(T t);
	
	public void update(T t);
	
	public void deleteLogic(FK id) throws Exception;
	
	public void delete(FK id);
	
	public List<T> selectList();

}
