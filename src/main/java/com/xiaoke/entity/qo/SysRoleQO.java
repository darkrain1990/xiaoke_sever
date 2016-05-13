package com.xiaoke.entity.qo;


/**
 * Sys_Roles 表条件查询对象
 * @author wwh
 *
 */
public class SysRoleQO {
	
	private int beginRow;		//起始行
	private int endRow;			//结束行
	private int pageSize;		//页面大小
	private int index;			//当前页面索引
	private Integer systemId;		//所属系统
	private String roleName; 	//用户姓名
	private Integer flag=1;
	
	public Integer getFlag() {
		return flag;
	}
	public void setFlag(Integer flag) {
		this.flag = flag;
	}
	/**
	 * 计算起始行
	 * @author wwh
	 * @Date 2016年3月17日 
	 */
	public void calculateBeginRowAndEndRow(){
		this.beginRow = this.pageSize*(this.index-1);//0  2
		this.endRow = this.beginRow + this.pageSize ;//2  4
	}
	public SysRoleQO(){
		super();
	}
	public SysRoleQO(int index, int pageSize, String roleName,Integer systemId) {
		this.index=index;
		this.pageSize=pageSize;
		this.roleName=roleName;
		this.systemId=systemId;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
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
	public Integer getSystemId() {
		return systemId;
	}
	public void setSystemId(Integer systemId) {
		this.systemId = systemId;
	}
	
	
}
