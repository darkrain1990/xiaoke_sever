package com.xiaoke.common.util;

import java.io.IOException;
import java.security.KeyManagementException;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import org.apache.http.HttpEntity;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.conn.ssl.SSLConnectionSocketFactory;
import org.apache.http.conn.ssl.SSLContextBuilder;
import org.apache.http.conn.ssl.TrustSelfSignedStrategy;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.apache.log4j.Logger;
import org.springframework.util.StringUtils;

public class HttpClientUtil {
	
	private static Logger LOGGER = Logger.getLogger(HttpClientUtil.class);

	/**
	 * POST提交
	 */
	private static String postForString(String url, List<NameValuePair> nvps, Map<String, String> header,Map<String, String> raw) throws ClientProtocolException, IOException {
		CloseableHttpClient client = createSSLInsecureClient();
		RequestConfig requestConfig = RequestConfig.custom().setConnectionRequestTimeout(25000).setConnectTimeout(25000).setSocketTimeout(25000).build();
		HttpPost request = new HttpPost(url);
		if (header != null) {
			Iterator<String> it = header.keySet().iterator();
			while (it.hasNext()) {
				String key = it.next();
				String value = header.get(key);
				request.addHeader(key, value);
			}
		}
		request.setConfig(requestConfig);
		if (nvps != null) {
			request.setEntity(new UrlEncodedFormEntity(nvps, "UTF-8"));
		}
		if(raw!=null){
			StringEntity entity = new StringEntity(JSONObject.fromObject(raw).toString());
			entity.setContentType("application/json");
			entity.setContentEncoding("UTF-8");
			request.setEntity(entity);
		}
		
		CloseableHttpResponse response = client.execute(request);
		try {
			HttpEntity entity = response.getEntity();
			if (entity != null) {
				return EntityUtils.toString(response.getEntity(),"UTF-8");
			}
		} finally {
			response.close();
			client.close();
		}
		return null;
	}
	/**
	 * POST提交
	 */
	public static String postForString(String url, List<NameValuePair> nvps, Map<String, String> header) throws ClientProtocolException, IOException{
		return postForString(url, nvps, header, null);
	}
	
	/**
	 * post请求,编码为utf-8
	 * 
	 * @param url 请求地址
	 * @param nvps 请求参数
	 * @return String 
	 * @author wwh
	 * @Date 2016年1月12日 下午2:07:36
	 */
	public static String post(String url, List<NameValuePair> nvps) throws ClientProtocolException, IOException {
		return postForString(url, nvps, null);
	}
	
	/**
	 * post请求,编码为utf-8
	 * 
	 * @param url 请求地址
	 * @param params 请求参数
	 * @param heardParams 请求头参数
	 * @return String 
	 * @author wwh
	 * @Date 2016年1月12日 下午2:07:36
	 */
	public static String post(String url, Map<String,String> params,Map<String, String> heardParams) throws ClientProtocolException, IOException {
		List<NameValuePair> nvps = null;
		if(params!=null){
			nvps = new ArrayList<NameValuePair>();
			for (String key : params.keySet()) {
				nvps.add(new BasicNameValuePair(key, params.get(key)));
			}
		}
		return postForString(url, nvps, heardParams);
	}
	
	/**
	 * post请求,编码为utf-8
	 * 
	 * @param url 请求地址
	 * @param params 请求参数
	 * @param heardParams 请求头参数
	 * @param contentType 如果该参数为application/json，则body将以json格式参数请求
	 * @return String 
	 * @author wwh
	 * @Date 2016年1月12日 下午2:07:36
	 */
	public static String post(String url,Map<String, String> params,Map<String, String> heardParams,String contentType) throws ClientProtocolException, IOException{
		if(!StringUtils.isEmpty(contentType) && contentType.equals("application/json"))
			return postForString(url, null, heardParams,params);
		else
			return post(url, params,heardParams);
	}
	
	/**
	 * post请求,编码为utf-8
	 * 
	 * @param url 请求地址
	 * @param params 请求参数
	 * @return String 
	 * @author wwh
	 * @Date 2016年1月12日 下午2:07:36
	 */
	public static String post(String url, Map<String,String> params) throws ClientProtocolException, IOException {
		return post(url, params, null);
	}

	/**
	 * 信任自签及所有证书
	 */
	private static CloseableHttpClient createSSLInsecureClient() {
		try {
			SSLContextBuilder builder = new SSLContextBuilder().loadTrustMaterial(null, new TrustSelfSignedStrategy());
			SSLConnectionSocketFactory sslsf = new SSLConnectionSocketFactory(builder.build(), SSLConnectionSocketFactory.ALLOW_ALL_HOSTNAME_VERIFIER);
			return HttpClients.custom().setSSLSocketFactory(sslsf).build();
		} catch (NoSuchAlgorithmException e) {
			LOGGER.error(e.getMessage());
			LOGGER.error(e);
		} catch (KeyStoreException e) {
			LOGGER.error(e.getMessage());
			LOGGER.error(e);
		} catch (KeyManagementException e) {
			LOGGER.error(e.getMessage());
			LOGGER.error(e);
		}
		return HttpClients.createDefault();
	}
}
