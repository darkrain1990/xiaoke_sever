package com.xiaoke.service.impl;

import com.xiaoke.entity.SysUsersRoles;
import com.xiaoke.mapper.SysUsersRolesMapper;
import com.xiaoke.service.SysUsersRolesService;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

//@Service("sysUsersRolesService")
@Service
public class SysUsersRolesServiceImpl implements SysUsersRolesService {
	
	@Autowired
	private SysUsersRolesMapper sysUsersRolesMapper;

	/**
	 * 添加SysUsersRoles
	 * @author Xuwangshen
	 * @Date 2016年3月25日 下午5:07:01
	 */
	public JSONObject addUsersRoles(SysUsersRoles ur) {
		JSONObject json = new JSONObject();
		int count = sysUsersRolesMapper.addUsersRoles(ur);
		if(count>0){
			json.put("result", "SUCCESS");
		}else{
			json.put("result", "FAILURE");
		}
		return json;
	}

	/**
	 * 删除SysUsersRoles
	 * @author Xuwangshen
	 * @Date 2016年3月25日 下午5:07:01
	 */
	public JSONObject delUsersRoles(SysUsersRoles ur) {
		JSONObject json = new JSONObject();
		int count = sysUsersRolesMapper.delUsresRoles(ur);
		if(count>0){
			json.put("result", "SUCCESS");
		}else{
			json.put("result", "FAILURE");
		}
		return json;
	}

}
