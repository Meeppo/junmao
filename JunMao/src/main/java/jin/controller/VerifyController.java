package jin.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import jin.base.util.verifycode.VerifyCode;

@Controller
@RequestMapping("/verify")
public class VerifyController {
	
	@RequestMapping("/code/get")
	@ResponseBody
	public byte[] getVerifyCode(HttpSession session){
		
		VerifyCode vcode = VerifyCode.instance();
		 //生成校验码放入session中
        session.setAttribute("verifycode", vcode.getCode());
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        try {
			ImageIO.write(vcode.getImage(), "JPEG", baos);
		} catch (IOException e) {
			e.printStackTrace();
		}
        return baos.toByteArray();
	}
}
