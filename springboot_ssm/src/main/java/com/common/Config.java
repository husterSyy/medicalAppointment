package com.common;


/**
 * 
 *@class_name：Config
 *@comments:系统常量
 *@param:自主填写API的授权码等信息
 *@return: String
 */
public class Config
{
	
	/**
	 * url前半部分
	 */
	public static final String BASE_URL = "https://api.miaodiyun.com/20150822";

	/**
	 * 开发者注册后系统自动生成的账号，可在官网登录后查看-修改为自己的。
	 */
	public static final String ACCOUNT_SID = "b41b669e895b4793b6c735ba5be7fd18";

	/**
	 * 开发者注册后系统自动生成的TOKEN，可在官网登录后查看-修改为自己的。
	 */
	public static final String AUTH_TOKEN = "9cd9cbf964404030b55d565ff902b42d";

	/**
	 * 响应数据类型, JSON或XML
	 */
	public static final String RESP_DATA_TYPE = "json";
}
