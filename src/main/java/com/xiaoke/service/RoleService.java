package com.xiaoke.service;

import net.sf.json.JSONObject;

import com.xiaoke.entity.Role;
import com.xiaoke.entity.qo.SysRoleQO;
import com.xiaoke.entity.vo.PageBean;



public interface RoleService {
	/**
	 * 条件查询Roles分页对象
	 * 
	 * @param param 条件对象
	 * 
	 * @author wwh
	 * @Date 2016年3月16日 下午2:05:12
	 */
	PageBean<Role> searchRoleByCondition(SysRoleQO param);

    /**
     * 添加角色
     * @param role
     * @return
     */
	JSONObject addRoles(Role role);

    /**
     * 根据id删除角色
     * @param id
     * @return
     */
	JSONObject delRoelById(String id);
	
	/**
	 * 根据id修改角色
	 * @param role
	 * @return 受影响行数

	 */
	JSONObject updateRoleById(Role role);
	
	
}
