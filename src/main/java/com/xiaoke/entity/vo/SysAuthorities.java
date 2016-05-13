package com.xiaoke.entity.vo;

public class SysAuthorities{

	/**
	 * 权限id
	 */
	private Integer id;
	/**
	 * 权限名称
	 */
	private String authority_name;
	/**
	 * 权限描述
	 */
	private String authority_desc;
	/**
	 * 是否启用    默认0   0禁用
	 */
	private Integer enabled;
	/**
	 * 是否超级权限  默认0  
	 */
	private Integer issys;
	/**
	 * 所属系统
	 */
	private String systemId;
	private Integer system_id;
	/**
	 * 标识符
	 */
	private Integer flag;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getAuthority_name() {
		return authority_name;
	}
	public void setAuthority_name(String authority_name) {
		this.authority_name = authority_name;
	}
	public String getAuthority_desc() {
		return authority_desc;
	}
	public void setAuthority_desc(String authority_desc) {
		this.authority_desc = authority_desc;
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
	public String getSystemId() {
		return systemId;
	}
	public void setSystemId(String systemId) {
		this.systemId = systemId;
	}
	public Integer getSystem_id() {
		return system_id;
	}
	public void setSystem_id(Integer system_id) {
		this.system_id = system_id;
	}
	public Integer getFlag() {
		return flag;
	}
	public void setFlag(Integer flag) {
		this.flag = flag;
	}
	
	
	public SysAuthorities() {
		super();
	}
	public SysAuthorities(String authority_name,
			String authority_desc, Integer enabled, Integer issys,
			Integer system_id, Integer flag) {
		super();
		this.authority_name = authority_name;
		this.authority_desc = authority_desc;
		this.enabled = enabled;
		this.issys = issys;
		this.system_id = system_id;
		this.flag = flag;
	}
	
}
