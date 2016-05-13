package com.xiaoke.entity.qo;
/**
 * 资源预览显示树
 * @author fangyun
 * 
 * */
public class TreeSysResource {
	
	private Integer id;
	private Integer pId;
	private String name;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getpId() {
		return pId;
	}
	public void setPid(Integer pId) {
		this.pId = pId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public TreeSysResource(Integer id,Integer pId,String name) {
		super();
		this.id = id;
		this.pId = pId;
		this.name = name;
	}
	
	
	
}
