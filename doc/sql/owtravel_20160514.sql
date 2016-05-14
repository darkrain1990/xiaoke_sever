/*
Navicat MySQL Data Transfer

Source Server         : owtravel
Source Server Version : 50096
Source Host           : localhost:3306
Source Database       : owtravelq

Target Server Type    : MYSQL
Target Server Version : 50096
File Encoding         : 65001

Date: 2016-05-14 21:06:45
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `flight_info`
-- ----------------------------
DROP TABLE IF EXISTS `flight_info`;
CREATE TABLE `flight_info` (
  `ID` int(11) NOT NULL COMMENT '编号',
  `FLIGHT_NO` varchar(32) default NULL COMMENT '航班号',
  `FLIGHT_COMPANY` varchar(128) default NULL COMMENT '航班公司',
  `TICKET_TYPE` int(11) default NULL COMMENT '机票类型（自定/代定）',
  `FLIGHT_TYPE` int(11) default NULL COMMENT '航班类型（去程/反程）',
  `FROM_CITY` varchar(32) default NULL COMMENT '出发城市',
  `FROM_TIME` date default NULL COMMENT '航班起飞时间',
  `TO_CITY` varchar(32) default NULL COMMENT '到达城市',
  `TO_TIME` date default NULL COMMENT '航班抵达时间',
  `R_PTINFO_ID` int(11) default NULL COMMENT '关联个人行程编号',
  `CREATE_TIME` date default NULL COMMENT '创建时间',
  `UPDATE_TIME` date default NULL COMMENT '更新时间',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='航班信息';

-- ----------------------------
-- Records of flight_info
-- ----------------------------

-- ----------------------------
-- Table structure for `hotel`
-- ----------------------------
DROP TABLE IF EXISTS `hotel`;
CREATE TABLE `hotel` (
  `ID` int(11) NOT NULL COMMENT '酒店ID',
  `NAME` varchar(128) default NULL COMMENT '酒店名称',
  `HOREL_DESC` varchar(256) default NULL COMMENT '酒店描述',
  `URL` varchar(256) default NULL COMMENT '酒店图文url',
  `PRICE_RANGE_U` float default NULL COMMENT '参考价格(上行)',
  `PRICE_RANGE_D` float default NULL COMMENT '参考价格（下行）',
  `LONGITUDE` float default NULL COMMENT '经度',
  `LATITUDE` float default NULL COMMENT '纬度',
  `ADDRESS` varchar(256) default NULL COMMENT '酒店地址',
  `COUNTRY` varchar(32) default NULL COMMENT '酒店国家',
  `CITY` varchar(32) default NULL COMMENT '酒店城市',
  `TAG` varchar(128) default NULL COMMENT '酒店标签',
  `CREATE_TIME` date default NULL COMMENT '创建时间',
  `UPDATE_TIME` date default NULL COMMENT '更新时间',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='酒店模型';

-- ----------------------------
-- Records of hotel
-- ----------------------------

-- ----------------------------
-- Table structure for `insurance_info`
-- ----------------------------
DROP TABLE IF EXISTS `insurance_info`;
CREATE TABLE `insurance_info` (
  `ID` int(11) NOT NULL COMMENT '保险编号',
  `NAME` varchar(128) default NULL COMMENT '保险名称',
  `CREATE_USER_NAME` varchar(32) default NULL COMMENT '创建人',
  `BENEFIT_USER_NAME` varchar(32) default NULL COMMENT '受益人',
  `R_INSURANCE_MODEL_ID` int(11) default NULL COMMENT '关联保险模板',
  `CREATE_TIME` date default NULL COMMENT '创建时间',
  `UPDATE_TIME` date default NULL COMMENT '更新时间',
  `R_PTINFO_ID` int(11) default NULL COMMENT '关联个人行程编号',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='insurance';

-- ----------------------------
-- Records of insurance_info
-- ----------------------------

-- ----------------------------
-- Table structure for `order_info`
-- ----------------------------
DROP TABLE IF EXISTS `order_info`;
CREATE TABLE `order_info` (
  `ID` int(11) NOT NULL COMMENT '编号',
  `ORDER_TYPE` int(11) default NULL COMMENT '订单类型(预付订单/合同订单/补付订单)',
  `PRICE` float default NULL COMMENT '订单金额',
  `R_PAY_USER_ID` varchar(32) default NULL COMMENT '付款人账号',
  `STATUS` int(11) default NULL COMMENT '订单状态（待支付/交易成功/交易失败/已退款）',
  `E_ORDER_NUM` varchar(128) default NULL COMMENT '第三方交易流水',
  `PAY_TIME` date default NULL COMMENT '支付时间',
  `R_CREATE_USER_ID` varchar(32) default NULL COMMENT '订单创建人账号',
  `CREATE_TIME` date default NULL COMMENT '创建时间',
  `UPDATE_TIME` date default NULL COMMENT '更新时间',
  `R_PTINFO_ID` int(11) default NULL COMMENT '关联个人行程编号',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单信息';

-- ----------------------------
-- Records of order_info
-- ----------------------------

-- ----------------------------
-- Table structure for `personal_travel_info`
-- ----------------------------
DROP TABLE IF EXISTS `personal_travel_info`;
CREATE TABLE `personal_travel_info` (
  `ID` int(11) NOT NULL COMMENT '行程编号',
  `MEMBER_NUM` int(11) default NULL COMMENT '行程人数',
  `TRAVEL_TIME_START` date default NULL COMMENT '行程起始时间',
  `TRAVLE_TIME_END` date default NULL COMMENT '行程结束时间',
  `R_BOOK_USER_ID` varchar(32) default NULL COMMENT '预订人编号',
  `R_ACCOMPANY_USER_ID` varchar(32) default NULL COMMENT '关联地陪编号',
  `R_AGENT_ID` varchar(32) default NULL COMMENT '关联行程顾问编号',
  `R_LINE_ID` int(11) default NULL COMMENT '关联行程编号',
  `R_PLAN_ID` int(11) default NULL COMMENT '关联行程安排编号',
  `R_TEAM_ID` int(11) default NULL COMMENT '关联团队编号',
  `R_FLIGHT_ID` int(11) default NULL COMMENT '关联航班编号',
  `TEAM_TOKEN` varchar(16) default NULL COMMENT '团队口号',
  `STATUS` varchar(16) default NULL COMMENT '行程状态（行程创建/行程计划/行程准备/行程中/行程结束）',
  `CREATE_TIME` date default NULL COMMENT '创建时间',
  `UPDATE_TIME` date default NULL COMMENT '更新时间',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='个人行程';

-- ----------------------------
-- Records of personal_travel_info
-- ----------------------------

-- ----------------------------
-- Table structure for `push_task`
-- ----------------------------
DROP TABLE IF EXISTS `push_task`;
CREATE TABLE `push_task` (
  `ID` int(11) NOT NULL COMMENT '编号',
  `TASK_NAME` varchar(32) default NULL COMMENT '任务名称',
  `OBJECT_TYPE` int(11) default NULL COMMENT '推送对象类型（TEAM/USER）',
  `OBJECT_ID` varchar(32) default NULL COMMENT '对象标识',
  `IS_PUSH` int(11) default NULL COMMENT '0未推送1已推送',
  `CREATE_TIME` date default NULL COMMENT '创建时间',
  `UPDATE_TIME` date default NULL COMMENT '更新时间',
  `FEED_BACK` varchar(32) default NULL COMMENT '反馈结果',
  `R_PTINFO_ID` int(11) default NULL COMMENT '关联个人行程编号',
  `P_CREATE_USER_ID` varchar(32) default NULL COMMENT '任务创建人',
  `P_TEMPATE_ID` int(11) default NULL COMMENT '关联模板编号',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='推送任务表';

-- ----------------------------
-- Records of push_task
-- ----------------------------

-- ----------------------------
-- Table structure for `realm`
-- ----------------------------
DROP TABLE IF EXISTS `realm`;
CREATE TABLE `realm` (
  `realm_code` varchar(25) NOT NULL,
  `realm_name` varchar(255) NOT NULL,
  `realm_description` varchar(2000) default NULL,
  PRIMARY KEY  (`realm_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of realm
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_authorities`
-- ----------------------------
DROP TABLE IF EXISTS `sys_authorities`;
CREATE TABLE `sys_authorities` (
  `ID` int(11) NOT NULL COMMENT '权限ID',
  `AUTHORITY_NAME` varchar(256) NOT NULL COMMENT '权限名',
  `AUTHORITY_DESC` varchar(256) default NULL COMMENT '权限描述',
  `ENABLED` int(11) NOT NULL default '0' COMMENT '是否启用',
  `ISSYS` int(11) NOT NULL default '0' COMMENT '否是超级权限',
  `CREATE_TIME` date default NULL COMMENT '创建时间',
  `UPDATE_TIME` date default NULL COMMENT '更新时间',
  PRIMARY KEY  (`ID`),
  KEY `AK_Key_1` (`AUTHORITY_NAME`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限表';

-- ----------------------------
-- Records of sys_authorities
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_authorities_resources`
-- ----------------------------
DROP TABLE IF EXISTS `sys_authorities_resources`;
CREATE TABLE `sys_authorities_resources` (
  `AUTHORITY_ID` int(11) NOT NULL COMMENT '权限ID',
  `RESOURCE_ID` int(11) NOT NULL COMMENT '资源ID',
  PRIMARY KEY  (`AUTHORITY_ID`,`RESOURCE_ID`),
  KEY `FK_SYS_AUTHORITIES_RESOURCES_1` (`RESOURCE_ID`),
  CONSTRAINT `FK_SYS_AUTHORITIES_RESOURCES_2` FOREIGN KEY (`AUTHORITY_ID`) REFERENCES `sys_authorities` (`ID`),
  CONSTRAINT `FK_SYS_AUTHORITIES_RESOURCES_1` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `sys_resources` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限资源关系表';

-- ----------------------------
-- Records of sys_authorities_resources
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_resources`
-- ----------------------------
DROP TABLE IF EXISTS `sys_resources`;
CREATE TABLE `sys_resources` (
  `ID` int(11) NOT NULL COMMENT '资源ID',
  `RESOURCE_NAME` varchar(256) NOT NULL COMMENT '资源名称',
  `RESOURCE_DESC` varchar(256) default NULL COMMENT '资源描述',
  `RESOURCE_TYPE` varchar(256) default NULL COMMENT '资源类型',
  `RESOURCE_STRING` varchar(256) NOT NULL COMMENT '资源位置',
  `PRIORITY` int(11) default NULL COMMENT '优先级',
  `ENABLED` int(11) NOT NULL default '0' COMMENT '是否启用',
  `ISSYS` int(11) NOT NULL default '0' COMMENT '否是超级资源',
  `PARENT_ID` varchar(256) default NULL COMMENT '父节点',
  `ROOT_ID` varchar(256) default NULL COMMENT '根节点',
  `SORT_INDEX` int(11) default NULL COMMENT '显示顺序\r\n            显示顺序\r\n            显示顺序',
  `IMAGE_URL` varchar(256) default NULL COMMENT '图片地址',
  `IS_CHILD` int(11) default '0' COMMENT '是否有子节点',
  `CREATE_TIME` date default NULL COMMENT '创建时间',
  `UPDATE_TIME` date default NULL COMMENT '更新时间',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资源表';

-- ----------------------------
-- Records of sys_resources
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_roles`
-- ----------------------------
DROP TABLE IF EXISTS `sys_roles`;
CREATE TABLE `sys_roles` (
  `ID` int(11) NOT NULL COMMENT '角色ID',
  `ROLE_NAME` varchar(256) NOT NULL COMMENT '角色名',
  `ROLE_DESC` varchar(256) default NULL COMMENT '角色描述',
  `ENABLED` int(11) NOT NULL default '0' COMMENT '是否启用',
  `ISSYS` int(11) NOT NULL default '0' COMMENT '否是超级角色',
  `CREATE_TIME` date default NULL COMMENT '创建时间',
  `UPDATE_TIME` date default NULL COMMENT '更新时间',
  PRIMARY KEY  (`ID`),
  KEY `AK_Key_1` (`ROLE_NAME`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of sys_roles
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_roles_authorities`
-- ----------------------------
DROP TABLE IF EXISTS `sys_roles_authorities`;
CREATE TABLE `sys_roles_authorities` (
  `ROLE_ID` int(11) NOT NULL COMMENT '角色ID',
  `AUTHORITY_ID` int(11) NOT NULL COMMENT '权限ID',
  PRIMARY KEY  (`ROLE_ID`,`AUTHORITY_ID`),
  KEY `FK_SYS_ROLES_AUTHORITIES_2` (`AUTHORITY_ID`),
  CONSTRAINT `FK_SYS_ROLES_AUTHORITIES_2` FOREIGN KEY (`AUTHORITY_ID`) REFERENCES `sys_authorities` (`ID`),
  CONSTRAINT `FK_SYS_ROLES_AUTHORITIES_1` FOREIGN KEY (`ROLE_ID`) REFERENCES `sys_roles` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限角色关系表\r\n';

-- ----------------------------
-- Records of sys_roles_authorities
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_users`
-- ----------------------------
DROP TABLE IF EXISTS `sys_users`;
CREATE TABLE `sys_users` (
  `ID` varchar(32) NOT NULL COMMENT '用户ID',
  `LOGIN_NAME` varchar(256) NOT NULL COMMENT '登录名',
  `USER_NAME` varchar(256) default NULL COMMENT '用户姓名',
  `USER_PASSWORD` varchar(256) default NULL COMMENT '用户密码',
  `USER_DESC` varchar(256) default NULL COMMENT '用户描述',
  `USER_PIC` varchar(256) default NULL COMMENT '用户头像',
  `AGE` int(11) default NULL COMMENT '年龄',
  `SEX` int(11) default NULL COMMENT '性别',
  `BIRTHDAY` date default NULL COMMENT '生日',
  `CITY` varchar(32) default NULL COMMENT '城市',
  `COUNTRY` varchar(32) default NULL COMMENT '国家',
  `ID_TYPE` int(11) default NULL COMMENT '证件类型',
  `ID_NUM` varchar(128) default NULL COMMENT '证件号码',
  `TAG` varchar(256) default NULL COMMENT '用户标签',
  `ENABLED` int(11) NOT NULL default '0' COMMENT '是否可用',
  `ISSYS` int(11) NOT NULL default '0' COMMENT '否是超级用户',
  `OPEN_ID` varchar(256) default NULL COMMENT '微信号',
  `USER_TYPE` varchar(256) default NULL COMMENT '客户/地陪/客服',
  `EMAIL` varchar(256) default NULL COMMENT '邮件',
  `MOBILE_NUM` varchar(16) default NULL COMMENT '手机号码',
  `CREATE_TIME` date default NULL COMMENT '创建时间',
  `UPDATE_TIME` date default NULL COMMENT '更新时间',
  PRIMARY KEY  (`ID`),
  KEY `AK_Key_1` (`LOGIN_NAME`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of sys_users
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_users_roles`
-- ----------------------------
DROP TABLE IF EXISTS `sys_users_roles`;
CREATE TABLE `sys_users_roles` (
  `USER_ID` varchar(32) NOT NULL COMMENT '用户ID',
  `ROLE_ID` int(11) NOT NULL COMMENT '角色ID',
  PRIMARY KEY  (`USER_ID`,`ROLE_ID`),
  KEY `FK_SYS_USERS_ROLES_2` (`ROLE_ID`),
  CONSTRAINT `FK_SYS_USERS_ROLES_2` FOREIGN KEY (`ROLE_ID`) REFERENCES `sys_roles` (`ID`),
  CONSTRAINT `FK_SYS_USERS_ROLES_1` FOREIGN KEY (`USER_ID`) REFERENCES `sys_users` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色表';

-- ----------------------------
-- Records of sys_users_roles
-- ----------------------------

-- ----------------------------
-- Table structure for `t_wxcms_account`
-- ----------------------------
DROP TABLE IF EXISTS `t_wxcms_account`;
CREATE TABLE `t_wxcms_account` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) default NULL,
  `account` varchar(100) NOT NULL,
  `appid` varchar(100) default NULL,
  `appsecret` varchar(100) default NULL,
  `url` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `msgCount` int(11) default '1',
  `createTime` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_wxcms_account
-- ----------------------------
INSERT INTO `t_wxcms_account` VALUES ('3', null, 'vp_weixinpy', 'wx4b2844432595ce08', '86923b5aa5f0f42b90d1e41d850752f2 ', 'http://www.jeeweixin.com/jeeweixin/wxapi/vp_weixinpy/message.html', '72597b9628704ab09e8b9e8cbe9b540a', '5', '2015-01-27 21:38:31');

-- ----------------------------
-- Table structure for `t_wxcms_account_fans`
-- ----------------------------
DROP TABLE IF EXISTS `t_wxcms_account_fans`;
CREATE TABLE `t_wxcms_account_fans` (
  `id` int(11) NOT NULL auto_increment,
  `openid` varchar(100) default NULL,
  `subscribeStatus` int(1) default '1',
  `subscribeTime` varchar(50) default NULL,
  `nickname` varbinary(50) default NULL,
  `gender` tinyint(4) default '1',
  `language` varchar(50) default NULL,
  `country` varchar(30) default NULL,
  `province` varchar(30) default NULL,
  `city` varchar(30) default NULL,
  `headimgurl` varchar(255) default NULL,
  `createTime` datetime default NULL,
  `status` tinyint(4) default '1',
  `remark` varchar(50) default NULL,
  `wxid` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_wxcms_account_fans
-- ----------------------------

-- ----------------------------
-- Table structure for `t_wxcms_account_menu`
-- ----------------------------
DROP TABLE IF EXISTS `t_wxcms_account_menu`;
CREATE TABLE `t_wxcms_account_menu` (
  `id` int(11) NOT NULL auto_increment,
  `mtype` varchar(50) default NULL,
  `eventType` varchar(50) default NULL,
  `name` varchar(100) default NULL,
  `inputCode` varchar(255) NOT NULL,
  `url` varchar(255) default NULL,
  `sort` int(11) default NULL,
  `parentId` int(11) default NULL,
  `msgId` varchar(100) default NULL,
  `createTime` datetime default NULL,
  `gid` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_wxcms_account_menu
-- ----------------------------

-- ----------------------------
-- Table structure for `t_wxcms_account_menu_group`
-- ----------------------------
DROP TABLE IF EXISTS `t_wxcms_account_menu_group`;
CREATE TABLE `t_wxcms_account_menu_group` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) default NULL,
  `enable` int(11) default NULL,
  `createtime` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_wxcms_account_menu_group
-- ----------------------------

-- ----------------------------
-- Table structure for `t_wxcms_msg_base`
-- ----------------------------
DROP TABLE IF EXISTS `t_wxcms_msg_base`;
CREATE TABLE `t_wxcms_msg_base` (
  `id` int(11) NOT NULL auto_increment,
  `msgType` varchar(20) default NULL,
  `inputCode` varchar(20) default NULL,
  `rule` varchar(20) default NULL,
  `enable` int(11) default NULL,
  `readCount` int(11) default '0',
  `favourCount` int(11) unsigned zerofill default '00000000000',
  `createTime` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_wxcms_msg_base
-- ----------------------------
INSERT INTO `t_wxcms_msg_base` VALUES ('1', 'text', 'subscribe ', null, null, null, null, '2015-03-21 11:13:54');
INSERT INTO `t_wxcms_msg_base` VALUES ('2', 'news', '1', null, null, null, null, '2015-03-21 11:19:48');
INSERT INTO `t_wxcms_msg_base` VALUES ('3', 'news', '11', null, null, null, null, '2015-03-21 11:26:21');

-- ----------------------------
-- Table structure for `t_wxcms_msg_news`
-- ----------------------------
DROP TABLE IF EXISTS `t_wxcms_msg_news`;
CREATE TABLE `t_wxcms_msg_news` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(255) default NULL,
  `author` varchar(255) default NULL,
  `brief` varchar(255) default NULL,
  `description` longtext,
  `picPath` varchar(255) default NULL,
  `showPic` int(11) default '0',
  `url` varchar(255) default NULL,
  `fromurl` varchar(255) default NULL,
  `base_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_wxcms_msg_news
-- ----------------------------
INSERT INTO `t_wxcms_msg_news` VALUES ('1', '为什么是jeeweixin', 'jeeweixin', '', '', 'http://www.jeeweixin.com/res/upload/1426908565922.jpg', '1', 'http://www.weixinpy.com/', '', '2');
INSERT INTO `t_wxcms_msg_news` VALUES ('2', '微信开发教程', 'jeeweixin', '', '', 'http://www.jeeweixin.com/res/upload/1426908381642.jpg', null, '', 'http://www.weixinpy.com/', '3');

-- ----------------------------
-- Table structure for `t_wxcms_msg_text`
-- ----------------------------
DROP TABLE IF EXISTS `t_wxcms_msg_text`;
CREATE TABLE `t_wxcms_msg_text` (
  `id` int(11) NOT NULL auto_increment,
  `content` longtext,
  `base_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_wxcms_msg_text
-- ----------------------------
INSERT INTO `t_wxcms_msg_text` VALUES ('1', '感谢您关注微信派，更多请访问 www.weixinpy.com ', '1');

-- ----------------------------
-- Table structure for `team_info`
-- ----------------------------
DROP TABLE IF EXISTS `team_info`;
CREATE TABLE `team_info` (
  `ID` int(11) NOT NULL COMMENT '编号',
  `MEMBER_NAME` varchar(32) default NULL COMMENT '成员姓名',
  `MEMBER_MOBILE_NUM` varchar(32) default NULL COMMENT '成员手机号',
  `MEMBER_ID_NUM` varchar(32) default NULL COMMENT '成员身份证',
  `ATTEND_TIME` date default NULL COMMENT '入团时间（入团action）',
  `R_USER_ID` varchar(32) default NULL COMMENT '关联用户名（可以为空）',
  `MEMBER_TYPE` int(11) default NULL COMMENT '成员类型（LEADER/MEMBER）',
  `CREATE_TIME` date default NULL COMMENT '记录创建时间',
  `UPDATE_TIME` date default NULL COMMENT '记录更新时间',
  `R_PTINFO_ID` int(11) default NULL COMMENT '关联个人行程编号',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='团队信息';

-- ----------------------------
-- Records of team_info
-- ----------------------------

-- ----------------------------
-- Table structure for `template`
-- ----------------------------
DROP TABLE IF EXISTS `template`;
CREATE TABLE `template` (
  `ID` char(10) default NULL COMMENT '编号',
  `TYPE` char(10) default NULL COMMENT '类型（交互类/通知类）',
  `TEMPALTE_NAME` char(10) default NULL COMMENT '模板名称',
  `WX_TEMPALTE_ID` char(10) default NULL COMMENT '微信模板编号',
  `CONTENT` char(10) default NULL COMMENT '内容',
  `DEMO` char(10) default NULL COMMENT '示例',
  `DETAIL_URL` char(10) default NULL COMMENT '详情Url',
  `CREATE_TIME` char(10) default NULL COMMENT '创建时间',
  `UPDATE_TIME` char(10) default NULL COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='模板表';

-- ----------------------------
-- Records of template
-- ----------------------------

-- ----------------------------
-- Table structure for `travel_comments`
-- ----------------------------
DROP TABLE IF EXISTS `travel_comments`;
CREATE TABLE `travel_comments` (
  `ID` int(11) NOT NULL COMMENT '编号',
  `R_USER_ID` varchar(32) default NULL COMMENT '关联评论用户编号',
  `CONTENT` varchar(256) default NULL COMMENT '用户评价内容',
  `SCORE` int(11) default NULL COMMENT '评价星级',
  `CREATE_TIME` date default NULL COMMENT '创建时间',
  `UPDATE_TIME` date default NULL COMMENT '更新时间',
  `R_PTINFO_ID` int(11) default NULL COMMENT '关联个人行程编号',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of travel_comments
-- ----------------------------

-- ----------------------------
-- Table structure for `travel_info_change_log`
-- ----------------------------
DROP TABLE IF EXISTS `travel_info_change_log`;
CREATE TABLE `travel_info_change_log` (
  `ID` int(11) NOT NULL,
  `CONTENT` varchar(256) default NULL,
  `CHANGE_TIME` date default NULL,
  `CHANGE_USER_ID` varchar(32) NOT NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of travel_info_change_log
-- ----------------------------

-- ----------------------------
-- Table structure for `travel_line`
-- ----------------------------
DROP TABLE IF EXISTS `travel_line`;
CREATE TABLE `travel_line` (
  `ID` int(11) NOT NULL COMMENT '线路编号',
  `LINE_NAME` varchar(128) default NULL COMMENT '线路名称',
  `LINE_URL` varchar(256) default NULL COMMENT '线路介绍链接地址',
  `CREATE_TIME` date default NULL COMMENT '创建时间',
  `UPDATE_TIME` date default NULL COMMENT '更新时间',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='旅游线路';

-- ----------------------------
-- Records of travel_line
-- ----------------------------

-- ----------------------------
-- Table structure for `travel_schedule_info`
-- ----------------------------
DROP TABLE IF EXISTS `travel_schedule_info`;
CREATE TABLE `travel_schedule_info` (
  `ID` int(11) NOT NULL COMMENT '行程安排编号',
  `DAY` varchar(32) default NULL COMMENT '安排日期',
  `SCHEDULE_DESC` varchar(256) default NULL COMMENT '当天安排描述（文字）',
  `R_HOTEL_ID` int(11) default NULL COMMENT '当天关联酒店',
  `HOTEL_NAME` varchar(32) default NULL COMMENT '酒店名称',
  `R_PTINFO_ID` int(11) default NULL COMMENT '关联个人行程编号',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='行程安排';

-- ----------------------------
-- Records of travel_schedule_info
-- ----------------------------

-- ----------------------------
-- Table structure for `view_points`
-- ----------------------------
DROP TABLE IF EXISTS `view_points`;
CREATE TABLE `view_points` (
  `ID` int(11) NOT NULL COMMENT '景点编号',
  `NAME` varchar(128) default NULL COMMENT '景点名称',
  `POINT_DESC` varchar(256) default NULL COMMENT '景点描述',
  `URL` varchar(256) default NULL COMMENT '景点介绍链接地址',
  `PRICE_RANGE_U` float default NULL COMMENT '参考价格(上行)',
  `PRICE_RANGE_D` float default NULL COMMENT '参考价格（下行）',
  `LONGITUDE` float default NULL COMMENT '经度',
  `LATITUDE` float default NULL COMMENT '纬度',
  `ADDRESS` varchar(256) default NULL COMMENT '景点地址',
  `COUNTRY` varchar(32) default NULL COMMENT '景点国家',
  `CITY` varchar(32) default NULL COMMENT '景点城市',
  `TAG` varchar(128) default NULL COMMENT '景点标签',
  `CREATE_TIME` date default NULL COMMENT '创建时间',
  `UPDATE_TIME` date default NULL COMMENT '更新时间',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='景点名称';

-- ----------------------------
-- Records of view_points
-- ----------------------------
