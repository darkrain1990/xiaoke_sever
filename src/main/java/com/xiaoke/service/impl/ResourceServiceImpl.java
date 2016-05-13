package com.xiaoke.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.sf.json.JSONObject;

import com.xiaoke.entity.Resource;
import com.xiaoke.entity.qo.SysResourceQO;
import com.xiaoke.entity.qo.TreeSysResource;
import com.xiaoke.entity.vo.PageBean;
import com.xiaoke.mapper.ResourceMapper;
import com.xiaoke.service.ResourceService;

/**
 * @author fangyun
 * 
 * */
@Service
public class ResourceServiceImpl implements ResourceService{

	@Autowired
	private ResourceMapper mapper;
	
	
	@Override
	public PageBean<Resource> searchResource(SysResourceQO sq) {
		// TODO Auto-generated method stub
		//计算起始行及结束行
		sq.calculateBeginRowAndEndRow();
		
		int total=mapper.findTotal(sq);
		List<Resource> resource=mapper.searchResource(sq);
		PageBean<Resource> page=new PageBean<Resource>(total, resource);
		
		return page;
	}

	@Override
	public JSONObject addResource(Resource res) {
		// TODO Auto-generated method stub
		
		JSONObject json=new JSONObject();
		int result=mapper.addResource(res);
		if(result>0){
			json.put("result", "SUCCESS");
		}else{
			json.put("result", "FAILURE");
		}
		return json;
	}

	@Override
	public JSONObject deleResource(String id) {
		// TODO Auto-generated method stub
		JSONObject json=new JSONObject();
		int result=mapper.deleResource(id);
		if(result>0){
			json.put("result", "SUCCESS");
		}else{
			json.put("result", "FAILURE");
		}
		return json;
	}

	@Override
	public JSONObject updateResource(Resource res) {
		// TODO Auto-generated method stub
		JSONObject json=new JSONObject();
		int result=mapper.updateResource(res);
		System.out.println(result+"-------------");
		if(result>0){
			json.put("result", "SUCCESS");
		}else{
			json.put("result", "FAILURE");
		}
		return json;
	}

	/**
	 * @author fangyun
	 * @date 
	 * */

	@Override
	public List<TreeSysResource> seeResources(int systemId) {
		// TODO Auto-generated method stub
		List<TreeSysResource> tree=new ArrayList<TreeSysResource>();
		
		List<Resource> res=mapper.seeResources(systemId);
		for(int i=0;i<res.size();i++){
			Resource re=res.get(i);
			int id=re.getId();
			int pId=re.getParentId();
			String name=re.getResourceName();
			TreeSysResource TreeSys=new TreeSysResource(id, pId,name );
			tree.add(TreeSys);
		}
		return tree;
	}
	

	
}
