package com.xiaoke.service.impl;

import java.util.List;

import net.sf.json.JSONObject;

import org.apache.commons.lang3.Validate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xiaoke.entity.Role;
import com.xiaoke.entity.qo.SysRoleQO;
import com.xiaoke.entity.vo.PageBean;
import com.xiaoke.mapper.RoleMapper;
import com.xiaoke.service.RoleService;

@Service
public class RoleServiceImpl implements RoleService{
	
	@Autowired
	private RoleMapper mapper;

	private final String RESULT = "result";
	private final String SUCCESS = "SUCCESS";
	private final String FAILURE = "FAILURE";
	/**
	 * 条件查询角色分页对象
	 * 
	 * @param param 条件对象
	 * 
	 * @author wwh
	 * @Date 2016年3月16日 
	 */
	public PageBean<Role> searchRoleByCondition(SysRoleQO param) {
		
		//获取分页对象
		param.calculateBeginRowAndEndRow();
		
		int total=mapper.findTotal(param);
	
		List<Role> resource=mapper.searchRoles(param);
		PageBean<Role> page=new PageBean<Role>(total, resource);
		
		return page;
	}
	
	/**
	 * 添加角色
	 * @param roles
	 */
	@Override
	public JSONObject addRoles(Role role) {
		// TODO Auto-generated method stub
		JSONObject json = new JSONObject();
		int result=mapper.addRole(role);
		if(result>0){
			json.put("result", "SUCCESS");
		}else{
			json.put("result", "FAILURE");
		}
		
		return json;
	}
	/**
	 * 删除角色
	 * @param roles
	 */
	@Override
	public JSONObject delRoelById(String id) {
		// TODO Auto-generated method stub
		
		Validate.notBlank(id, "id can't be empty or null");
		JSONObject json = new JSONObject();
		 int num=mapper.delRoleById(id);
		 
		 if(num>0){
				json.put(RESULT, SUCCESS);
			} else{
				
				json.put(RESULT, FAILURE);
			}
			
			return json;
	}
	/**
	 * 修改角色
	 * @author wwh
	 * */
	@Override
	public JSONObject updateRoleById(Role role) {
		// TODO Auto-generated method stub
		JSONObject json = new JSONObject();
		int num=mapper.updateRoleById(role);
		if(num>0){
			json.put(RESULT, SUCCESS);
		} else{
			
			json.put(RESULT, FAILURE);
		}
		return json;
	}


}
