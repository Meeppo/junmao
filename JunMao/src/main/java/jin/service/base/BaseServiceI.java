package jin.service.base;


public interface BaseServiceI<FK,T> {
	
	public void add(T t);
	
	public void update(T t);
	
	public void deleteLogic(FK id);
	
	public void delete(FK id);
	

}
