package jin.controller;

import javax.servlet.http.HttpSession;

import jin.model.Admin;
import jin.model.Email;
import jin.model.Product;
import jin.service.product.ProductService;
import jin.service.product.ProductServiceI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/nav")
public class NavController {
	
	@Autowired
	private ProductServiceI productService;
	
	@RequestMapping("/index")
	public String index(Model model){
		
		model.addAttribute("index", true);
		model.addAttribute("productPage", productService.findPage(null));
		return "index";
	}
	
	@RequestMapping("/products")
	public String productShow(Model model,Product product){
		
		model.addAttribute("current_page", "产品介绍");
		model.addAttribute("productPage", productService.findPage(product));
		return "products";
	}
	
	@RequestMapping("/concat")
	public String concat(@ModelAttribute Email email,Model model){
		
		model.addAttribute("current_page", "联系我们");
		return "concat";
	}
	
	@RequestMapping("/about")
	public String about(Model model){
		
		model.addAttribute("current_page", "关于我们");
		return "about";
	}
	
	@RequestMapping("/back/index")
	public String backIndex(){
		
		return "back/index";
	}
	

}
