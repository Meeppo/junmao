package jin.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import jin.base.exception.BusinessException;
import jin.base.util.StringUtils;
import jin.model.Email;
import jin.service.email.EmailServiceI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	@RequestMapping(value="/back/list")
	public String emailPager(Email email ,Model model){
		
		model.addAttribute("emailList", emailService.selectList());
		
		return "back/concat/list";
		
	}
	
	@RequestMapping("/back/delete/{id}")
	@ResponseBody
	public String delete(@PathVariable Long id){
		
		try {
			emailService.deleteLogic(id);
		} catch (Exception e) {
			e.printStackTrace();
			return "1";
		}
		return "0";
	}

	@RequestMapping(value="/back/update/{id}",method=RequestMethod.GET)
	public String toUpdate(@PathVariable Long id,Model model){
		
		model.addAttribute("email", emailService.selectById(id));
		
		return "back/concat/edit";
	}
	
	@RequestMapping(value="/back/update/{id}",method=RequestMethod.POST)
	public String update(@Valid @ModelAttribute Email email,BindingResult result,Model model) throws BusinessException{
		
		if(result.hasErrors()){
			return "back/concat/edit";
		}
		
		try {
			Email old = emailService.selectById(email.getId());
			old.setUsername(email.getUsername());
			old.setRemark(email.getRemark());
			old.setPhone(email.getPhone());
			old.setEmail(email.getEmail());
			emailService.update(old);
		} catch (Exception e) {
			throw new BusinessException();
		}
		
		
		
		
		return "redirect:/concat/back/list";
	}
	
	@RequestMapping("/back/view/{id}")
	public String view(@PathVariable Long id ,Model model){
		
		model.addAttribute("email", emailService.selectById(id));
		
		return "back/concat/view";
	}
}
