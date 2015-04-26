package jin.base.hibernate.dao;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import jin.base.paging.Pager;


/**
 * 公共的DAO处理对象，这个对象中包含了Hibernate的所有基本操作和对SQL的操作
 * @author Administrator
 *
 * @param <T>
 */
public interface IBaseDao<FK extends Serializable,T> {
	
	public Class<?> getFKClz() ;
	
	public Class<?> getEntityClz();
	
	public T add(T t) ;
	
	
	public void update(T t) ;
	
	
	public void delete(FK id) ;
	
	
	public T load(FK id) ;
	
	public T get(FK id);
	
	
	public List<T> list(String hql, Object...args) ;
	public List<T> list(String hql, Object[] args, Map<String, Object> alias) ;
	public List<T> listByAlias(String hql, Map<String, Object> alias) ;
	
	
	public Pager<T> find(String hql, Object...args) ;
	public Pager<T> find(String hql, Object[] args, Map<String, Object> alias);
	public Pager<T> findByAlias(String hql, Map<String, Object> alias) ;
	
	
	public Object queryObject(String hql, Object...args) ;
	public Object queryObject(String hql, Object[] args,Map<String, Object> alias) ;
	public Object queryObjectByAlias(String hql, Map<String, Object> alias) ;
	
	
	
	public void updateByHql(String hql, Object... args) ;

	
	
	public <N extends Object>List<N> listBySql(String sql, Class<?> clz, boolean hasEntity,Object...args) ;
	public <N extends Object>List<N> listBySql(String sql, Object[] args, Map<String, Object> alias, Class<?> clz, boolean hasEntity) ;
	public <N extends Object>List<N> listByAliasSql(String sql, Map<String, Object> alias, Class<?> clz, boolean hasEntity) ;

	
	public <N extends Object>Pager<N> findBySql(String sql, Class<?> clz, boolean hasEntity ,Object... args);
	public <N extends Object>Pager<N> findBySql(String sql, Object[] args, Map<String, Object> alias, Class<?> clz, boolean hasEntity) ;
	public <N extends Object>Pager<N> findByAliasSql(String sql, Map<String, Object> alias, Class<?> clz, boolean hasEntity) ;

	
}

