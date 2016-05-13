package com.xiaoke.service.impl;

import com.xiaoke.entity.SysRoleAuthorities;
import com.xiaoke.entity.vo.SysAuthorities;
import com.xiaoke.mapper.SysRoleAuthoritiesMapper;
import com.xiaoke.service.SysRoleAuthoritiesService;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SysRoleAuthoritiesServiceImpl implements SysRoleAuthoritiesService{

	@Autowired
	private SysRoleAuthoritiesMapper mapper;
	
	@Override
	public List<SysAuthorities> findAuthorities(int systemId) {
		// TODO Auto-generated method stub
		List<SysAuthorities> list = mapper.findAuthorities(systemId);
		return list;
	}

	@Override
	public JSONObject addRoleAuthorities(SysRoleAuthorities ur) {
		// TODO Auto-generated method stub
		JSONObject json=new JSONObject();
		int num = mapper.addRoleAuthorities(ur);
		
		if(num > 0){
			json.put("result", "SUCCESS");
		}else{
			json.put("result", "FAILURE");
		}
		return json;
	}

	@Override
	public JSONObject delRoleAuthorities(SysRoleAuthorities ur) {
		// TODO Auto-generated method stub
		JSONObject json=new JSONObject();
		int num = mapper.delRoleAuthorities(ur);
		if(num > 0){
			json.put("result", "SUCCESS");
		}else{
			json.put("result", "FAILURE");
		}
		return json;
	}

	@Override
	public JSONObject selrole(SysRoleAuthorities sys) {
		// TODO Auto-generated method stub
		JSONObject json=new JSONObject();
		List<SysRoleAuthorities> list=mapper.selrole(sys);
		int num=list.size();
		if(num>0){
			json.put("result", true);
		}else{
			json.put("result", false);
		}
		return json;
	}

}
