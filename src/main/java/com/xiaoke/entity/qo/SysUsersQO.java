package com.xiaoke.entity.qo;

import com.xiaoke.entity.SysUsers;


/**
 * Sys_Users 表条件查询对象
 * @author Xuwangshen
 *
 */
public class SysUsersQO extends SysUsers{

	private int beginRow;		//起始行
	private int endRow;			//结束行
	private int pageSize;		//页面大小
	private int index;			//当前页面索引
	
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
	
	/**
	 * 计算起始行
	 * @author Xuwangshen
	 * @Date 2016年3月16日 下午2:41:48
	 */
	public void calculateBeginRowAndEndRow(){
		this.beginRow = this.pageSize*(this.index-1);
		this.endRow = this.beginRow + this.pageSize ;
	}
	
	public SysUsersQO() {
		super();
		this.pageSize = 6;
		this.index = 1;
	}
	
	public SysUsersQO(int beginRow, int endRow, int pageSize, int index,
			Integer id, Integer systemId, String mobileNum, String userName,
			String loginName) {
		super();
		this.beginRow = beginRow;
		this.endRow = endRow;
		this.pageSize = pageSize;
		this.index = index;
		super.setId(id) ;
		super.setSystemId(systemId);
		super.setMobileNum(mobileNum);
		super.setUserName(userName);
		super.setLoginName(loginName);
	}
	public SysUsersQO(int pageSize, int index, String mobileNum,
			String loginName) {
		super();
		this.pageSize = pageSize;
		this.index = index;
		super.setMobileNum(mobileNum);
		super.setLoginName(loginName);
	}
	
	
}
