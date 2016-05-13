package com.xiaoke.entity;


/**
 * 资源封装实体类
 * @author fangyun
 * @Date 2016年3月18日 
 */
public class Resource {

	private String resourceName;//资源名称
	private String resourceDesc;//资源描述
	private String resourceType;//资源类型
	private String resourceString;//资源位置
	private Integer priority;//优先级
	private Integer enable;//是否启用
	private Integer issys;//是否是超级用户
	private int systemId;//所属系统
	
	private int id;//资源id  
	private int parentId;//父节点
	private String rootId;//根节点
	private Integer isChild;//是否有子节点
	 
	private String sysName;//系统名称
	
	private Integer sortIndex;//显示顺序
	private String imgageUrl;//图片地址
	
	private Integer flag;
	
	
	
	public String getSysName() {
		return sysName;
	}

	public void setSysName(String sysName) {
		this.sysName = sysName;
	}

	public  Resource(){
		super();
	}
	
	public Resource(String resourceName, int systemId,
			String resourceDesc, String resourceType, String resourceString,
			Integer priority, Integer enable, Integer issys, int parentId,
			String rootId, Integer sortIndex, String imgageUrl, Integer isChild) {
		super();
		this.resourceName = resourceName;
		this.resourceDesc = resourceDesc;
		this.resourceType = resourceType;
		this.resourceString = resourceString;
		this.priority = priority;
		this.enable = enable;
		this.issys = issys;
		this.systemId = systemId;
		this.parentId = parentId;
		this.rootId = rootId;
		this.sortIndex = sortIndex;
		this.imgageUrl = imgageUrl;
		this.isChild = isChild;

	}


	public Resource(int id, String resourceName, int systemId,
			String resourceDesc, int enable, int issys) {
		// TODO Auto-generated constructor stub
		super();
		this.id=id;
		this.resourceName=resourceName;
		this.systemId=systemId;
		this.resourceDesc=resourceDesc;
		this.enable=enable;
		this.issys=issys;
	}


	public Integer getFlag() {
		return flag;
	}


	public void setFlag(Integer flag) {
		this.flag = flag;
	}


	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getResourceName() {
		return resourceName;
	}
	public void setResourceName(String resourceName) {
		this.resourceName = resourceName;
	}
	public String getResourceDesc() {
		return resourceDesc;
	}
	public void setResourceDesc(String resourceDesc) {
		this.resourceDesc = resourceDesc;
	}
	public String getResourceType() {
		return resourceType;
	}
	public void setResourceType(String resourceType) {
		this.resourceType = resourceType;
	}
	public String getResourceString() {
		return resourceString;
	}
	public void setResourceString(String resourceString) {
		this.resourceString = resourceString;
	}
	public Integer getPriority() {
		return priority;
	}
	public void setPriority(Integer priority) {
		this.priority = priority;
	}
	public Integer getEnable() {
		return enable;
	}
	public void setEnable(Integer enable) {
		this.enable = enable;
	}
	public Integer getIssys() {
		return issys;
	}
	public void setIssys(Integer issys) {
		this.issys = issys;
	}
	public int getSystemId() {
		return systemId;
	}
	public void setSystemId(int systemId) {
		this.systemId = systemId;
	}
	
	public int getParentId() {
		return parentId;
	}


	public void setParentId(int parentId) {
		this.parentId = parentId;
	}


	public String getRootId() {
		return rootId;
	}
	public void setRootId(String rootId) {
		this.rootId = rootId;
	}
	public Integer getSortIndex() {
		return sortIndex;
	}
	public void setSortIndex(Integer sortIndex) {
		this.sortIndex = sortIndex;
	}
	public String getImgageUrl() {
		return imgageUrl;
	}
	public void setImgageUrl(String imgageUrl) {
		this.imgageUrl = imgageUrl;
	}
	public Integer getIsChild() {
		return isChild;
	}
	public void setIsChild(Integer isChild) {
		this.isChild = isChild;
	}

}
