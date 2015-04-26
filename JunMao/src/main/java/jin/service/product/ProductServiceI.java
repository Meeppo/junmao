package jin.service.product;

import jin.base.paging.Pager;
import jin.model.Product;
import jin.service.base.BaseServiceI;

public interface ProductServiceI extends BaseServiceI<Long, Product> {
	
	public Pager<Product> findPage(Product prodcut);
}
