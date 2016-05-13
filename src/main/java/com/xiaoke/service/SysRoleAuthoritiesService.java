package com.xiaoke.service;

import com.xiaoke.entity.SysRoleAuthorities;
import com.xiaoke.entity.vo.SysAuthorities;
import net.sf.json.JSONObject;

import java.util.List;

public interface SysRoleAuthoritiesService {
	
	/**
	 * 获取当前系统的所有权限并显示
	 * @author fangyun
	 * */
	List<SysAuthorities> findAuthorities(int systemId);
	/**
	 * 给角色添加权限
	 * @author fangyun
	 * */
	JSONObject addRoleAuthorities(SysRoleAuthorities ur);
	
	/**
	 * 给角色删除权限
	 * @author fangyun
	 */
	JSONObject delRoleAuthorities(SysRoleAuthorities ur); 
	/**
	 * 查询当前角色所有的权限
	 * */
	JSONObject selrole(SysRoleAuthorities sys);
}
