package com.xiaoke.entity;

import java.util.Date;

import com.xiaoke.common.util.EncryptionUtil;

public class SysUsers {

	private Integer id;				//用户id
	private String loginName;		//登录名
	private String userName;		//用户姓名
	private String userPassword;	//用户密码
	private String userDesc;		//用户描述
	private Integer enabled;		//是否可用， 可用：1  不可以：0
	private Integer issys;			//是否为超级用户， 超级用户：1  普通用户：0
	private String userDept;		//所在单位
	private String userDuty;		//经理或主任
	private String email;			//邮箱地址
	private Integer systemId;			//所属系统
	private String mobileNum;		//手机号
	private Integer flag;			//是否删除， 删除：0 非删除：1
	private Date createDate;		//创建时间
	
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public String getLoginName() {
		return loginName;
	}
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getUserDesc() {
		return userDesc;
	}
	public void setUserDesc(String userDesc) {
		this.userDesc = userDesc;
	}
	public Integer getEnabled() {
		return enabled;
	}
	public void setEnabled(Integer enabled) {
		this.enabled = enabled;
	}
	public Integer getIssys() {
		return issys;
	}
	public void setIssys(Integer issys) {
		this.issys = issys;
	}
	public String getUserDept() {
		return userDept;
	}
	public void setUserDept(String userDept) {
		this.userDept = userDept;
	}
	public String getUserDuty() {
		return userDuty;
	}
	public void setUserDuty(String userDuty) {
		this.userDuty = userDuty;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMobileNum() {
		return mobileNum;
	}
	public void setMobileNum(String mobileNum) {
		this.mobileNum = mobileNum;
	}
	public Integer getFlag() {
		return flag;
	}
	public void setFlag(Integer flag) {
		this.flag = flag;
	}
	public Integer getSystemId() {
		return systemId;
	}
	public void setSystemId(Integer systemId) {
		this.systemId = systemId;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	/**
	 * 初始化 
	 * @author wwh
	 * @Date 2016年3月17日 下午3:34:24
	 */
	public void initialize(){
		String encryptedPassword = EncryptionUtil.encryption(this.userName,this.userPassword);
		setFlag(1);
		setIssys(0);
		setEnabled(1);
		setUserPassword(encryptedPassword);
	}
	
	
}
