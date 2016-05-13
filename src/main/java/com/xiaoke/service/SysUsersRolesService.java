package com.xiaoke.service;

import com.xiaoke.entity.SysUsersRoles;

import net.sf.json.JSONObject;

public interface SysUsersRolesService {
	
	/**
	 * 添加SysUsersRoles
	 * @author wwh
	 * @Date 2016年3月25日 下午5:07:01
	 */
	JSONObject addUsersRoles(SysUsersRoles ur);
	
	/**
	 * 删除SysUsersRoles
	 * @author wwh
	 * @Date 2016年3月25日 下午5:07:01
	 */
	JSONObject delUsersRoles(SysUsersRoles ur);

}
