package jin.service.product;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import jin.base.paging.Pager;
import jin.dao.product.ProductDaoI;
import jin.model.Product;
import jin.service.base.BaseService;

@Service
public class ProductService extends BaseService<Long, Product, ProductDaoI>
		implements ProductServiceI {

	@Override
	public Pager<Product> findPage(Product product) {
		
		StringBuffer hql = new StringBuffer("from Product where deleteflag = '0'");
		Map<String, Object> alias = new HashMap<String, Object>();
		if(product != null && '0' == product.getIsTop()){
			hql.append(" and isTop = :isTop");
			alias.put("isTop", product.getIsTop());
		}
		return dao.findByAlias(hql.toString(),alias);
	}

	
}
