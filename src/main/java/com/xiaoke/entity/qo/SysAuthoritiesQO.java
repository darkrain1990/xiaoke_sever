package com.xiaoke.entity.qo;

/**
 * 权限系统-权限查询
 * @author Zhao MengYuan
 * 
 */
public class SysAuthoritiesQO {
	
	private String id;
	private String sysAuthorityName;
	private String sysAuthorityDesc;
	private String systemId;
	private Integer system_id;
	private Integer enabled;
	private Integer issys;
	private int beginRow;		//起始行
	private int endRow;			//结束行
	private int pageSize;		//页面大小
	private int index;			//当前页面索引
	private int flag;
	
	
	public int getFlag() {
		return flag;
	}
	public void setFlag(int flag) {
		this.flag = flag;
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
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSysAuthorityName() {
		return sysAuthorityName;
	}
	public void setSysAuthorityName(String sysAuthorityName) {
		this.sysAuthorityName = sysAuthorityName;
	}
	public String getSysAuthorityDesc() {
		return sysAuthorityDesc;
	}
	public void setSysAuthorityDesc(String sysAuthorityDesc) {
		this.sysAuthorityDesc = sysAuthorityDesc;
	}
	public String getSystemId() {
		return systemId;
	}
	public void setSystemId(String systemId) {
		this.systemId = systemId;
	}
	public Integer getSystem_id() {
		return system_id;
	}
	public void setSystem_id(Integer system_id) {
		this.system_id = system_id;
	}
	public Integer getEnabled() {
		return enabled;
	}
	public void setEnabled(Integer enabled) {
		this.enabled = enabled;
	}
	public Integer getIssys() {
		return issys;
	}
	public void setIssys(Integer issys) {
		this.issys = issys;
	}
	
	
	/**
	 * 计算起始行
	 * @author Zhao MengYuan
	 * @Date 1:32 PM 2016.3.17
	 */
	public void calculateBeginRowAndEndRow(){
		this.beginRow = this.pageSize*(this.index-1);
		this.endRow = this.pageSize ;
	}
	
	public SysAuthoritiesQO(String sysAuthorityName,
			Integer system_id, int pageSize, int index) {
		super();
		this.sysAuthorityName = sysAuthorityName;
		this.system_id = system_id;
		this.pageSize = pageSize;
		this.index = index;
	}
	public SysAuthoritiesQO() {
		super();
	}
}
