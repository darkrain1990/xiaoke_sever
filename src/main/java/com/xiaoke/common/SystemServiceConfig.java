package com.xiaoke.common;

import com.xiaoke.exception.AppException;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 * 
 * 功能说明：
 * 典型用法：
 * 特殊用法：
 * 创建者：LiGang
 * 创建时间：2014-1-15
 */
public final class SystemServiceConfig {
	private static Logger LOGGER = Logger.getLogger(SystemServiceConfig.class);
	private static SystemServiceConfig config;
	private static final String PROPERTIES_LOCATION = "initial.properties";
	private static final String ERROR_NOT_FOUND = "NOT_FOUND";
	private static final String ERROR_SYSTEM_CONFIG_FILE_LOAD_FAILED = "SYSTEM_CONFIG_FILE_LOAD_FAILED";

	/* used by idm webservice */
	private String clientId;


	Properties configProp = new Properties();

	private SystemServiceConfig() throws AppException {
		loadConfig();
	}

	private void loadConfig() throws AppException {
		InputStream in = null;

		try {
			// Loads the configuration property file
			in = SystemServiceConfig.class.getClassLoader().getResourceAsStream(PROPERTIES_LOCATION);
			if (in == null) {
				String errMsg = "config file <" + PROPERTIES_LOCATION + "> is not found.";
				LOGGER.error(errMsg);
				throw new AppException(ERROR_NOT_FOUND, errMsg);
			}
			
			configProp.load(in);
			
			String value = getProperty(configProp, "idm.client.id");
			if (!StringUtils.isEmpty(value)) {
				clientId = value.trim();
			}



		} catch (IOException ex) {
			String errMsg = "System configuration file <" + PROPERTIES_LOCATION + "> is not loaded properly.";
			LOGGER.error(errMsg, ex);
//			ex.printStackTrace();
			throw new AppException(ERROR_SYSTEM_CONFIG_FILE_LOAD_FAILED,errMsg, ex.getCause());
		} finally {
			if (in != null) {
				try {
					in.close();
					in = null;
				} catch (IOException e) {
					LOGGER.error(e.getMessage(), e);
					e.printStackTrace();
				}
			}
		}
	}

	public static synchronized SystemServiceConfig getInstance()
			throws AppException {
		if (config == null) {
			config = new SystemServiceConfig();
		}

		return config;
	}

	private String getProperty(Properties prop, String key) {
		if (prop == null || StringUtils.isEmpty(key)) {
			return null;
		}

		return prop.getProperty(key);
	}
	/**
	 * 获取配置文件中Value
	 * @param key 配置文件中的key
	 * @author wwh
	 * @Date 2016年1月15日 上午11:24:11
	 */
	public String getProPerty(String key){
		return getProperty(configProp, key);
	}

	public String getClientId() {
		return clientId;
	}

	public void setClientId(String clientId) {
		this.clientId = clientId;
	}


}
