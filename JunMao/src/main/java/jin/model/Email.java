package jin.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.DynamicInsert;


@Entity(name="email")
@DynamicInsert
public class Email {
	
	/**
	 * 同一session多次提交，需输入验证码
	 */
	public static String MUTIPART_POST = "multipart_post";
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	@Column(name="username")
	private String username;
	
	@Column(name="email")
	@org.hibernate.validator.constraints.Email(message="请输入正确的邮箱！")
	private String email;
	
	@Column(name="phone")
	private String phone;
	
	@Column(name="remark")
	private String remark;
	
	/**
	 * 校验码
	 * 只有触发多次提交事件时才需填写
	 */
	private transient String verifyCode;
	
	
	private Date createddate;
	private Long createdby;
	private Date updatedate;
	private Long updatedby;
	private Character deleteflag;
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getVerifyCode() {
		return verifyCode;
	}

	public void setVerifyCode(String verifyCode) {
		this.verifyCode = verifyCode;
	}
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "createddate", length = 19)
	public Date getCreateddate() {
		return this.createddate;
	}

	public void setCreateddate(Date createddate) {
		this.createddate = createddate;
	}

	@Column(name = "createdby")
	public Long getCreatedby() {
		return this.createdby;
	}

	public void setCreatedby(Long createdby) {
		this.createdby = createdby;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "updatedate", length = 19)
	public Date getUpdatedate() {
		return this.updatedate;
	}

	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}

	@Column(name = "updatedby")
	public Long getUpdatedby() {
		return this.updatedby;
	}

	public void setUpdatedby(Long updatedby) {
		this.updatedby = updatedby;
	}

	@Column(name = "deleteflag", length = 1)
	public Character getDeleteflag() {
		return this.deleteflag;
	}

	public void setDeleteflag(Character deleteflag) {
		this.deleteflag = deleteflag;
	}
	
}
