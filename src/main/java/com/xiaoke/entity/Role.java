package com.xiaoke.entity;
/**
 * 角色实体类
 * @author wwh
 *
 */
public class Role {
	private String id;//角色id
	private String roleName;//角色名
	private String roleDesc;//角色描述
	private Integer enabled;//是否可用
	private Integer issys;//是否是超级用户
	private Integer flag;//是否删除 0 删除 ， 1 存在
	private Integer systemId;	//系统id
	
	public Integer getFlag() {
		return flag;
	}

	public void setFlag(Integer flag) {
		this.flag = flag;
	}

	public Role(){
		super();
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public String getRoleDesc() {
		return roleDesc;
	}
	public void setRoleDesc(String roleDesc) {
		this.roleDesc = roleDesc;
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

	public Integer getSystemId() {
		return systemId;
	}

	public void setSystemId(Integer systemId) {
		this.systemId = systemId;
	}

	public Role(String roleName, String roleDesc, Integer enabled,
			Integer issys, Integer flag, Integer systemId) {
		super();
		this.roleName = roleName;
		this.roleDesc = roleDesc;
		this.enabled = enabled;
		this.issys = issys;
		this.flag = flag;
		this.systemId = systemId;
	}
	public Role( String roleName, String roleDesc, Integer enabled,
			Integer issys, Integer systemId) {
		super();
		this.roleName = roleName;
		this.roleDesc = roleDesc;
		this.enabled = enabled;
		this.issys = issys;
		this.systemId = systemId;
	}
}
