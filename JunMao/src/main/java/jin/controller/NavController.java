package jin.controller;

import javax.servlet.http.HttpSession;

import jin.model.Email;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/nav")
public class NavController {
	
	@RequestMapping("/index")
	public String index(Model model){
		
		model.addAttribute("index", true);
		
		return "index";
	}
	
	@RequestMapping("/products")
	public String productShow(Model model){
		
		model.addAttribute("current_page", "产品介绍");
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
