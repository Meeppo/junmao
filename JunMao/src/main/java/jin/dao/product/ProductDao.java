package jin.dao.product;

import org.springframework.stereotype.Repository;

import jin.base.hibernate.dao.BaseDao;
import jin.model.Product;

@Repository
public class ProductDao extends BaseDao<Long, Product> implements ProductDaoI {


}
