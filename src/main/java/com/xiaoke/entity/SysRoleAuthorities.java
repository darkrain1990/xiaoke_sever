package com.xiaoke.entity;

public class SysRoleAuthorities {
	private int roleId;
	private Integer AuthorityId;
	
	public SysRoleAuthorities(){
		super();
	}
	
	public SysRoleAuthorities(int roleId, Integer authorityId) {
		super();
		this.roleId = roleId;
		AuthorityId = authorityId;
	}
	public int getRoleId() {
		return roleId;
	}
	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}
	public Integer getAuthorityId() {
		return AuthorityId;
	}
	public void setAuthorityId(Integer authorityId) {
		AuthorityId = authorityId;
	}
	
	
}
