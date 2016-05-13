package com.xiaoke.entity.vo;

public class SysUsersVO {

	private Integer id;				//用户id
	private String loginName;		//登录名
	private String userName;		//用户姓名
	private String userDesc;		//用户描述
	private Integer enabled;		//是否可用， 可用：1  不可以：0
	private Integer issys;			//是否为超级用户， 超级用户：1  普通用户：0
	private String userDept;		//所在单位
	private String userDuty;		//经理或主任
	private String email;			//邮箱地址
	private String mobileNum;		//手机号
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
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
	public SysUsersVO(Integer id, String loginName, String userName,
			String userDesc, Integer enabled, Integer issys, String userDept,
			String userDuty, String email, String mobileNum) {
		super();
		this.id = id;
		this.loginName = loginName;
		this.userName = userName;
		this.userDesc = userDesc;
		this.enabled = enabled;
		this.issys = issys;
		this.userDept = userDept;
		this.userDuty = userDuty;
		this.email = email;
		this.mobileNum = mobileNum;
	}
	public SysUsersVO() {
		super();
	}
	
	
	
}
