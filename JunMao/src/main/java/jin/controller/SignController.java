package jin.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jin.base.util.Cookies;
import jin.base.util.StringUtils;
import jin.model.Admin;
import jin.service.admin.AdminServiceI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 用户登录控制器
 * @author Jin
 *
 */
@Controller
@RequestMapping("/sign")
public class SignController {
	@Autowired
	private AdminServiceI adminService;
	
	@RequestMapping(value="/back/in", method=RequestMethod.GET)
	public String toSignIn(@ModelAttribute Admin admin,HttpServletRequest request,Model model){
		
		Cookies cookies = new Cookies();
		cookies.request = request;
		Cookie cookie = cookies.getCookie("user_login");
		if(cookie !=null){
			String[] value= cookie.getValue().split("-");
			admin.setName(value[0]);
			admin.setPassword(value[1]);
			model.addAttribute("remember_me", "yes");
		}
		
		return "back/sign-in";
	}
	
	@RequestMapping(value="/back/in", method=RequestMethod.POST)
	public String signIn(@ModelAttribute Admin admin,BindingResult result,HttpSession session,String verifyCode,String remember ,HttpServletRequest request,HttpServletResponse response){
		
		Admin seriAdmin = adminService.selectByName(admin.getName());
		if(seriAdmin == null){
			result.rejectValue("name", "", "用户名不存在");
			return "back/sign-in";
		}else {
			Integer sign_fail_count =  (Integer) session.getAttribute("sign_fail_count");
			if(!seriAdmin.getPassword().equals(admin.getPassword())){
				result.rejectValue("password", "","密码错误");
				//记录错误次数
				session.setAttribute("sign_fail_count",sign_fail_count == null?1:++sign_fail_count );
				return "back/sign-in";
			}
			if(sign_fail_count != null && sign_fail_count > 3){
				String generCode = (String) session.getAttribute("verifycode"); 
				if(StringUtils.isEmpty(generCode) || !generCode.equals(verifyCode)){
					result.rejectValue("","","校验码错误");
					return "back/sign-in";
				}
			}
			
		}
		//设置user session
		session.setAttribute("admin", seriAdmin);
		//登陆成功，重置错误计数
		session.setAttribute("sign_fail_count",null);
		//设置cookie
		Cookies cookies = new Cookies();
		cookies.request = request;
		cookies.response = response;
		if("yes".equals(remember)){
			cookies.addCookie("user_login", admin.getName()+"-"+admin.getPassword());
		}else{
			cookies.removeCookie("user_login");
		}
		
		return "redirect:/nav/back/index";
	}
	
	
	@RequestMapping("/back/out")
	public String signOut(HttpSession session){
		session.invalidate();
		return "redirect:/sign/back/in";
	}
}
