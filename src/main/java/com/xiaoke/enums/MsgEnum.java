package com.xiaoke.enums;

/**
 * 消息枚举类
 * @author Xuwangshen
 *
 */
public enum MsgEnum {

	SUCCESS,//成功
	ERR_INVALID_MOBILE("无效的手机号"),
	;
	
	public String value;
	
	MsgEnum(){}

	MsgEnum(String value) {
        this.value = value;
    }
}
