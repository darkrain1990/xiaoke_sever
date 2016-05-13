package com.xiaoke.mapper;

import com.xiaoke.entity.qo.SysAuthoritiesQO;
import com.xiaoke.entity.vo.SysAuthorities;
import com.xiaoke.entity.vo.SysAuthoritiesVO;

import java.util.List;
import java.util.Map;

/**
 * 权限系统-权限
 * @author wwh
 *
 */
public interface SysAuthoritiesMapper {

	/**
	 * 根据输入框查询权限
	 * @param
	 * @return
	 * @author wwh
	 * @Date 1:45 PM　2016.3.17
	 */
	List<SysAuthorities> findAuth(SysAuthoritiesQO param);
	
	/**
	 * 查找总条数
	 * @param
	 * @return
	 * @author wwh
	 * @Date 1:44 PM　2016.3.17
	 */
	int findAuthTotal(SysAuthoritiesQO param);
	
	/**
	 * 添加权限
	 * @param
	 * @return
	 * @author wwh
	 * @Date 1:44 PM　2016.3.17
	 */
	int addAuth(SysAuthorities author);
	
	/**
	 * 删除权限
	 * @param
	 * @return
	 * @author wwh
	 * @Date 10:44 AM　2016.3.21
	 */
	int delAuth(SysAuthorities author);
	
	/**
	 * 更新权限
	 * @param
	 * @return
	 * @author wwh
	 * @Date 2:16 PM　2016.3.22
	 */
	int updAuth(SysAuthorities author);
	
	/**
	 * 确认无重复name
	 * @param
	 * @return
	 * @author wwh
	 * @Date 15:11 PM　2016.3.22
	 */
	List<SysAuthorities> FAuth(SysAuthoritiesQO param);
	
	/**
	 * 根据角色获取权限
	 * @param 
	 * @return
	 * @author wwh
	 * @Date 4:11 PM　2016.3.28
	 */
	List<Map> findAuthByRoles(Integer role_id);
	
	/**
	 * 根据权限获取资源
	 * @param 
	 * @return
	 * @author wwh
	 * @Date 4:11 PM　2016.3.30
	 */
	List<Map> findResByAu(Integer au_id);
	
	/**
	 * 查询此权限所在系统下的所有资源
	 * @author XuFei
	 * @param systemId
	 * @return
	 */
	public List<SysAuthoritiesVO> searchResource(String systemId);
	/**
	 * 查询此权限-在所在系统下的-所有资源中-已拥有的资源
	 * @author XuFei
	 * @param map
	 * @return
	 */
	public List<SysAuthoritiesVO> searchResourceSelect(Map map);
}
