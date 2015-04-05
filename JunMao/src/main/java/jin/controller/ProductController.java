package jin.controller;

import javax.validation.Valid;

import jin.model.Product;
import jin.service.product.ProductServiceI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/product")
public class ProductController {
	
	@Autowired
	private ProductServiceI productService;
	
	@RequestMapping(value="/add",method=RequestMethod.GET)
	public String toAdd(@ModelAttribute Product product ,Model model) {
		
		
		
		return "";
	}
	
	@RequestMapping(value="/add",method=RequestMethod.POST)
	public String add(@Valid @ModelAttribute Product product ,Model model) {
		
		return "";
	}
	
	@RequestMapping(value="/update/{id}", method=RequestMethod.GET)
	public String toUpdate(@PathVariable Long id,Model model) {

		return "";
	}
	
	@RequestMapping(value="/update/{id}" , method=RequestMethod.POST)
	public String update(@ModelAttribute Product product , Model model) {

		return "";
	}
	
	@RequestMapping("/delete/{id}")
	public String delete(@PathVariable Long id) {
		
		return "";
	}

	public String toPager() {

		return "";
	}
	
	public String pager() {

		return "";
	}

	
	/**
	 * 前端
	 * 产品详细
	 * @return
	 */
	public String introduction(){
		
		return "";
	}
}
