package jin.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import jin.base.util.StringUtils;
import jin.model.Email;
import jin.service.email.EmailServiceI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/concat")
public class ConcatController {
	
	@Autowired
	private EmailServiceI emailService;
	
	@RequestMapping(value="/mail",method=RequestMethod.POST)
	public String mail(@Valid @ModelAttribute("email") Email email,BindingResult result,Model model,RedirectAttributes rettr,HttpSession session){
		
		valid(email,result,session);
		if(result.hasErrors()){
			model.addAttribute("current_page", "联系我们");
			return "concat";
		}
		
		try {
			emailService.add(email);		
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		session.setAttribute(Email.MUTIPART_POST,true);
		return "redirect:/nav/concat";
	}
	
	protected void valid(Email email,BindingResult result,HttpSession session){
		
		String code = (String) session.getAttribute("verifycode");
		Boolean multipart_post = (Boolean) session.getAttribute(Email.MUTIPART_POST);
		if(multipart_post != null){
			if(StringUtils.isEmpty(code) || !code.equals(email.getVerifyCode())){
				result.rejectValue("verifyCode", "","校验码错误"); 
			}
		}
		
	}
}
