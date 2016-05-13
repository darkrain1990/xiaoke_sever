
	/**
	 * @Description: 
	 * @author Han Bingjiang
	 * @date:
	 * @param req
	 * @param rep
	 * @return
	 */
package com.xiaoke.common.util;

/**
 * @author Han Bingjiang
 * @Descrition TODO
 * @date:Jan 12, 2016   2:21:19 PM
 */
public class HtmlEscape {
	
	public static String htmlEscape(String strData)
	{
	    if (strData == null)
	    {
	        return "";
	    }
	    strData = replaceString(strData, "&", "&amp;");
	    strData = replaceString(strData, "<", "&lt;");
	    strData = replaceString(strData, ">", "&gt;");
	    strData = replaceString(strData, "'", "&apos;");
	    strData = replaceString(strData, "\"", "&quot;");
	    return strData;
	}
	
	public static String replaceString(String strData, String regex, String replacement)
	{
	    if (strData == null)
	    {
	        return null;
	    }
	    int index;
	    index = strData.indexOf(regex);
	    String strNew = "";
	    if (index >= 0)
	    {
	        while (index >= 0)
	        {
	            strNew += strData.substring(0, index) + replacement;
	            strData = strData.substring(index + regex.length());
	            index = strData.indexOf(regex);
	        }
	        strNew += strData;
	        return strNew;
	    }
	    return strData;
	}

}
