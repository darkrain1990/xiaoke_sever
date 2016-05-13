package com.xiaoke.common.util;

import net.sf.json.JSONException;
import net.sf.json.util.PropertySetStrategy;

//TODO 作用待定，待删除
public class PropertyStrategyWrapper  extends PropertySetStrategy {
	private PropertySetStrategy original;
    
    public PropertyStrategyWrapper(PropertySetStrategy original) {
        this.original = original;
    }
	@Override
	public void setProperty(Object arg0, String arg1, Object arg2)
			throws JSONException {
		
	}
  
}
