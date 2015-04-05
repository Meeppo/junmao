package jin.base.util.verifycode;

import java.awt.image.BufferedImage;

/**
 * 校验码
 * 
 * @author Jin
 *
 */
public class VerifyCode {

	public VerifyCode() {
		super();
	}
	
	/**
	 * 创建校验码
	 * @return
	 */
	public static VerifyCode instance() {
		AbstractCodeGenerator generator = new AbstractCodeGenerator();
		return instance(generator);
	}
	/**
	 * 根据指定校验器创建校验码
	 * @param codeGenerator
	 * @return
	 */
	public static VerifyCode instance(CodeGenerator codeGenerator) {
		try {
			return codeGenerator.generate();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	private String code;
	private BufferedImage image;

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public BufferedImage getImage() {
		return image;
	}

	public void setImage(BufferedImage image) {
		this.image = image;
	}
}
