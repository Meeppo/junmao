package jin.service.base;

import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.List;

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
	public void deleteLogic(FK id) throws Exception {
		T t = dao.load(id);
		try {
			Method setFlagMethod = dao.getEntityClz().getMethod("setDeleteflag", Character.class);
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

	@SuppressWarnings("unchecked")
	@Override
	public T selectById(FK id) {
		
		String hql = "from " + dao.getEntityClz().getSimpleName() + " where id = ? and deleteflag = '0'";
		return (T) dao.queryObject(hql, id);
	}

	@Override
	public List<T> selectList() {
		String hql = "from " + dao.getEntityClz().getSimpleName() + " where  deleteflag = '0'";
		return dao.list(hql);
	}



	
	
}
