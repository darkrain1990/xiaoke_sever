package com.xiaoke.mapper;

import com.xiaoke.entity.SysUsersRoles;

import java.util.List;

public interface SysUsersRolesMapper {
	
	/**
	 * 根据user_id查询role_id
	 * @param
	 * @return List
	 * @author ZhaoMengYuan
	 * @Date 3:55 PM 2016.3.28
	 */
	List<SysUsersRoles> findRoleByUser(SysUsersRoles s);

	/**
	 * 添加
	 * @author Xuwangshen
	 * @Date 2016年3月25日 下午4:45:47
	 */
	int addUsersRoles(SysUsersRoles ur);
	
	/**
	 * 删除
	 * @author Xuwangshen
	 * @Date 2016年3月25日 下午5:03:14
	 */
	int delUsresRoles(SysUsersRoles ur);
	
}