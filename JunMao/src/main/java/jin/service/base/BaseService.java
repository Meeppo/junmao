package jin.service.base;

import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import jin.base.hibernate.dao.IBaseDao;

import org.springframework.beans.factory.annotation.Autowired;

public class BaseService<FK extends Serializable,T,DAO extends IBaseDao<FK,T>> implements BaseServiceI<FK, T> {
	
	@Autowired
	protected DAO dao;

	@Override
	public void add(T t) {
		dao.add(t);
	}

	@Override
	public void update(T t) {
		dao.update(t);
	}

	@Override
	public void deleteLogic(FK id) {
		T t = dao.load(id);
		try {
			Method setFlagMethod = dao.getClz().getMethod("setDeleteflag", Character.class);
			setFlagMethod.invoke(t, '1');
			dao.update(t);
		} catch (NoSuchMethodException e) {
			e.printStackTrace();
		} catch (SecurityException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void delete(FK id) {
		dao.delete(id);
	}


	

	
	
}
