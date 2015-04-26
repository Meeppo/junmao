package jin.controller;

import javax.validation.Valid;

import jin.base.exception.BusinessException;
import jin.model.Product;
import jin.service.product.ProductServiceI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/product")
public class ProductController {
	
	@Autowired
	private ProductServiceI productService;
	
	@RequestMapping(value="/add",method=RequestMethod.GET)
	public String toAdd(@ModelAttribute Product product ,Model model) {
		
		return "back/product/edit";
	}
	
	@RequestMapping(value="/add",method=RequestMethod.POST)
	public String add(@Valid @ModelAttribute Product product ,BindingResult result,Model model) {
		
		if(result.hasErrors()){
			return "back/product/edit";
		}
	
		productService.add(product);
		
		return "redirect:/product/back/list";
	}
	
	@RequestMapping(value="/back/list")
	public String productPager(Product product ,Model model){
		
		model.addAttribute("productList", productService.selectList());
		
		return "back/product/list";
		
	}
	
	@RequestMapping("/back/delete/{id}")
	@ResponseBody
	public String delete(@PathVariable Long id){
		
		try {
			productService.deleteLogic(id);
		} catch (Exception e) {
			e.printStackTrace();
			return "1";
		}
		return "0";
	}

	@RequestMapping(value="/back/update/{id}",method=RequestMethod.GET)
	public String toUpdate(@PathVariable Long id,Model model){
		
		model.addAttribute("product", productService.selectById(id));
		
		return "back/product/edit";
	}
	
	@RequestMapping(value="/back/update/{id}",method=RequestMethod.POST)
	public String update(@Valid @ModelAttribute Product product,BindingResult result,Model model) throws BusinessException{
		
		if(result.hasErrors()){
			return "back/product/edit";
		}
		
		Product old = productService.selectById(product.getId());
		old.setPhoto(product.getPhoto());
		old.setProductName(product.getProductName());
		old.setSummary(product.getSummary());
		old.setIsTop(product.getIsTop());
		productService.update(old);
		
		return "redirect:/product/back/list";
	}
	
	@RequestMapping("/back/view/{id}")
	public String view(@PathVariable Long id ,Model model){
		
		model.addAttribute("product", productService.selectById(id));
		
		return "back/product/view";
	}
	
	@RequestMapping("/pager")
	public String productPage(Model model){
		model.addAttribute("productPage", productService.findPage(null));
		return "products-page";
	}
	
	
	/**
	 * 前端
	 * 产品详细
	 * @return
	 */
	@RequestMapping("/introduction/{id}")
	public String introduction(@PathVariable Long id,Model model){
		
		
		return "";
	}
}
