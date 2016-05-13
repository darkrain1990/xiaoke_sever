package com.xiaoke.exception;

/**
 * 验证异常
 * @author Xuwangshen
 *
 */
public class ValidateException extends Exception{
	
	private static final long serialVersionUID = -5360090022146892794L;

	public ValidateException(String msg){
		super(msg);
	}
}
