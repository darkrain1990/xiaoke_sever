package com.xiaoke.entity;

/**
 * 用户和角色关联关系类
 * @author Xuwangshen
 *
 */
public class SysUsersRoles {

	private Integer userId;		
	private Integer roleId;
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Integer getRoleId() {
		return roleId;
	}
	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}
	public SysUsersRoles(Integer userId, Integer roleId) {
		super();
		this.userId = userId;
		this.roleId = roleId;
	}
	public SysUsersRoles() {
		super();
	}
	
	
}
