package com.xiaoke.mapper;

import com.xiaoke.entity.Resource;
import com.xiaoke.entity.qo.SysResourceQO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ResourceMapper {

	/**
	 * 条件查询资源分页对象
	 *
	 * @param
	 * @return 分页对象list集合
	 * @author wwh
	 * @Date 2016年3月17日
	 */
	List<Resource> searchResource(SysResourceQO sq);
	/**
	 * 资源总条数
	 * @param
	 * @return 分页对象list集合
	 * @author wwh
	 * @Date 2016年3月18日
	 */
	int findTotal(SysResourceQO sq);
	/**
	 * 添加资源
	 *
	 * @param
	 * @return 分页对象list集合
	 * @author wwh
	 * @Date 2016年3月18日
	 */
	int addResource(Resource res);
	/**
	 * 刪除資源
	 *
	 * @param
	 * @return 分页对象list集合
	 * @author wwh
	 * @Date 2016年3月22日
	 */
	int deleResource(String id);
	/**
	 * 更新資源
	 *
	 * @param
	 * @return 分页对象list集合
	 * @author wwh
	 * @Date 2016年3月22日
	 */
	int updateResource(Resource res);

	/**
	 * 获取资源模块
	 *
	 * @author wwh
	 *
	 * @Date 2016年3月25日
	 * */
	List<Resource> seeResources(@Param(value = "systemId")int systemId);
	
}
