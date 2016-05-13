package com.xiaoke.service;

import com.xiaoke.entity.qo.SysAuthoritiesQO;
import com.xiaoke.entity.vo.PageBean;
import com.xiaoke.entity.vo.SysAuthorities;
import com.xiaoke.entity.vo.SysAuthoritiesVO;

import java.util.List;
import java.util.Map;

/**
 * 权限系统-权限
 * @author wwh
 *
 */
public interface SysAuthoritiesService {
	
	/**
	 * 条件查询SysAuthorities分页对象
	 * @param param 条件对象
	 * @author wwh
	 * @Date 1:39 PM 2016.3.17
	 */
	PageBean<SysAuthorities> findAccessByInput(SysAuthoritiesQO param);
	
	/**
	 * 新增权限
	 * @param auth 实体对象
	 * @author wwh
	 * @Date 5:00 PM 2016.3.17
	 */
	String addAuthority(SysAuthorities auth);
	
	/**
	 * 删除权限
	 * @param auth 实体对象
	 * @author wwh
	 * @Date 10:44 AM 2016.3.21
	 */
	String delAuthority(SysAuthorities auth);
	
	/**
	 * 更新权限
	 * @param auth 实体对象
	 * @author wwh
	 * @Date 2:16 PM 2016.3.22
	 */
	String updAuthority(SysAuthorities auth);
	
	/**
	 * 查询此权限所在系统下的所有资源
	 * @author XuFei
	 * @param systemId
	 * @return
	 */
	List<SysAuthoritiesVO> searchResource(String systemId);
	/**
	 * 查询此权限-在所在系统下的-所有资源中-已拥有的资源
	 * @author XuFei
	 * @param map
	 * @return
	 */
	List<SysAuthoritiesVO> searchResourceSelect(Map map);
}
