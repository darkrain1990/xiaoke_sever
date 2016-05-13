package com.xiaoke.entity.vo;

import java.io.Serializable;
import java.util.List;

/**
 * 分页对象
 * @author wwh
 *
 * @param <T>
 */
public class PageBean<T> implements Serializable {
	
	private static final long serialVersionUID = 832989930592214587L;
	
	private int pageSize = 5;	//页面大小
	private int pageTotal;		//总页面数
	private int index = 1;		//页面当前索引
	private int total;			//记录总数
	private List<T> list;		//页面集合
	
	public int getPageSize() {
		return pageSize;
	}
	
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
		//计算页面总数
		calculatePageTotal(this.total ,this.pageSize);
	}
	
	public int getPageTotal() {
		//计算页面总数
		calculatePageTotal(this.total ,this.pageSize);
		return pageTotal;
	}
	
	public void setPageTotal(int pageTotal) {
		this.pageTotal = pageTotal;
	}
	
	public int getIndex() {
		return index;
	}
	
	public void setIndex(int index) {
		
		if(index<1)
			index = 1;
		
		if(index>getPageTotal()) 
			index=getPageTotal();
		
		this.index = index;
	}
	
	public int getTotal() {
		return total;
	}
	
	public void setTotal(int total) {
		this.total = total;
		//计算页面总数
		calculatePageTotal(this.total ,this.pageSize);
	}
	
	public List<T> getList() {
		return list;
	}
	
	public void setList(List<T> list) {
		this.list = list;
	}
	
	/**
	 * 计算总页面数
	 * 
	 * @param total 记录总数
	 * @param pageSize 页面大小
	 * @return	
	 * 
	 * @author wwh
	 * @Date 2016年3月16日 下午12:23:29
	 */
	private void calculatePageTotal(int total,int pageSize){
		this.pageTotal = (total % pageSize==0) ? total / pageSize : total / pageSize + 1;
	}

	/**
	 * 
	 * @param pageSize	页面大小
	 * @param total		记录总数
	 * @param list		记录集合
	 */
	public PageBean(int pageSize, int total, List<T> list) {
		super();
		this.pageSize = pageSize;
		this.total = total;
		this.list = list;
		calculatePageTotal(total, pageSize);
	}

	/**
	 * 
	 * @param pageSize	页面大小
	 * @param total		记录总数
	 */
	public PageBean(int pageSize, int total) {
		super();
		this.pageSize = pageSize;
		this.total = total;
		calculatePageTotal(total, pageSize);
	}

	public PageBean(int total, List<T> list) {
		super();
		this.total = total;
		this.list = list;
		calculatePageTotal(total, this.pageSize);
	}

	/**
	 * 计算起始行
	 * 
	 * @author wwh
	 * @Date 2016年3月16日 下午2:23:30
	 */
	public int calculateBeginRow(){
		return this.pageSize*(this.index-1);
	}
	
	/**
	 * 计算结束行
	 * @author wwh
	 * @Date 2016年3月16日 下午2:24:36
	 */
	public int calculateEndRow(int beginRow){
		return beginRow + this.pageSize ;
	}
	
	
}
