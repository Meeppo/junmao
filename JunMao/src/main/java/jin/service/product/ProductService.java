package jin.service.product;

import org.springframework.stereotype.Service;

import jin.dao.product.ProductDaoI;
import jin.model.Product;
import jin.service.base.BaseService;

@Service
public class ProductService extends BaseService<Long, Product, ProductDaoI>
		implements ProductServiceI {

	
}
