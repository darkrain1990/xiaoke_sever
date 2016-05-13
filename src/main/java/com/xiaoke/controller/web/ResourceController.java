package com.xiaoke.controller.web;

import com.xiaoke.entity.Resource;
import com.xiaoke.entity.qo.SysResourceQO;
import com.xiaoke.entity.qo.TreeSysResource;
import com.xiaoke.entity.vo.PageBean;
import com.xiaoke.service.ResourceService;
import net.sf.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/resource")
public class ResourceController {
	
	@Autowired
	private  ResourceService resourceService;

	
	Logger logger = LoggerFactory.getLogger(SysUsersController.class);
	/**
	 * 显示资源分页对象
	 * @author fangyun
	 * @throws UnsupportedEncodingException 
	 * @Date 2016年3月17日 
	 */
	@RequestMapping("/searchResource")
	@ResponseBody
	public String searchResource(int index,int pageSize,String resourceName, int systemId) throws UnsupportedEncodingException{
		//解决编码问题
		String rName=new String(resourceName.getBytes("iso-8859-1"),"utf-8");
		
		
		SysResourceQO sq=new SysResourceQO(index,pageSize,rName,systemId);
		PageBean<Resource> page=resourceService.searchResource(sq);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pageTotal", page.getPageTotal());
		map.put("index", index);
		
		
//		System.out.println("搞笑呢-----------------");
		List<Resource> res=page.getList();
		
		map.put("resources", res);
		
		JSONObject json = JSONObject.fromObject(map);
		return json.toString();
	}
	/**
	 * 添加资源
	 * @author fangyun
	 * @Date 2016年3月18日 
	 */
	@RequestMapping("/add")
	@ResponseBody
	public String addResource(String resourceName, int systemId,
			String resourceDesc, String resourceType, String resourceString,
			Integer priority, Integer enable, Integer issys, int parentId,
			String rootId, Integer sortIndex, String imgageUrl, Integer isChild) throws UnsupportedEncodingException{
		//设置编码格式

		String rName=new String(resourceName.getBytes("iso-8859-1"),"utf-8");
		String rDesc=new String(resourceDesc.getBytes("iso-8859-1"),"utf-8");
		String rType=new String(resourceType.getBytes("iso-8859-1"),"utf-8");
		String rString=new String(resourceString.getBytes("iso-8859-1"),"utf-8");
		String rId=new String(rootId.getBytes("iso-8859-1"),"utf-8");
		String rImg=new String(imgageUrl.getBytes("iso-8859-1"),"utf-8");
	
		
//		String id=EncryptionUtil.getUUID();//添加主键
		
		Resource res=new Resource(rName,systemId,rDesc,rType,rString,priority,enable,issys,parentId,rId,sortIndex,rImg,isChild);
		
		JSONObject json =resourceService.addResource(res);
		
		return json.toString();
	}
	
	/**
	 * 刪除资源
	 * @author fangyun
	 * @Date 2016年3月22日 
	 */
	@RequestMapping("/dele/{id}")
	@ResponseBody
	public String deleResource(@PathVariable String id){
		JSONObject json =  new JSONObject();
		
		try {
			json=resourceService.deleResource(id);
		} catch (Exception e) {
			logger.error(e.getMessage());
			json.put("ERROR", "服务器异常 error_code(500)");
		}
		return json.toString();
	}
	/**
	 * 修改资源
	 * @author fangyun
	 * @throws UnsupportedEncodingException 
	 * @Date 2016年3月22日 
	 */
	
	@RequestMapping("/update")
	@ResponseBody
	public String updateResource(int id,String resourceName, int systemId,String resourceDesc,int enable,int issys) throws UnsupportedEncodingException{
		//String ri=new String(id.getBytes("iso-8859-1"),"utf-8");
		String rName=new String(resourceName.getBytes("iso-8859-1"),"utf-8");
		String rd=new String(resourceDesc.getBytes("iso-8859-1"),"utf-8");
		
		JSONObject json =  new JSONObject();
		Resource res=new Resource(id,rName,systemId,rd,enable,issys);
		
		try {
			json=resourceService.updateResource(res);
		} catch (Exception e) {
			e.printStackTrace();
			json.put("ERROR", "服务器异常 error_code(500)");
		}
		
		return json.toString();
	}
	/**
	 * 资源预览展示树形结构
	 * @author fangyun
	 * @Date 2016年3月25日 
	 */
	@RequestMapping("/see/{systemId}")
	@ResponseBody
	public String seeResources(@PathVariable int systemId){
		/*
		 * 3：var nodes = [
								{id:1, pId:0, name: "父节点1"},
								{id:11, pId:1, name: "子节点1"},
								{id:12, pId:1, name: "子节点2"}
						  ];
		 * 4：resourceService
		 * */
		JSONObject json =  new JSONObject();
		
		List<Map> list=new ArrayList<Map>();
		
			//取出当前系统下的所有资源
			List<TreeSysResource> modelL=resourceService.seeResources(systemId);
			
			if(modelL != null){
				for(int num=0;num<modelL.size();num++){
						Map map=new HashMap();
						TreeSysResource trss=modelL.get(num);
						map.put("id", trss.getId());
						
						map.put("name", trss.getName());
						
						map.put("pId", trss.getpId());
						list.add(map);
					}
			}
			
		
		json.put("nodes", list);
		
		return json.toString();
		
	}
	
}
