package com.xiaoke.mapper;

import com.xiaoke.entity.SysRoleAuthorities;
import com.xiaoke.entity.vo.SysAuthorities;

import java.util.List;

public interface SysRoleAuthoritiesMapper {
	
	/**
	 * 获取当前系统的所有权限并显示
	 * @author fangyun
	 * */
	List<SysAuthorities> findAuthorities(int systemId);
	
	
	/**
	 * 为角色添加权限
	 * @author fangyun
	 * */
	int addRoleAuthorities(SysRoleAuthorities ur);
	
	/**
	 * 为角色删除权限
	 * */
	int delRoleAuthorities(SysRoleAuthorities ur);
	/**
	 * 查询角色所有的权限
	 * */
	List<SysRoleAuthorities> selrole(SysRoleAuthorities sys);
}
