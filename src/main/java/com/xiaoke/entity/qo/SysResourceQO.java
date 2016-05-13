package com.xiaoke.entity.qo;

public class SysResourceQO {
	private int beginRow;		//起始行
	private int endRow;			//结束行
	private int pageSize;		//页面大小
	private int index;			//当前页面索引
	private int systemId;		//所属系统
	private String resourceName; 	//资源名称
	private Integer flag=1;
	
	
	public Integer getFlag() {
		return flag;
	}
	public void setFlag(Integer flag) {
		this.flag = flag;
	}
	/**
	 * 计算起始行
	 * @author fangyun
	 * @Date 2016年3月17日 
	 */
	public void calculateBeginRowAndEndRow(){
		this.beginRow = this.pageSize*(this.index-1);
		this.endRow = this.beginRow + this.pageSize ;
	}
	public SysResourceQO(){
		super();
	}
	
	public SysResourceQO(int index, int pageSize, String resourceName,int systemId){
		
		this.index=index;
		this.pageSize=pageSize;
		this.systemId=systemId;
		this.resourceName=resourceName;
	}
	public int getBeginRow() {
		return beginRow;
	}
	public void setBeginRow(int beginRow) {
		this.beginRow = beginRow;
	}
	public int getEndRow() {
		return endRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getIndex() {
		return index;
	}
	public void setIndex(int index) {
		this.index = index;
	}
	public int getModule() {
		return systemId;
	}
	public void setModule(int systemId) {
		this.systemId = systemId;
	}
	public String getResourceName() {
		return resourceName;
	}
	public void setResourceName(String resourceName) {
		this.resourceName = resourceName;
	}
	
	
}
