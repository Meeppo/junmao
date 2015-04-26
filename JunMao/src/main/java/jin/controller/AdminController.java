package jin.controller;

import javax.validation.Valid;

import jin.base.exception.BusinessException;
import jin.base.util.StringUtils;
import jin.model.Admin;
import jin.service.admin.AdminServiceI;

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
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminServiceI adminService;
	
	@RequestMapping("/back/list")
	public String adminList(Admin admin,Model model){
		
		model.addAttribute("adminList", adminService.selectList());
		return "back/admin/list";
	}
	
	@RequestMapping("/back/delete/{id}")
	@ResponseBody
	public String delete(@PathVariable Long id){
		
		try {
			adminService.deleteLogic(id);
		} catch (Exception e) {
			return "1";
		}
		return "0";
	}
	
	

	@RequestMapping(value="/back/update/{id}",method=RequestMethod.GET)
	public String toUpdate(@PathVariable Long id,Model model){
		
		model.addAttribute("admin", adminService.selectById(id));
		
		return "back/admin/edit";
	}
	
	@RequestMapping(value="/back/update/{id}",method=RequestMethod.POST)
	public String update(@Valid @ModelAttribute Admin admin,BindingResult result,Model model,RedirectAttributes rattr) throws BusinessException{
		
		if(result.hasErrors()){
			return "back/admin/edit";
		}
		
		try {
			Admin old = adminService.selectById(admin.getId());
			old.setName(old.getName());
			old.setPhone(admin.getPhone());
			old.setEmail(admin.getEmail());
			adminService.update(old);
			rattr.addFlashAttribute("id", old.getId());
		} catch (Exception e) {
			throw new BusinessException();
		}
		
		return "redirect:/admin/back/update/{id}";
	}
	
	@RequestMapping("/back/pwEdit/{id}")
	@ResponseBody
	public String pwEdit(@PathVariable Long id,String password,String passwordConf,Model model) throws Exception{
		
		
		if (StringUtils.isEmpty(password)) {
			return "密码不能为空";
		} else if (!password.equals(passwordConf)) {
			return "两次密码不一致";
		}
		try {
			Admin old = adminService.selectById(id);
			old.setPassword(password);
			adminService.update(old);
		} catch (Exception e) {
			throw new Exception("修改失败");
		}
		return "修改成功";

	}
}
