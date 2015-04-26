package jin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import jin.model.Sysinfo;
import jin.service.sysinfo.SysinfoServiceI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/sysinfo")
public class SysinfoController{
	
	@Autowired
	private SysinfoServiceI sysinfoService;
	
	@RequestMapping(value="/back/edit",method=RequestMethod.GET)
	public String toEdit(Model model){
		model.addAttribute("sysinfo", sysinfoService.selectInfo());
		return "back/sysinfo/edit";
	}
	
	@RequestMapping(value="/back/edit",method=RequestMethod.POST)
	public String edit(@Valid @ModelAttribute Sysinfo sysinfo,BindingResult result,HttpServletRequest request){
		
		if(result.hasErrors()){
			return "back/sysinfo/edit";
		}
		
		sysinfoService.update(sysinfo);
		
		request.getServletContext().setAttribute("sysinfo", sysinfo);
		return "back/sysinfo/edit";
	}


}
