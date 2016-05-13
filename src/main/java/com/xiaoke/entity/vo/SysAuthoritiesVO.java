package com.xiaoke.entity.vo;
/**
 * 
 * 权限管理-设置资源
 * @author XuFei
 *
 */
public class SysAuthoritiesVO {

	private String authorityId;//权限id
	private String authorityName;//权限名称
	private String resourceId;//资源id
	private String parentId;//父级资源id
	private String resourceName;//资源名称
	private String sysId;//系统id
	private String sysName;//系统名称
	
	
	public String getAuthorityId() {
		return authorityId;
	}
	public void setAuthorityId(String authorityId) {
		this.authorityId = authorityId;
	}
	public String getAuthorityName() {
		return authorityName;
	}
	public void setAuthorityName(String authorityName) {
		this.authorityName = authorityName;
	}
	public String getResourceId() {
		return resourceId;
	}
	public void setResourceId(String resourceId) {
		this.resourceId = resourceId;
	}
	public String getParentId() {
		return parentId;
	}
	public void setParentId(String parentId) {
		this.parentId = parentId;
	}
	public String getResourceName() {
		return resourceName;
	}
	public void setResourceName(String resourceName) {
		this.resourceName = resourceName;
	}
	public String getSysId() {
		return sysId;
	}
	public void setSysId(String sysId) {
		this.sysId = sysId;
	}
	public String getSysName() {
		return sysName;
	}
	public void setSysName(String sysName) {
		this.sysName = sysName;
	}
	
	public SysAuthoritiesVO() {
		super();
	}
}