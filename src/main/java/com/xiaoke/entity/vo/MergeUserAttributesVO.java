package com.xiaoke.entity.vo;

import java.io.Serializable;

/**
 * 合并页面用户属性VO对象
 * 
 * @author wwh
 *
 */
public class MergeUserAttributesVO implements Serializable{

	private static final long serialVersionUID = -316759223952246009L;
	
	private String name;			//属性名称
	private String cnName;			//中文属性名称
	private String originalValue;	//原用户属性值
	private String objectiveValue;	//目标用户属性值
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getOriginalValue() {
		return originalValue;
	}
	public void setOriginalValue(String originalValue) {
		this.originalValue = originalValue;
	}
	public String getObjectiveValue() {
		return objectiveValue;
	}
	public void setObjectiveValue(String objectiveValue) {
		this.objectiveValue = objectiveValue;
	}
	public MergeUserAttributesVO(String name, String originalValue,
			String objectiveValue) {
		super();
		this.name = name;
		this.originalValue = originalValue;
		this.objectiveValue = objectiveValue;
	}
	public MergeUserAttributesVO() {
		super();
	}
	public String getCnName() {
		return cnName;
	}
	public void setCnName(String cnName) {
		this.cnName = cnName;
	}
	public MergeUserAttributesVO(String name, String cnName,
			String originalValue, String objectiveValue) {
		super();
		this.name = name;
		this.cnName = cnName;
		this.originalValue = originalValue;
		this.objectiveValue = objectiveValue;
	}
	
	
}
