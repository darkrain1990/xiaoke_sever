package com.xiaoke.mapper;

import com.xiaoke.entity.Role;
import com.xiaoke.entity.qo.SysRoleQO;

import java.util.List;

public interface RoleMapper {
	
	/**
	 * 条件查询角色分页对象
	 * 
	 * @ 
	 * @return 分页对象list集合
	 * @author fangyun
	 * @Date 2016年3月17日 
	 */
	List<Role> searchRoles(SysRoleQO qo);
	/**
	 * 条件查询记录总数
	 * 
	 * @ 
	 * @author fangyun
	 * @Date 2016年3月17日
	 */
	int findTotal(SysRoleQO qo);
	/**
	 * 添加角色
	 * 
	 * @ user 
	 * @return
	 * 
	 * @author fangyun
	 * @Date 2016年3月17日
	 */
	int addRole(Role qo);
	
	/**
	 * 根据id删除角色
	 * 
	 * @ id
	 * @return 修改的行数
	 * 
	 * @author fangyun
	 * @Date 2016年3月20日 
	 */
	int delRoleById(String id);
	
	/**
	 * 修改角色
	 * 
	 * @ user
	 * @return 修改的行数
	 * 
	 * @author fangyun
	 * @Date 2016年3月20日 
	 */
	int updateRoleById(Role role);
	
	/**
	 * 根据系统id获取所有角色
	 * 
	 * @ systemId 系统id
	 * @return 
	 * 
	 * @author Xuwangshen
	 * @Date 2016年3月24日 下午2:00:29
	 */
	List<Role> findRolesBySystemId(Integer systemId);
	
	/**
	 * 根据userId获取该用户所有角色id
	 * 
	 * @ userId 用户id
	 * @return 角色集合
	 * 
	 * @author Xuwangshen
	 * @Date 2016年3月24日 下午4:44:30
	 */
	List<Role> findRoleIdsByUserId(String userId);
	
}
