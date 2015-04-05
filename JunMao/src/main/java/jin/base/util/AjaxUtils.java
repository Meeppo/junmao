package jin.base.util;

import javax.servlet.http.HttpServletRequest;

/*
 * 	示例：
 * 	@ModelAttribute
	public void ajaxAttribute(WebRequest request, Model model) {
		model.addAttribute("ajaxRequest", AjaxUtils.isAjaxRequest(request));
	}
	将该段加入controller在每个方法执行前会执行该方法，并在model中添加ajaxRequest属性，若某个方法需判断请求类型，只需
	查看ajaxRequest属性即可。
 */
public class AjaxUtils {

	public static boolean isAjaxRequest(HttpServletRequest Request) {
		String requestedWith = Request.getHeader("X-Requested-With");
		return requestedWith != null ? "XMLHttpRequest".equals(requestedWith) : false;
	}

	private AjaxUtils() {}

}