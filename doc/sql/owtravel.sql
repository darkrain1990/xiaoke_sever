/*
Navicat MySQL Data Transfer

Source Server         : owtravel
Source Server Version : 50096
Source Host           : localhost:3306
Source Database       : owtravel

Target Server Type    : MYSQL
Target Server Version : 50096
File Encoding         : 65001

Date: 2016-05-14 18:08:57
*/

SET FOREIGN_KEY_CHECKS=0;
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
  `id` int(11) NOT NULL auto_increment COMMENT '权限id',
  `authority_name` varchar(255) NOT NULL COMMENT '权限名',
  `authority_desc` varchar(255) default NULL COMMENT '权限描述',
  `enabled` decimal(1,0) NOT NULL default '0' COMMENT '是否启用 0禁用',
  `issys` decimal(1,0) NOT NULL default '0' COMMENT '否是超级权限  0否',
  `system_id` int(11) default NULL COMMENT '所属系统id',
  `flag` decimal(1,0) default NULL COMMENT '是否删除（0删除1存在）',
  PRIMARY KEY  (`id`),
  KEY `ak_key_1` (`authority_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限表';

-- ----------------------------
-- Records of sys_authorities
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_authorities_resources`
-- ----------------------------
DROP TABLE IF EXISTS `sys_authorities_resources`;
CREATE TABLE `sys_authorities_resources` (
  `authority_id` int(11) NOT NULL COMMENT '权限id',
  `resource_id` int(11) NOT NULL COMMENT '资源id',
  PRIMARY KEY  (`authority_id`,`resource_id`),
  KEY `fk_sys_authorities_resources_1` (`resource_id`),
  CONSTRAINT `fk_sys_authorities_resources_1` FOREIGN KEY (`resource_id`) REFERENCES `sys_resources` (`id`),
  CONSTRAINT `fk_sys_authorities_resources_2` FOREIGN KEY (`authority_id`) REFERENCES `sys_authorities` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限资源关系表';

-- ----------------------------
-- Records of sys_authorities_resources
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_authority_monitor`
-- ----------------------------
DROP TABLE IF EXISTS `sys_authority_monitor`;
CREATE TABLE `sys_authority_monitor` (
  `id` int(11) NOT NULL auto_increment,
  `change_time` datetime default NULL,
  `change_user_id` varchar(32) NOT NULL,
  `change_content` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_authority_monitor
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_resources`
-- ----------------------------
DROP TABLE IF EXISTS `sys_resources`;
CREATE TABLE `sys_resources` (
  `id` int(11) NOT NULL auto_increment COMMENT '资源id',
  `resource_name` varchar(255) NOT NULL COMMENT '资源名称',
  `resource_desc` varchar(255) default NULL COMMENT '资源描述',
  `resource_type` varchar(255) default NULL COMMENT '资源类型',
  `resource_string` varchar(255) NOT NULL COMMENT '资源位置',
  `priority` decimal(1,0) default NULL COMMENT '优先级',
  `enabled` decimal(1,0) NOT NULL default '0' COMMENT '是否启用 0禁用',
  `issys` decimal(1,0) NOT NULL default '0' COMMENT '否是超级资源 0否',
  `system_id` int(11) default NULL COMMENT '所属系统id',
  `parent_id` varchar(255) default NULL COMMENT '父节点',
  `root_id` varchar(255) default NULL COMMENT '根节点',
  `sort_index` decimal(3,0) default NULL COMMENT '显示顺序\r\n            显示顺序\r\n            显示顺序',
  `image_url` varchar(255) default NULL COMMENT '图片地址',
  `is_child` decimal(1,0) default '0' COMMENT '是否有子节点 0否',
  `flag` decimal(1,0) default NULL COMMENT '是否删除（0删除1存在）',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资源表';

-- ----------------------------
-- Records of sys_resources
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_roles`
-- ----------------------------
DROP TABLE IF EXISTS `sys_roles`;
CREATE TABLE `sys_roles` (
  `id` int(11) NOT NULL auto_increment COMMENT '角色id',
  `role_name` varchar(255) NOT NULL COMMENT '角色名',
  `role_desc` varchar(255) default NULL COMMENT '角色描述',
  `system_id` int(11) default NULL COMMENT '所属系统id',
  `enabled` decimal(1,0) NOT NULL default '0' COMMENT '是否启用',
  `issys` decimal(1,0) NOT NULL default '0' COMMENT '否是超级角色',
  `flag` decimal(1,0) default NULL COMMENT '是否删除（0删除1存在）',
  PRIMARY KEY  (`id`),
  KEY `ak_key_1` (`role_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of sys_roles
-- ----------------------------
INSERT INTO `sys_roles` VALUES ('1', '1', '1', null, '0', '0', null);

-- ----------------------------
-- Table structure for `sys_roles_authorities`
-- ----------------------------
DROP TABLE IF EXISTS `sys_roles_authorities`;
CREATE TABLE `sys_roles_authorities` (
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `authority_id` int(11) NOT NULL COMMENT '权限id',
  PRIMARY KEY  (`role_id`,`authority_id`),
  KEY `fk_sys_roles_authorities_2` (`authority_id`),
  CONSTRAINT `fk_sys_roles_authorities_1` FOREIGN KEY (`role_id`) REFERENCES `sys_roles` (`id`),
  CONSTRAINT `fk_sys_roles_authorities_2` FOREIGN KEY (`authority_id`) REFERENCES `sys_authorities` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限角色关系表\r\n';

-- ----------------------------
-- Records of sys_roles_authorities
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_users`
-- ----------------------------
DROP TABLE IF EXISTS `sys_users`;
CREATE TABLE `sys_users` (
  `id` int(11) NOT NULL auto_increment COMMENT '用户id',
  `login_name` varchar(255) NOT NULL COMMENT '登录名',
  `user_name` varchar(255) default NULL COMMENT '用户姓名',
  `user_password` varchar(255) default NULL COMMENT '用户密码',
  `user_desc` varchar(255) default NULL COMMENT '用户描述',
  `enabled` decimal(1,0) NOT NULL default '0' COMMENT '是否可用',
  `issys` decimal(1,0) NOT NULL default '0' COMMENT '否是超级用户',
  `user_dept` varchar(255) default NULL COMMENT '''所在单位',
  `user_duty` varchar(255) default NULL COMMENT '经理或主任',
  `email` varchar(255) default NULL COMMENT '邮件',
  `mobile_num` varchar(16) default NULL COMMENT '手机号码',
  `flag` decimal(1,0) NOT NULL COMMENT '是否删除（0删除1存在）',
  `system_id` decimal(11,0) default NULL COMMENT '所属系统id',
  `create_date` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `ak_key_1` (`login_name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of sys_users
-- ----------------------------
INSERT INTO `sys_users` VALUES ('1', 'admin', 'admin1', 'Pass1234', '123', '1', '1', null, '经理', null, null, '1', '1', '2016-03-30 13:41:12');
INSERT INTO `sys_users` VALUES ('2', 'user_a', '', '123456', '', '1', '0', null, null, null, null, '1', '1', '2016-03-30 14:18:21');
INSERT INTO `sys_users` VALUES ('4', 'user2', '', '72874EDA8497EB222716B6438CAE66AC', '', '1', '0', '', '经理', '', '', '1', '2', '2016-03-30 14:23:17');
INSERT INTO `sys_users` VALUES ('5', 'user3', '', '72874EDA8497EB222716B6438CAE66AC', '', '1', '0', '', '经理', '', '', '1', '1', '2016-03-30 14:24:09');
INSERT INTO `sys_users` VALUES ('6', 'user4', '', '72874EDA8497EB222716B6438CAE66AC', '', '1', '0', '', '经理', '', '', '1', '1', '2016-03-30 14:27:18');
INSERT INTO `sys_users` VALUES ('7', 'user1', '', '72874EDA8497EB222716B6438CAE66AC', '', '1', '0', '', '经理', '', '', '1', '1', '2016-03-30 14:29:36');
INSERT INTO `sys_users` VALUES ('8', 'user5', '', '72874EDA8497EB222716B6438CAE66AC', '', '1', '0', '', '经理', '', '', '1', '3', '2016-03-30 14:29:51');

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
