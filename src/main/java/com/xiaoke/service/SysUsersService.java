package com.xiaoke.service;

import java.util.List;

import net.sf.json.JSONObject;

import com.xiaoke.entity.SysUsers;
import com.xiaoke.entity.SysUsersRoles;
import com.xiaoke.entity.qo.SysAuthorityResourceQO;
import com.xiaoke.entity.qo.SysRolesAuthoritiesQO;
import com.xiaoke.entity.qo.SysUsersQO;

public interface SysUsersService {

	/**
	 * 条件查询SysUsers分页对象
	 * 
	 * @param param 条件对象
	 * 
	 * @author wwh
	 * @Date 2016年3月16日 下午2:05:12
	 */
	JSONObject findSysUsersByCondition(SysUsersQO param);
	
	/**
	 * 添加用户
	 * 
	 * @param user
	 * @return 受影响行数
	 * 
	 * @author wwh
	 * @Date 2016年3月16日 下午3:09:07
	 */
	JSONObject addUser(SysUsers user);
	
	/**
	 * 修改用户
	 * @param user
	 * @return 
	 * 
	 * @author wwh
	 * @Date 2016年3月18日 上午10:17:31
	 */
	JSONObject updateUser(SysUsersQO user);
	
	/**
	 * 根据id删除用户
	 * @param id
	 * @return 受影响行数
	 * 
	 * @author wwh
	 * @Date 2016年3月18日 下午2:56:17
	 */
	JSONObject delUserById(Integer id);
	
	/**
	 * 根据id获取用户
	 * 
	 * @param id
	 * 
	 * @author wwh
	 * @Date 2016年3月18日 下午4:50:58
	 */
	JSONObject findUserById(Integer id);
	
	/**
	 * 登录验证
	 * @param user
	 * @return
	 * @author wwh
	 * @Date 9:54 AM 2016.3.24
	 */
	SysUsers checkUserLogin(SysUsers user);
	
	/**
	 * 获取角色根据登录对象
	 * @param user
	 * @return
	 * @author wwh
	 * @Date 2:05 PM 2016.3.24
	 */
	List<SysUsersRoles> findRolesByUser(SysUsers user);

	/**
	 * 根据角色获取权限
	 * @param user
	 * @return
	 * @author wwh
	 * @Date 2:05 PM 2016.3.24
	 */
	List<SysRolesAuthoritiesQO> findAuthByRoles(Integer role_id);
	
	/**
	 * 根据权限获取资源
	 * @param user
	 * @return
	 * @author wwh
	 * @Date 2:05 PM 2016.3.30
	 */
	List<SysAuthorityResourceQO> findResByAu(Integer au_id);
	
}
