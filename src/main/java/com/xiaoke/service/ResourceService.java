package com.xiaoke.service;

import com.xiaoke.entity.Resource;
import com.xiaoke.entity.qo.SysResourceQO;
import com.xiaoke.entity.qo.TreeSysResource;
import com.xiaoke.entity.vo.PageBean;
import net.sf.json.JSONObject;

import java.util.List;

public interface ResourceService {
	
	/**
	 * 条件查询Resource分页对象
	 * 
	 * @param sq 条件对象
	 * 
	 * @author fangyun
	 * @Date 2016年3月16日 下午2:05:12
	 */
	PageBean<Resource> searchResource(SysResourceQO sq);
	/**
	 * 添加资源
	 * 
	 * @param res
	 * @return
	 * 
	 * @author fangyun
	 * @Date 2016年3月16日 下午3:09:07
	 */
	JSONObject addResource(Resource res);
	/**
	 * 删除资源
	 * 
	 * @param id
	 * @return
	 * 
	 * @author fangyun
	 * @Date 2016年3月22日 
	 */
	JSONObject deleResource(String id);
	/**
	 * 修改资源
	 * 
	 * @param res
	 * @return
	 * 
	 * @author fangyun
	 * @Date 2016年3月23日 
	 */
	JSONObject updateResource(Resource res);

    /**
     * 获取资源模块
     * @param systemId
     * @return
     */
	List<TreeSysResource>seeResources(int systemId);
	
}
