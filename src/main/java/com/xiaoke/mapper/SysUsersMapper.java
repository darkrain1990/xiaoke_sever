package com.xiaoke.mapper;

import com.xiaoke.entity.SysUsers;
import com.xiaoke.entity.qo.SysUsersQO;

import java.util.List;
import java.util.Map;

/**
 * SysUser
 * @author wwh
 *
 */
public interface SysUsersMapper {

	/**
	 * 条件查询用户分页对象
	 * 
	 * @param param
	 * @return 分页对象
	 * @author wwh
	 * @Date 2016年3月16日 上午11:05:40
	 */
	List<SysUsers> findSysUsers(SysUsersQO param);
	
	/**
	 * 条件查询记录总数
	 * 
	 * @param param
	 * @author wwh
	 * @Date 2016年3月16日 上午11:16:33
	 */
	int findTotal(SysUsersQO param);
	
	/**
	 * 添加用户
	 * 
	 * @param user 
	 * @return 受影响行数
	 * 
	 * @author wwh
	 * @Date 2016年3月16日 下午3:07:38
	 */
	int addUser(SysUsers user);
	
	/**
	 * 修改用户
	 * 
	 * @param user
	 * @return 受影响行数
	 * 
	 * @author wwh
	 * @Date 2016年3月18日 上午9:52:14
	 */
	int updateUserById(SysUsersQO user);
	
	/**
	 * 根据id删除用户
	 * 
	 * @param id
	 * @return 受影响行数
	 * 
	 * @author wwh
	 * @Date 2016年3月18日 下午2:54:51
	 */
	int delUserById(Integer id);
	
	/**
	 * login
	 * @param user
	 * @return
	 */
	SysUsers userLogin(SysUsers user);
	
	/**
	 * 根据登录用户获取用户角色
	 * @param user
	 * @return
	 */
	List<Map> findAllRoleByLogin(SysUsers user);
}
