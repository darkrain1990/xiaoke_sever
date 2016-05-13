package com.xiaoke.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xiaoke.entity.vo.SysAuthorities;
import com.xiaoke.entity.qo.SysAuthoritiesQO;
import com.xiaoke.entity.vo.PageBean;
import com.xiaoke.entity.vo.SysAuthoritiesVO;
import com.xiaoke.mapper.SysAuthoritiesMapper;
import com.xiaoke.service.SysAuthoritiesService;

/**
 * 权限系统-权限
 * @author wwh
 *
 */
@Service
public class SysAuthoritiesServiceImpl implements SysAuthoritiesService{
	
	Logger log = LogManager.getLogger(SysAuthoritiesServiceImpl.class);

	@Autowired
	private SysAuthoritiesMapper sysAuthoritiesMapper;
	
	/**
	 * 根据输入值查询权限
	 * @author wwh
	 * @Date 3:06 PM 2016.3.16
	 */
	public PageBean<SysAuthorities> findAccessByInput(SysAuthoritiesQO param) {
		log.info("---findAccessByInput Start---");
		//计算起始行及结束行
		param.calculateBeginRowAndEndRow();	
		//获取分页对象
		//加入条件 flag=1 
		param.setFlag(1);
		int total = sysAuthoritiesMapper.findAuthTotal(param);
		List<SysAuthorities> author = sysAuthoritiesMapper.findAuth(param);
		PageBean<SysAuthorities> page = new PageBean<SysAuthorities>(total, author);
		log.info("---findAccessByInput End---");
		return page;
	}

	/**
	 * 新增权限
	 * @author wwh
	 * @Date 5:02 PM 2016.3.17
	 */
	@Override
	public String addAuthority(SysAuthorities auth) {
		// TODO Auto-generated method stub
		log.info("---addAuthority Start---");
		String result = null;
		try{
			SysAuthoritiesQO qo = new SysAuthoritiesQO();
			qo.setSysAuthorityName(auth.getAuthority_name());
			qo.setSystem_id(auth.getSystem_id());
			qo.setFlag(1);
			//验证同系统下权限名称是否存在
			int count = sysAuthoritiesMapper.findAuthTotal(qo);
			if(count > 0){//该权限名称在同一系统下已存在
				result = "该权限名称在同一系统下已存在";
				log.info(result);
				return result;
			}
			
			int num = sysAuthoritiesMapper.addAuth(auth);
			if(num == 1){
				result = "SUCCESS";
			}else{
				result = "新增失败！";
			}
		}catch(Exception e){
			log.error(e);
			log.error(e.getMessage());
			result = "新增失败！"+e.getMessage();
			e.printStackTrace();
			return result;
		}
		log.info(result);
		log.info("---addAuthority End---");
		return result;
	}

	/**
	 * 删除权限
	 * @author wwh
	 * @Date 10:44 AM 2016.3.21
	 */
	@Override
	public String delAuthority(SysAuthorities auth) {
		// TODO Auto-generated method stub
		log.info("---delAuthority Start---");
		String result = null;
		try{
			int num = sysAuthoritiesMapper.delAuth(auth);
			if(num > 0){
				result = "SUCCESS";
			}else{
				result = "删除失败！";
			}
		}catch(Exception e){
			log.error(e);
			log.error(e.getMessage());
			result = "删除失败！"+e.getMessage();
			e.printStackTrace();
			return result;
		}
		log.info(result);
		log.info("---delAuthority End---");
		return result;
	}

	/**
	 * 更新权限
	 * @author wwh
	 * @Date 2:16 PM 2016.3.22
	 */
	@Override
	public String updAuthority(SysAuthorities auth) {
		// TODO Auto-generated method stub
		log.info("---updAuthority Start---");
		String result = null;
		try{
			
			SysAuthoritiesQO qo = new SysAuthoritiesQO();
			qo.setSysAuthorityName(auth.getAuthority_name());
			qo.setSystem_id(auth.getSystem_id());
			qo.setFlag(1);
			//判断传入的name是否在同一系统下存在
			List<SysAuthorities> sa = sysAuthoritiesMapper.FAuth(qo);
			if(sa.size()>0){
				if((sa.get(0).getId() != auth.getId()) && (!sa.get(0).getId().equals(auth.getId()))){
					result = "该权限在同一系统下已存在!";
					log.info(result);
					return result;
				}
			}
				
			int num = sysAuthoritiesMapper.updAuth(auth);
			if(num > 0){
				result = "SUCCESS";
			}else{
				result = "更新失败!";
			}
		}catch(Exception e){
			log.info(e);
			log.info(e.getMessage());
			log.info("更新失败！"+e.getMessage());
			e.printStackTrace();
			return result;
		}
		log.info(result);
		log.info("---updAuthority End---");
		return result;
	}	
	
	/**
	 * 查询此权限所在系统下的所有资源
	 * @author  XuFei
	 */
	@Override
	public List<SysAuthoritiesVO> searchResource(String systemId) {
		List<SysAuthoritiesVO> sysauthlist = new ArrayList<SysAuthoritiesVO>();
		try {
			if(systemId!=""){
				sysauthlist = sysAuthoritiesMapper.searchResource(systemId);
				if(sysauthlist.size()>0){
					System.out.println(sysauthlist);
				}
			}
		} catch (Exception e) {
			
		}
		return sysauthlist;
	}

	/**
	 * 查询此权限-在所在系统下的-所有资源中-已拥有的资源
	 * @author  XuFei
	 */
	@Override
	public List<SysAuthoritiesVO> searchResourceSelect(Map map) {
		List<SysAuthoritiesVO> authistselect = new ArrayList<SysAuthoritiesVO>();
		try {
			if(map!=null&&map.size()>0){
				authistselect = sysAuthoritiesMapper.searchResourceSelect(map);
				if(authistselect.size()>0){
					System.out.println(authistselect);
				}
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			log.info(e.getMessage());
		}
		return authistselect;
	}
}
