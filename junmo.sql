/*
Navicat MySQL Data Transfer

Source Server         : localhost_127
Source Server Version : 50515
Source Host           : localhost:3306
Source Database       : junmo

Target Server Type    : MYSQL
Target Server Version : 50515
File Encoding         : 65001

Date: 2019-03-15 17:20:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `blob_data` blob,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `sched_name` varchar(120) NOT NULL,
  `calendar_name` varchar(200) NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`,`calendar_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `cron_expression` varchar(200) NOT NULL,
  `time_zone_id` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', '__TASK_CLASS_NAME__1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', '__TASK_CLASS_NAME__2', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `entry_id` varchar(95) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `instance_name` varchar(200) NOT NULL,
  `fired_time` bigint(13) NOT NULL,
  `sched_time` bigint(13) NOT NULL,
  `priority` int(11) NOT NULL,
  `state` varchar(16) NOT NULL,
  `job_name` varchar(200) DEFAULT NULL,
  `job_group` varchar(200) DEFAULT NULL,
  `is_nonconcurrent` varchar(1) DEFAULT NULL,
  `requests_recovery` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `sched_name` varchar(120) NOT NULL,
  `job_name` varchar(200) NOT NULL,
  `job_group` varchar(200) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `job_class_name` varchar(250) NOT NULL,
  `is_durable` varchar(1) NOT NULL,
  `is_nonconcurrent` varchar(1) NOT NULL,
  `is_update_data` varchar(1) NOT NULL,
  `requests_recovery` varchar(1) NOT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', '__TASK_CLASS_NAME__1', 'DEFAULT', null, 'com.xiwaproject.monitor.job.util.ScheduleJob', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000017400135F5F5441534B5F50524F504552544945535F5F73720028636F6D2E72756F79692E70726F6A6563742E6D6F6E69746F722E6A6F622E646F6D61696E2E4A6F6200000000000000010200084C000E63726F6E45787072657373696F6E7400124C6A6176612F6C616E672F537472696E673B4C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000A6D6574686F644E616D6571007E00094C000C6D6574686F64506172616D7371007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720029636F6D2E72756F79692E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E0787074000070707074000E302F3130202A202A202A202A203F740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC897372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000174000672795461736B74000A72794E6F506172616D7374000074000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', '__TASK_CLASS_NAME__2', 'DEFAULT', null, 'com.xiwaproject.monitor.job.util.ScheduleJob', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000017400135F5F5441534B5F50524F504552544945535F5F73720028636F6D2E72756F79692E70726F6A6563742E6D6F6E69746F722E6A6F622E646F6D61696E2E4A6F6200000000000000010200084C000E63726F6E45787072657373696F6E7400124C6A6176612F6C616E672F537472696E673B4C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000A6D6574686F644E616D6571007E00094C000C6D6574686F64506172616D7371007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720029636F6D2E72756F79692E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E0787074000070707074000E302F3230202A202A202A202A203F740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC897372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000274000672795461736B7400087279506172616D73740002727974000133740001317800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `sched_name` varchar(120) NOT NULL,
  `lock_name` varchar(40) NOT NULL,
  PRIMARY KEY (`sched_name`,`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `sched_name` varchar(120) NOT NULL,
  `instance_name` varchar(200) NOT NULL,
  `last_checkin_time` bigint(13) NOT NULL,
  `checkin_interval` bigint(13) NOT NULL,
  PRIMARY KEY (`sched_name`,`instance_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RuoyiScheduler', 'DESKTOP-IFL7UD71552640130348', '1552641589988', '15000');

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `repeat_count` bigint(7) NOT NULL,
  `repeat_interval` bigint(12) NOT NULL,
  `times_triggered` bigint(10) NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `str_prop_1` varchar(512) DEFAULT NULL,
  `str_prop_2` varchar(512) DEFAULT NULL,
  `str_prop_3` varchar(512) DEFAULT NULL,
  `int_prop_1` int(11) DEFAULT NULL,
  `int_prop_2` int(11) DEFAULT NULL,
  `long_prop_1` bigint(20) DEFAULT NULL,
  `long_prop_2` bigint(20) DEFAULT NULL,
  `dec_prop_1` decimal(13,4) DEFAULT NULL,
  `dec_prop_2` decimal(13,4) DEFAULT NULL,
  `bool_prop_1` varchar(1) DEFAULT NULL,
  `bool_prop_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `job_name` varchar(200) NOT NULL,
  `job_group` varchar(200) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `next_fire_time` bigint(13) DEFAULT NULL,
  `prev_fire_time` bigint(13) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `trigger_state` varchar(16) NOT NULL,
  `trigger_type` varchar(8) NOT NULL,
  `start_time` bigint(13) NOT NULL,
  `end_time` bigint(13) DEFAULT NULL,
  `calendar_name` varchar(200) DEFAULT NULL,
  `misfire_instr` smallint(2) DEFAULT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', '__TASK_CLASS_NAME__1', 'DEFAULT', '__TASK_CLASS_NAME__1', 'DEFAULT', null, '1552460960000', '-1', '5', 'PAUSED', 'CRON', '1552460960000', '0', null, '2', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000017400135F5F5441534B5F50524F504552544945535F5F73720028636F6D2E72756F79692E70726F6A6563742E6D6F6E69746F722E6A6F622E646F6D61696E2E4A6F6200000000000000010200084C000E63726F6E45787072657373696F6E7400124C6A6176612F6C616E672F537472696E673B4C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000A6D6574686F644E616D6571007E00094C000C6D6574686F64506172616D7371007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720029636F6D2E72756F79692E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E0787074000070707074000E302F3130202A202A202A202A203F740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC897372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000174000672795461736B74000A72794E6F506172616D7374000074000133740001317800);
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', '__TASK_CLASS_NAME__2', 'DEFAULT', '__TASK_CLASS_NAME__2', 'DEFAULT', null, '1552460980000', '-1', '5', 'PAUSED', 'CRON', '1552460961000', '0', null, '2', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000017400135F5F5441534B5F50524F504552544945535F5F73720028636F6D2E72756F79692E70726F6A6563742E6D6F6E69746F722E6A6F622E646F6D61696E2E4A6F6200000000000000010200084C000E63726F6E45787072657373696F6E7400124C6A6176612F6C616E672F537472696E673B4C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000A6D6574686F644E616D6571007E00094C000C6D6574686F64506172616D7371007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720029636F6D2E72756F79692E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E0787074000070707074000E302F3230202A202A202A202A203F740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC897372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000274000672795461736B7400087279506172616D73740002727974000133740001317800);

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(100) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='参数配置表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES ('2', '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '初始化密码 123456');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` int(11) DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8 COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('100', '0', '0', '若依科技', '0', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2019-03-15 16:10:34');
INSERT INTO `sys_dept` VALUES ('101', '100', '0,100', '成都总公司', '1', '弟弟1', '18683570549', '165165@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2019-03-15 16:10:22');
INSERT INTO `sys_dept` VALUES ('102', '100', '0,100', '长沙分公司', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('103', '101', '0,100,101', '研发部门', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('104', '101', '0,100,101', '市场部门', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('105', '101', '0,100,101', '测试部门', '3', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('106', '101', '0,100,101', '财务部门', '4', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('107', '101', '0,100,101', '运维部门', '5', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('108', '102', '0,100,102', '市场部门', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('109', '102', '0,100,102', '财务部门', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('110', '100', '0,100', '重庆分公司', '3', '我的弟弟', '18683570454', '317430085@qq.com', '0', '0', 'admin', '2019-03-14 15:54:26', 'admin', '2019-03-15 16:10:34');
INSERT INTO `sys_dept` VALUES ('111', '110', '0,100,110', '研发部门', '1', '弟弟1', '18581878496', '151@qq.com', '0', '0', 'admin', '2019-03-14 15:55:07', 'admin', '2019-03-14 15:59:17');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `dict_code` int(11) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='字典数据表';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES ('1', '1', '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别男');
INSERT INTO `sys_dict_data` VALUES ('2', '2', '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别女');
INSERT INTO `sys_dict_data` VALUES ('3', '3', '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别未知');
INSERT INTO `sys_dict_data` VALUES ('4', '1', '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '显示菜单');
INSERT INTO `sys_dict_data` VALUES ('5', '2', '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES ('6', '1', '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('7', '2', '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES ('8', '1', '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('9', '2', '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES ('10', '1', '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认是');
INSERT INTO `sys_dict_data` VALUES ('11', '2', '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认否');
INSERT INTO `sys_dict_data` VALUES ('12', '1', '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知');
INSERT INTO `sys_dict_data` VALUES ('13', '2', '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '公告');
INSERT INTO `sys_dict_data` VALUES ('14', '1', '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('15', '2', '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '关闭状态');
INSERT INTO `sys_dict_data` VALUES ('16', '1', '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '新增操作');
INSERT INTO `sys_dict_data` VALUES ('17', '2', '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '修改操作');
INSERT INTO `sys_dict_data` VALUES ('18', '3', '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '删除操作');
INSERT INTO `sys_dict_data` VALUES ('19', '4', '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '授权操作');
INSERT INTO `sys_dict_data` VALUES ('20', '5', '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导出操作');
INSERT INTO `sys_dict_data` VALUES ('21', '6', '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导入操作');
INSERT INTO `sys_dict_data` VALUES ('22', '7', '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '强退操作');
INSERT INTO `sys_dict_data` VALUES ('23', '8', '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '生成操作');
INSERT INTO `sys_dict_data` VALUES ('24', '8', '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '清空操作');
INSERT INTO `sys_dict_data` VALUES ('25', '1', '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('26', '2', '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='字典类型表';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES ('1', '用户性别', 'sys_user_sex', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2019-03-15 16:31:42', '用户性别列表');
INSERT INTO `sys_dict_type` VALUES ('2', '菜单状态', 'sys_show_hide', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES ('3', '系统开关', 'sys_normal_disable', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统开关列表');
INSERT INTO `sys_dict_type` VALUES ('4', '任务状态', 'sys_job_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '任务状态列表');
INSERT INTO `sys_dict_type` VALUES ('5', '系统是否', 'sys_yes_no', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统是否列表');
INSERT INTO `sys_dict_type` VALUES ('6', '通知类型', 'sys_notice_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知类型列表');
INSERT INTO `sys_dict_type` VALUES ('7', '通知状态', 'sys_notice_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知状态列表');
INSERT INTO `sys_dict_type` VALUES ('8', '操作类型', 'sys_oper_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作类型列表');
INSERT INTO `sys_dict_type` VALUES ('9', '系统状态', 'sys_common_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
  `job_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT '' COMMENT '任务组名',
  `method_name` varchar(500) DEFAULT '' COMMENT '任务方法',
  `method_params` varchar(50) DEFAULT NULL COMMENT '方法参数',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='定时任务调度表';

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES ('1', 'ryTask', '系统默认（无参）', 'ryNoParams', '', '0/10 * * * * ?', '3', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_job` VALUES ('2', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', '0/20 * * * * ?', '3', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log` (
  `job_log_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `method_name` varchar(500) DEFAULT NULL COMMENT '任务方法',
  `method_params` varchar(50) DEFAULT NULL COMMENT '方法参数',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定时任务调度日志表';

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor` (
  `info_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(50) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8 COMMENT='系统访问记录';

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES ('100', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-13 15:11:42');
INSERT INTO `sys_logininfor` VALUES ('101', 'admin', '10.0.3.64', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-03-13 15:20:06');
INSERT INTO `sys_logininfor` VALUES ('102', 'admin', '10.0.3.64', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-13 15:20:15');
INSERT INTO `sys_logininfor` VALUES ('103', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-13 16:43:02');
INSERT INTO `sys_logininfor` VALUES ('104', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-13 17:08:48');
INSERT INTO `sys_logininfor` VALUES ('105', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-03-14 09:43:29');
INSERT INTO `sys_logininfor` VALUES ('106', 'woshididi', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-14 09:44:04');
INSERT INTO `sys_logininfor` VALUES ('107', 'woshididi', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-03-14 09:46:57');
INSERT INTO `sys_logininfor` VALUES ('108', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-03-14 11:20:22');
INSERT INTO `sys_logininfor` VALUES ('109', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-03-14 11:20:26');
INSERT INTO `sys_logininfor` VALUES ('110', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-14 11:20:31');
INSERT INTO `sys_logininfor` VALUES ('111', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-14 14:17:12');
INSERT INTO `sys_logininfor` VALUES ('112', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-14 17:00:12');
INSERT INTO `sys_logininfor` VALUES ('113', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-03-14 17:36:38');
INSERT INTO `sys_logininfor` VALUES ('114', 'woshididi', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-14 17:36:52');
INSERT INTO `sys_logininfor` VALUES ('115', 'woshididi', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-03-14 17:37:02');
INSERT INTO `sys_logininfor` VALUES ('116', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-14 17:37:08');
INSERT INTO `sys_logininfor` VALUES ('117', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-03-14 17:38:38');
INSERT INTO `sys_logininfor` VALUES ('118', 'woshididi', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-14 17:38:48');
INSERT INTO `sys_logininfor` VALUES ('119', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-15 14:40:35');
INSERT INTO `sys_logininfor` VALUES ('120', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-03-15 14:42:54');
INSERT INTO `sys_logininfor` VALUES ('121', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-15 14:43:01');
INSERT INTO `sys_logininfor` VALUES ('122', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-03-15 14:51:17');
INSERT INTO `sys_logininfor` VALUES ('123', 'didi2', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-15 14:51:26');
INSERT INTO `sys_logininfor` VALUES ('124', 'didi2', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-03-15 14:59:33');
INSERT INTO `sys_logininfor` VALUES ('125', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-15 14:59:42');
INSERT INTO `sys_logininfor` VALUES ('126', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-03-15 14:59:48');
INSERT INTO `sys_logininfor` VALUES ('127', 'woshididi', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-15 14:59:59');
INSERT INTO `sys_logininfor` VALUES ('128', 'woshididi', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-03-15 15:16:42');
INSERT INTO `sys_logininfor` VALUES ('129', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-03-15 15:16:45');
INSERT INTO `sys_logininfor` VALUES ('130', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-15 15:16:49');
INSERT INTO `sys_logininfor` VALUES ('131', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-15 16:01:07');
INSERT INTO `sys_logininfor` VALUES ('132', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-03-15 16:47:56');
INSERT INTO `sys_logininfor` VALUES ('133', 'didi2', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-15 16:48:05');
INSERT INTO `sys_logininfor` VALUES ('134', 'didi2', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-03-15 16:48:26');
INSERT INTO `sys_logininfor` VALUES ('135', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-03-15 16:48:27');
INSERT INTO `sys_logininfor` VALUES ('136', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-15 16:48:30');
INSERT INTO `sys_logininfor` VALUES ('137', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-03-15 16:55:48');
INSERT INTO `sys_logininfor` VALUES ('138', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-03-15 16:55:54');
INSERT INTO `sys_logininfor` VALUES ('139', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-15 16:55:57');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` int(11) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `url` varchar(200) DEFAULT '#' COMMENT '请求地址',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1058 DEFAULT CHARSET=utf8 COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '系统管理', '0', '1', '#', 'M', '0', '', 'fa fa-gear', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统管理目录');
INSERT INTO `sys_menu` VALUES ('2', '系统监控', '0', '2', '#', 'M', '0', '', 'fa fa-video-camera', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统监控目录');
INSERT INTO `sys_menu` VALUES ('100', '用户管理', '1', '1', '/system/user', 'C', '0', 'system:user:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户管理菜单');
INSERT INTO `sys_menu` VALUES ('101', '角色管理', '1', '2', '/system/role', 'C', '0', 'system:role:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '角色管理菜单');
INSERT INTO `sys_menu` VALUES ('102', '菜单管理', '1', '3', '/system/menu', 'C', '0', 'system:menu:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单管理菜单');
INSERT INTO `sys_menu` VALUES ('103', '部门管理', '1', '4', '/system/dept', 'C', '0', 'system:dept:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '部门管理菜单');
INSERT INTO `sys_menu` VALUES ('104', '岗位管理', '1', '5', '/system/post', 'C', '0', 'system:post:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES ('105', '字典管理', '1', '6', '/system/dict', 'C', '0', 'system:dict:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '字典管理菜单');
INSERT INTO `sys_menu` VALUES ('108', '日志管理', '1', '9', '#', 'M', '0', '', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '日志管理菜单');
INSERT INTO `sys_menu` VALUES ('109', '在线用户', '2', '1', '/monitor/online', 'C', '0', 'monitor:online:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '在线用户菜单');
INSERT INTO `sys_menu` VALUES ('112', '服务监控', '2', '3', '/monitor/server', 'C', '0', 'monitor:server:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '服务监控菜单');
INSERT INTO `sys_menu` VALUES ('113', '表单构建', '3', '1', '/tool/build', 'C', '1', 'tool:build:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2019-03-15 16:34:09', '表单构建菜单');
INSERT INTO `sys_menu` VALUES ('500', '操作日志', '108', '1', '/monitor/operlog', 'C', '0', 'monitor:operlog:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作日志菜单');
INSERT INTO `sys_menu` VALUES ('501', '登录日志', '108', '2', '/monitor/logininfor', 'C', '0', 'monitor:logininfor:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录日志菜单');
INSERT INTO `sys_menu` VALUES ('1000', '用户查询', '100', '1', '#', 'F', '0', 'system:user:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1001', '用户新增', '100', '2', '#', 'F', '0', 'system:user:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1002', '用户修改', '100', '3', '#', 'F', '0', 'system:user:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1003', '用户删除', '100', '4', '#', 'F', '0', 'system:user:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1004', '用户导出', '100', '5', '#', 'F', '0', 'system:user:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1005', '用户导入', '100', '6', '#', 'F', '0', 'system:user:import', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1006', '重置密码', '100', '7', '#', 'F', '0', 'system:user:resetPwd', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1007', '角色查询', '101', '1', '#', 'F', '0', 'system:role:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1008', '角色新增', '101', '2', '#', 'F', '0', 'system:role:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1009', '角色修改', '101', '3', '#', 'F', '0', 'system:role:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1010', '角色删除', '101', '4', '#', 'F', '0', 'system:role:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1011', '角色导出', '101', '5', '#', 'F', '0', 'system:role:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1012', '菜单查询', '102', '1', '#', 'F', '0', 'system:menu:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1013', '菜单新增', '102', '2', '#', 'F', '0', 'system:menu:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1014', '菜单修改', '102', '3', '#', 'F', '0', 'system:menu:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1015', '菜单删除', '102', '4', '#', 'F', '0', 'system:menu:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1016', '部门查询', '103', '1', '#', 'F', '0', 'system:dept:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1017', '部门新增', '103', '2', '#', 'F', '0', 'system:dept:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1018', '部门修改', '103', '3', '#', 'F', '0', 'system:dept:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1019', '部门删除', '103', '4', '#', 'F', '0', 'system:dept:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1020', '岗位查询', '104', '1', '#', 'F', '0', 'system:post:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1021', '岗位新增', '104', '2', '#', 'F', '0', 'system:post:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1022', '岗位修改', '104', '3', '#', 'F', '0', 'system:post:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1023', '岗位删除', '104', '4', '#', 'F', '0', 'system:post:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1024', '岗位导出', '104', '5', '#', 'F', '0', 'system:post:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1025', '字典查询', '105', '1', '#', 'F', '0', 'system:dict:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1026', '字典新增', '105', '2', '#', 'F', '0', 'system:dict:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1027', '字典修改', '105', '3', '#', 'F', '0', 'system:dict:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1028', '字典删除', '105', '4', '#', 'F', '0', 'system:dict:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1029', '字典导出', '105', '5', '#', 'F', '0', 'system:dict:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1030', '参数查询', '106', '1', '#', 'F', '0', 'system:config:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1031', '参数新增', '106', '2', '#', 'F', '0', 'system:config:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1032', '参数修改', '106', '3', '#', 'F', '0', 'system:config:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1033', '参数删除', '106', '4', '#', 'F', '0', 'system:config:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1034', '参数导出', '106', '5', '#', 'F', '0', 'system:config:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1035', '公告查询', '107', '1', '#', 'F', '0', 'system:notice:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1036', '公告新增', '107', '2', '#', 'F', '0', 'system:notice:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1037', '公告修改', '107', '3', '#', 'F', '0', 'system:notice:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1038', '公告删除', '107', '4', '#', 'F', '0', 'system:notice:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1039', '操作查询', '500', '1', '#', 'F', '0', 'monitor:operlog:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1040', '操作删除', '500', '2', '#', 'F', '0', 'monitor:operlog:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1041', '详细信息', '500', '3', '#', 'F', '0', 'monitor:operlog:detail', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1042', '日志导出', '500', '4', '#', 'F', '0', 'monitor:operlog:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1043', '登录查询', '501', '1', '#', 'F', '0', 'monitor:logininfor:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1044', '登录删除', '501', '2', '#', 'F', '0', 'monitor:logininfor:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1045', '日志导出', '501', '3', '#', 'F', '0', 'monitor:logininfor:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1046', '在线查询', '109', '1', '#', 'F', '0', 'monitor:online:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1047', '批量强退', '109', '2', '#', 'F', '0', 'monitor:online:batchForceLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1048', '单条强退', '109', '3', '#', 'F', '0', 'monitor:online:forceLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1049', '任务查询', '110', '1', '#', 'F', '0', 'monitor:job:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1050', '任务新增', '110', '2', '#', 'F', '0', 'monitor:job:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1051', '任务修改', '110', '3', '#', 'F', '0', 'monitor:job:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1052', '任务删除', '110', '4', '#', 'F', '0', 'monitor:job:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1053', '状态修改', '110', '5', '#', 'F', '0', 'monitor:job:changeStatus', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1054', '任务详细', '110', '6', '#', 'F', '0', 'monitor:job:detail', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1055', '任务导出', '110', '7', '#', 'F', '0', 'monitor:job:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1056', '生成查询', '114', '1', '#', 'F', '0', 'tool:gen:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1057', '生成代码', '114', '2', '#', 'F', '0', 'tool:gen:code', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(2000) DEFAULT NULL COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='通知公告表';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES ('1', '温馨提醒：2018-07-01 若依新版本发布啦', '2', '新版本内容', '1', 'admin', '2018-03-16 11:33:00', 'admin', '2019-03-13 15:18:04', '管理员');
INSERT INTO `sys_notice` VALUES ('2', '维护通知：2018-07-01 若依系统凌晨维护', '1', '维护内容', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
  `oper_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `operator_type` int(1) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `status` int(1) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=158 DEFAULT CHARSET=utf8 COMMENT='操作日志记录';

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES ('100', '代码生成', '8', 'com.xiwaproject.tool.gen.controller.GenController.genCode()', '1', 'admin', '研发部门', '/tool/gen/genCode/sys_oper_log', '127.0.0.1', '内网IP', '{}', '0', null, '2019-03-13 15:13:30');
INSERT INTO `sys_oper_log` VALUES ('101', '字典类型', '2', 'com.xiwaproject.system.dict.controller.DictTypeController.editSave()', '1', 'admin', '研发部门', '/system/dict/edit', '127.0.0.1', '内网IP', '{\"dictId\":[\"1\"],\"dictName\":[\"用户性别\"],\"dictType\":[\"sys_user_sex\"],\"status\":[\"1\"],\"remark\":[\"用户性别列表\"]}', '0', null, '2019-03-13 15:15:11');
INSERT INTO `sys_oper_log` VALUES ('102', '通知公告', '2', 'com.xiwaproject.system.notice.controller.NoticeController.editSave()', '1', 'admin', '研发部门', '/system/notice/edit', '127.0.0.1', '内网IP', '{\"noticeId\":[\"1\"],\"noticeTitle\":[\"温馨提醒：2018-07-01 若依新版本发布啦\"],\"noticeType\":[\"2\"],\"noticeContent\":[\"新版本内容\"],\"status\":[\"1\"]}', '0', null, '2019-03-13 15:18:04');
INSERT INTO `sys_oper_log` VALUES ('103', '角色管理', '5', 'com.xiwaproject.system.role.controller.RoleController.export()', '1', 'admin', '研发部门', '/system/role/export', '127.0.0.1', '内网IP', '{\"roleName\":[\"\"],\"roleKey\":[\"\"],\"status\":[\"\"],\"params[beginTime]\":[\"\"],\"params[endTime]\":[\"\"]}', '0', null, '2019-03-13 15:18:25');
INSERT INTO `sys_oper_log` VALUES ('104', '角色管理', '1', 'com.xiwaproject.system.role.controller.RoleController.addSave()', '1', 'admin', '研发部门', '/system/role/add', '127.0.0.1', '内网IP', '{\"roleName\":[\"系统功能维护\"],\"roleKey\":[\"1\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"1\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,1055,111,112,3,113,114,1056,1057,115\"]}', '0', null, '2019-03-13 17:34:11');
INSERT INTO `sys_oper_log` VALUES ('105', '角色管理', '3', 'com.xiwaproject.system.role.controller.RoleController.remove()', '1', 'admin', '研发部门', '/system/role/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"100\"]}', '0', null, '2019-03-13 17:34:26');
INSERT INTO `sys_oper_log` VALUES ('106', '用户管理', '1', 'com.xiwaproject.system.user.controller.UserController.addSave()', '1', 'admin', '研发部门', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"107\"],\"userName\":[\"我是弟弟\"],\"deptName\":[\"运维部门\"],\"phonenumber\":[\"18683570454\"],\"email\":[\"317430085@qq.com\"],\"loginName\":[\"woshididi\"],\"password\":[\"woshididi\"],\"sex\":[\"0\"],\"role\":[\"2\"],\"remark\":[\"弟弟\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"4\"]}', '0', null, '2019-03-14 09:43:21');
INSERT INTO `sys_oper_log` VALUES ('107', '角色管理', '2', 'com.xiwaproject.system.role.controller.RoleController.ruleSave()', '1', 'woshididi', '运维部门', '/system/role/rule', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通角色\"],\"roleKey\":[\"common\"],\"dataScope\":[\"2\"],\"deptIds\":[\"100,101,105\"]}', '0', null, '2019-03-14 09:44:38');
INSERT INTO `sys_oper_log` VALUES ('108', '用户管理', '2', 'com.xiwaproject.system.user.controller.UserController.editSave()', '1', 'admin', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"3\"],\"deptId\":[\"107\"],\"userName\":[\"我是弟弟\"],\"dept.deptName\":[\"运维部门\"],\"phonenumber\":[\"18683570454\"],\"email\":[\"317430085@qq.com\"],\"loginName\":[\"woshididi\"],\"sex\":[\"0\"],\"role\":[\"1\"],\"remark\":[\"弟弟\"],\"status\":[\"0\"],\"roleIds\":[\"1\"],\"postIds\":[\"2\"]}', '0', null, '2019-03-14 14:14:47');
INSERT INTO `sys_oper_log` VALUES ('109', '部门管理', '1', 'com.xiwaproject.system.dept.controller.DeptController.addSave()', '1', 'admin', '研发部门', '/system/dept/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"100\"],\"deptName\":[\"成都分公司\"],\"orderNum\":[\"3\"],\"leader\":[\"我的弟弟\"],\"phone\":[\"18683570454\"],\"email\":[\"317430085@qq.com\"],\"status\":[\"0\"]}', '0', null, '2019-03-14 15:54:26');
INSERT INTO `sys_oper_log` VALUES ('110', '部门管理', '1', 'com.xiwaproject.system.dept.controller.DeptController.addSave()', '1', 'admin', '研发部门', '/system/dept/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"110\"],\"deptName\":[\"研发部门\"],\"orderNum\":[\"1\"],\"leader\":[\"弟弟\"],\"phone\":[\"18581878496\"],\"email\":[\"151@qq.com\"],\"status\":[\"0\"]}', '0', null, '2019-03-14 15:55:07');
INSERT INTO `sys_oper_log` VALUES ('111', '部门管理', '2', 'com.xiwaproject.system.dept.controller.DeptController.editSave()', '1', 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"111\"],\"parentId\":[\"110\"],\"parentName\":[\"成都分公司\"],\"deptName\":[\"研发部门\"],\"orderNum\":[\"1\"],\"leader\":[\"弟弟1\"],\"phone\":[\"18581878496\"],\"email\":[\"151@qq.com\"],\"status\":[\"0\"]}', '0', null, '2019-03-14 15:59:17');
INSERT INTO `sys_oper_log` VALUES ('112', '菜单管理', '2', 'com.xiwaproject.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"3\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"系统工具\"],\"url\":[\"#\"],\"perms\":[\"\"],\"orderNum\":[\"3\"],\"icon\":[\"fa fa-bars\"],\"visible\":[\"0\"]}', '0', null, '2019-03-14 16:43:49');
INSERT INTO `sys_oper_log` VALUES ('113', '菜单管理', '3', 'com.xiwaproject.system.menu.controller.MenuController.remove()', '1', 'admin', '研发部门', '/system/menu/remove/3', '127.0.0.1', '内网IP', '{}', '0', null, '2019-03-14 16:44:28');
INSERT INTO `sys_oper_log` VALUES ('114', '菜单管理', '3', 'com.xiwaproject.system.menu.controller.MenuController.remove()', '1', 'admin', '研发部门', '/system/menu/remove/113', '127.0.0.1', '内网IP', '{}', '0', null, '2019-03-14 16:44:33');
INSERT INTO `sys_oper_log` VALUES ('115', '菜单管理', '3', 'com.xiwaproject.system.menu.controller.MenuController.remove()', '1', 'admin', '研发部门', '/system/menu/remove/113', '127.0.0.1', '内网IP', '{}', '0', null, '2019-03-14 16:44:50');
INSERT INTO `sys_oper_log` VALUES ('116', '菜单管理', '3', 'com.xiwaproject.system.menu.controller.MenuController.remove()', '1', 'admin', '研发部门', '/system/menu/remove/114', '127.0.0.1', '内网IP', '{}', '0', null, '2019-03-14 16:45:02');
INSERT INTO `sys_oper_log` VALUES ('117', '菜单管理', '3', 'com.xiwaproject.system.menu.controller.MenuController.remove()', '1', 'admin', '研发部门', '/system/menu/remove/1056', '127.0.0.1', '内网IP', '{}', '0', null, '2019-03-14 16:45:06');
INSERT INTO `sys_oper_log` VALUES ('118', '菜单管理', '3', 'com.xiwaproject.system.menu.controller.MenuController.remove()', '1', 'admin', '研发部门', '/system/menu/remove/1057', '127.0.0.1', '内网IP', '{}', '0', null, '2019-03-14 16:45:17');
INSERT INTO `sys_oper_log` VALUES ('119', '菜单管理', '3', 'com.xiwaproject.system.menu.controller.MenuController.remove()', '1', 'admin', '研发部门', '/system/menu/remove/1057', '127.0.0.1', '内网IP', '{}', '0', null, '2019-03-14 16:46:08');
INSERT INTO `sys_oper_log` VALUES ('120', '菜单管理', '3', 'com.xiwaproject.system.menu.controller.MenuController.remove()', '1', 'admin', '研发部门', '/system/menu/remove/1057', '127.0.0.1', '内网IP', '{}', '0', null, '2019-03-14 16:47:35');
INSERT INTO `sys_oper_log` VALUES ('121', '用户管理', '2', 'com.xiwaproject.system.user.controller.UserController.editSave()', '1', 'admin', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"3\"],\"deptId\":[\"107\"],\"userName\":[\"我是弟弟\"],\"dept.deptName\":[\"运维部门\"],\"phonenumber\":[\"18683570454\"],\"email\":[\"317430085@qq.com\"],\"loginName\":[\"woshididi\"],\"sex\":[\"0\"],\"role\":[\"1\"],\"remark\":[\"弟弟\"],\"status\":[\"0\"],\"roleIds\":[\"1\"],\"postIds\":[\"2\"]}', '0', null, '2019-03-14 17:37:21');
INSERT INTO `sys_oper_log` VALUES ('122', '重置密码', '2', 'com.xiwaproject.system.user.controller.UserController.resetPwd()', '1', 'admin', '研发部门', '/system/user/resetPwd/3', '127.0.0.1', '内网IP', '{}', '0', null, '2019-03-14 17:37:41');
INSERT INTO `sys_oper_log` VALUES ('123', '用户管理', '2', 'com.xiwaproject.system.user.controller.UserController.editSave()', '1', 'admin', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"3\"],\"deptId\":[\"111\"],\"userName\":[\"我是弟弟\"],\"dept.deptName\":[\"研发部门\"],\"phonenumber\":[\"18683570454\"],\"email\":[\"317430085@qq.com\"],\"loginName\":[\"woshididi\"],\"sex\":[\"0\"],\"role\":[\"1\"],\"remark\":[\"弟弟\"],\"status\":[\"0\"],\"roleIds\":[\"1\"],\"postIds\":[\"2\"]}', '0', null, '2019-03-14 17:38:06');
INSERT INTO `sys_oper_log` VALUES ('124', '用户管理', '2', 'com.xiwaproject.system.user.controller.UserController.editSave()', '1', 'admin', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"3\"],\"deptId\":[\"111\"],\"userName\":[\"我是弟弟\"],\"dept.deptName\":[\"研发部门\"],\"phonenumber\":[\"18683570454\"],\"email\":[\"317430085@qq.com\"],\"loginName\":[\"woshididi\"],\"sex\":[\"0\"],\"role\":[\"1\",\"2\"],\"remark\":[\"弟弟\"],\"status\":[\"0\"],\"roleIds\":[\"1,2\"],\"postIds\":[\"2\"]}', '0', null, '2019-03-14 17:38:12');
INSERT INTO `sys_oper_log` VALUES ('125', '角色管理', '2', 'com.xiwaproject.system.role.controller.RoleController.editSave()', '1', 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"1\"],\"roleName\":[\"管理员\"],\"roleKey\":[\"admin\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"管理员\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,1055,111,112\"]}', '0', null, '2019-03-14 17:38:35');
INSERT INTO `sys_oper_log` VALUES ('126', '用户管理', '2', 'com.xiwaproject.system.user.controller.UserController.editSave()', '1', 'woshididi', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"1\"],\"deptId\":[\"103\"],\"userName\":[\"若依\"],\"dept.deptName\":[\"研发部门\"],\"phonenumber\":[\"15888888888\"],\"email\":[\"ry@163.com\"],\"loginName\":[\"admin\"],\"sex\":[\"1\"],\"role\":[\"1\"],\"remark\":[\"管理员\"],\"status\":[\"0\"],\"roleIds\":[\"1\"],\"postIds\":[\"1\"]}', '0', null, '2019-03-14 17:39:16');
INSERT INTO `sys_oper_log` VALUES ('127', '用户管理', '1', 'com.xiwaproject.system.user.controller.UserController.addSave()', '1', 'woshididi', '研发部门', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"111\"],\"userName\":[\"弟弟1\"],\"deptName\":[\"研发部门\"],\"phonenumber\":[\"18683570451\"],\"email\":[\"55615@qq.com\"],\"loginName\":[\"didi1\"],\"password\":[\"didi1\"],\"sex\":[\"0\"],\"role\":[\"2\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"4\"]}', '0', null, '2019-03-14 17:40:24');
INSERT INTO `sys_oper_log` VALUES ('128', '用户管理', '1', 'com.xiwaproject.system.user.controller.UserController.addSave()', '1', 'admin', '研发部门', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"111\"],\"userName\":[\"didi2\"],\"deptName\":[\"研发部门\"],\"phonenumber\":[\"18581878496\"],\"email\":[\"3030@qq.com\"],\"loginName\":[\"didi2\"],\"password\":[\"didi2\"],\"sex\":[\"0\"],\"role\":[\"2\"],\"remark\":[\"didi2\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"4\"]}', '0', null, '2019-03-15 14:43:56');
INSERT INTO `sys_oper_log` VALUES ('129', '角色管理', '2', 'com.xiwaproject.system.role.controller.RoleController.editSave()', '1', 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通角色\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,1055,111,112\"]}', '0', null, '2019-03-15 14:44:27');
INSERT INTO `sys_oper_log` VALUES ('130', '角色管理', '2', 'com.xiwaproject.system.role.controller.RoleController.editSave()', '1', 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通角色\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,1055,111,112,3,113,114,1056,1057,115\"]}', '0', null, '2019-03-15 14:44:34');
INSERT INTO `sys_oper_log` VALUES ('131', '用户管理', '1', 'com.xiwaproject.system.user.controller.UserController.addSave()', '1', 'admin', '研发部门', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"111\"],\"userName\":[\"didi3\"],\"deptName\":[\"研发部门\"],\"phonenumber\":[\"18683570452\"],\"email\":[\"1161651@qq.com\"],\"loginName\":[\"didi3\"],\"password\":[\"123456\"],\"sex\":[\"0\"],\"role\":[\"1\"],\"remark\":[\"didi3\"],\"status\":[\"0\"],\"roleIds\":[\"1\"],\"postIds\":[\"3\"]}', '0', null, '2019-03-15 15:17:37');
INSERT INTO `sys_oper_log` VALUES ('132', '用户管理', '1', 'com.xiwaproject.system.user.controller.UserController.addSave()', '1', 'admin', '研发部门', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"111\"],\"userName\":[\"didi4\"],\"deptName\":[\"研发部门\"],\"phonenumber\":[\"18683570455\"],\"email\":[\"21545@qq.com\"],\"loginName\":[\"132132@qq.com\"],\"password\":[\"didi4\"],\"sex\":[\"0\"],\"role\":[\"1\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"1\"],\"postIds\":[\"3\"]}', '0', null, '2019-03-15 16:01:51');
INSERT INTO `sys_oper_log` VALUES ('133', '角色管理', '2', 'com.xiwaproject.system.role.controller.RoleController.editSave()', '1', 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通角色\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045\"]}', '0', null, '2019-03-15 16:07:03');
INSERT INTO `sys_oper_log` VALUES ('134', '角色管理', '2', 'com.xiwaproject.system.role.controller.RoleController.editSave()', '1', 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"1\"],\"roleName\":[\"管理员\"],\"roleKey\":[\"admin\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"管理员\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,1055,111,112,3,113,114,1056,1057,115\"]}', '0', null, '2019-03-15 16:07:12');
INSERT INTO `sys_oper_log` VALUES ('135', '部门管理', '2', 'com.xiwaproject.system.dept.controller.DeptController.editSave()', '1', 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"101\"],\"parentId\":[\"100\"],\"parentName\":[\"若依科技\"],\"deptName\":[\"成都总公司\"],\"orderNum\":[\"1\"],\"leader\":[\"弟弟1\"],\"phone\":[\"18683570549\"],\"email\":[\"165165@qq.com\"],\"status\":[\"0\"]}', '0', null, '2019-03-15 16:10:22');
INSERT INTO `sys_oper_log` VALUES ('136', '部门管理', '2', 'com.xiwaproject.system.dept.controller.DeptController.editSave()', '1', 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"110\"],\"parentId\":[\"100\"],\"parentName\":[\"若依科技\"],\"deptName\":[\"重庆分公司\"],\"orderNum\":[\"3\"],\"leader\":[\"我的弟弟\"],\"phone\":[\"18683570454\"],\"email\":[\"317430085@qq.com\"],\"status\":[\"0\"]}', '0', null, '2019-03-15 16:10:34');
INSERT INTO `sys_oper_log` VALUES ('137', '字典类型', '2', 'com.xiwaproject.system.dict.controller.DictTypeController.editSave()', '1', 'admin', '研发部门', '/system/dict/edit', '127.0.0.1', '内网IP', '{\"dictId\":[\"1\"],\"dictName\":[\"用户性别\"],\"dictType\":[\"sys_user_sex\"],\"status\":[\"0\"],\"remark\":[\"用户性别列表\"]}', '0', null, '2019-03-15 16:31:42');
INSERT INTO `sys_oper_log` VALUES ('138', '菜单管理', '2', 'com.xiwaproject.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"3\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"系统工具\"],\"url\":[\"#\"],\"perms\":[\"\"],\"orderNum\":[\"3\"],\"icon\":[\"fa fa-bars\"],\"visible\":[\"1\"]}', '0', null, '2019-03-15 16:33:41');
INSERT INTO `sys_oper_log` VALUES ('139', '菜单管理', '3', 'com.xiwaproject.system.menu.controller.MenuController.remove()', '1', 'admin', '研发部门', '/system/menu/remove/3', '127.0.0.1', '内网IP', '{}', '0', null, '2019-03-15 16:33:51');
INSERT INTO `sys_oper_log` VALUES ('140', '菜单管理', '2', 'com.xiwaproject.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"113\"],\"parentId\":[\"3\"],\"menuType\":[\"C\"],\"menuName\":[\"表单构建\"],\"url\":[\"/tool/build\"],\"perms\":[\"tool:build:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"1\"]}', '0', null, '2019-03-15 16:34:09');
INSERT INTO `sys_oper_log` VALUES ('141', '菜单管理', '3', 'com.xiwaproject.system.menu.controller.MenuController.remove()', '1', 'admin', '研发部门', '/system/menu/remove/115', '127.0.0.1', '内网IP', '{}', '0', null, '2019-03-15 16:47:00');
INSERT INTO `sys_oper_log` VALUES ('142', '角色管理', '2', 'com.xiwaproject.system.role.controller.RoleController.editSave()', '1', 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"1\"],\"roleName\":[\"管理员\"],\"roleKey\":[\"admin\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"管理员\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,1055,111,112\"]}', '0', null, '2019-03-15 16:47:36');
INSERT INTO `sys_oper_log` VALUES ('143', '角色管理', '2', 'com.xiwaproject.system.role.controller.RoleController.editSave()', '1', 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通角色\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045\"]}', '0', null, '2019-03-15 16:47:40');
INSERT INTO `sys_oper_log` VALUES ('144', '菜单管理', '3', 'com.xiwaproject.system.menu.controller.MenuController.remove()', '1', 'admin', '研发部门', '/system/menu/remove/115', '127.0.0.1', '内网IP', '{}', '0', null, '2019-03-15 16:47:50');
INSERT INTO `sys_oper_log` VALUES ('145', '菜单管理', '3', 'com.xiwaproject.system.menu.controller.MenuController.remove()', '1', 'didi2', '研发部门', '/system/menu/remove/113', '127.0.0.1', '内网IP', '{}', '0', null, '2019-03-15 16:48:19');
INSERT INTO `sys_oper_log` VALUES ('146', '菜单管理', '2', 'com.xiwaproject.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"3\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"系统工具\"],\"url\":[\"#\"],\"perms\":[\"\"],\"orderNum\":[\"3\"],\"icon\":[\"fa fa-bars\"],\"visible\":[\"0\"]}', '0', null, '2019-03-15 16:48:55');
INSERT INTO `sys_oper_log` VALUES ('147', '用户管理', '2', 'com.xiwaproject.system.user.controller.UserController.editSave()', '1', 'admin', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"2\"],\"deptId\":[\"105\"],\"userName\":[\"若依\"],\"dept.deptName\":[\"测试部门\"],\"phonenumber\":[\"15666666666\"],\"email\":[\"ry@qq.com\"],\"loginName\":[\"ry\"],\"sex\":[\"1\"],\"role\":[\"1\",\"2\"],\"remark\":[\"测试员\"],\"status\":[\"0\"],\"roleIds\":[\"1,2\"],\"postIds\":[\"2\"]}', '0', null, '2019-03-15 16:49:13');
INSERT INTO `sys_oper_log` VALUES ('148', '菜单管理', '3', 'com.xiwaproject.system.menu.controller.MenuController.remove()', '1', 'admin', '研发部门', '/system/menu/remove/114', '127.0.0.1', '内网IP', '{}', '0', null, '2019-03-15 17:03:55');
INSERT INTO `sys_oper_log` VALUES ('149', '用户管理', '2', 'com.xiwaproject.system.user.controller.UserController.changeStatus()', '1', 'admin', '研发部门', '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"userId\":[\"6\"],\"status\":[\"1\"]}', '0', null, '2019-03-15 17:05:30');
INSERT INTO `sys_oper_log` VALUES ('150', '用户管理', '2', 'com.xiwaproject.system.user.controller.UserController.changeStatus()', '1', 'admin', '研发部门', '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"userId\":[\"5\"],\"status\":[\"1\"]}', '0', null, '2019-03-15 17:05:32');
INSERT INTO `sys_oper_log` VALUES ('151', '用户管理', '2', 'com.xiwaproject.system.user.controller.UserController.changeStatus()', '1', 'admin', '研发部门', '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"userId\":[\"4\"],\"status\":[\"1\"]}', '0', null, '2019-03-15 17:05:34');
INSERT INTO `sys_oper_log` VALUES ('152', '用户管理', '2', 'com.xiwaproject.system.user.controller.UserController.changeStatus()', '1', 'admin', '研发部门', '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"userId\":[\"3\"],\"status\":[\"1\"]}', '0', null, '2019-03-15 17:05:37');
INSERT INTO `sys_oper_log` VALUES ('153', '用户管理', '2', 'com.xiwaproject.system.user.controller.UserController.changeStatus()', '1', 'admin', '研发部门', '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"userId\":[\"2\"],\"status\":[\"1\"]}', '0', null, '2019-03-15 17:05:45');
INSERT INTO `sys_oper_log` VALUES ('154', '用户管理', '2', 'com.xiwaproject.system.user.controller.UserController.changeStatus()', '1', 'admin', '研发部门', '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"userId\":[\"7\"],\"status\":[\"1\"]}', '0', null, '2019-03-15 17:05:47');
INSERT INTO `sys_oper_log` VALUES ('155', '菜单管理', '3', 'com.xiwaproject.system.menu.controller.MenuController.remove()', '1', 'admin', '研发部门', '/system/menu/remove/114', '127.0.0.1', '内网IP', '{}', '0', null, '2019-03-15 17:05:54');
INSERT INTO `sys_oper_log` VALUES ('156', '菜单管理', '3', 'com.xiwaproject.system.menu.controller.MenuController.remove()', '1', 'admin', '研发部门', '/system/menu/remove/115', '127.0.0.1', '内网IP', '{}', '0', null, '2019-03-15 17:06:08');
INSERT INTO `sys_oper_log` VALUES ('157', '菜单管理', '3', 'com.xiwaproject.system.menu.controller.MenuController.remove()', '1', 'admin', '研发部门', '/system/menu/remove/1038', '127.0.0.1', '内网IP', '{}', '0', null, '2019-03-15 17:06:39');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='岗位信息表';

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES ('1', 'ceo', '董事长', '1', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES ('2', 'se', '项目经理', '2', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES ('3', 'hr', '人力资源', '3', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES ('4', 'user', '普通员工', '4', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限）',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COMMENT='角色信息表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '管理员', 'admin', '1', '1', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2019-03-15 16:47:35', '管理员');
INSERT INTO `sys_role` VALUES ('2', '普通角色', 'common', '2', '2', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2019-03-15 16:47:40', '普通角色');
INSERT INTO `sys_role` VALUES ('100', '系统功能维护', '1', '1', '1', '0', '2', 'admin', '2019-03-13 17:34:11', '', null, '1');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `dept_id` int(11) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和部门关联表';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES ('2', '100');
INSERT INTO `sys_role_dept` VALUES ('2', '101');
INSERT INTO `sys_role_dept` VALUES ('2', '105');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `menu_id` int(11) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('1', '1');
INSERT INTO `sys_role_menu` VALUES ('1', '2');
INSERT INTO `sys_role_menu` VALUES ('1', '100');
INSERT INTO `sys_role_menu` VALUES ('1', '101');
INSERT INTO `sys_role_menu` VALUES ('1', '102');
INSERT INTO `sys_role_menu` VALUES ('1', '103');
INSERT INTO `sys_role_menu` VALUES ('1', '104');
INSERT INTO `sys_role_menu` VALUES ('1', '105');
INSERT INTO `sys_role_menu` VALUES ('1', '108');
INSERT INTO `sys_role_menu` VALUES ('1', '109');
INSERT INTO `sys_role_menu` VALUES ('1', '112');
INSERT INTO `sys_role_menu` VALUES ('1', '500');
INSERT INTO `sys_role_menu` VALUES ('1', '501');
INSERT INTO `sys_role_menu` VALUES ('1', '1000');
INSERT INTO `sys_role_menu` VALUES ('1', '1001');
INSERT INTO `sys_role_menu` VALUES ('1', '1002');
INSERT INTO `sys_role_menu` VALUES ('1', '1003');
INSERT INTO `sys_role_menu` VALUES ('1', '1004');
INSERT INTO `sys_role_menu` VALUES ('1', '1005');
INSERT INTO `sys_role_menu` VALUES ('1', '1006');
INSERT INTO `sys_role_menu` VALUES ('1', '1007');
INSERT INTO `sys_role_menu` VALUES ('1', '1008');
INSERT INTO `sys_role_menu` VALUES ('1', '1009');
INSERT INTO `sys_role_menu` VALUES ('1', '1010');
INSERT INTO `sys_role_menu` VALUES ('1', '1011');
INSERT INTO `sys_role_menu` VALUES ('1', '1012');
INSERT INTO `sys_role_menu` VALUES ('1', '1013');
INSERT INTO `sys_role_menu` VALUES ('1', '1014');
INSERT INTO `sys_role_menu` VALUES ('1', '1015');
INSERT INTO `sys_role_menu` VALUES ('1', '1016');
INSERT INTO `sys_role_menu` VALUES ('1', '1017');
INSERT INTO `sys_role_menu` VALUES ('1', '1018');
INSERT INTO `sys_role_menu` VALUES ('1', '1019');
INSERT INTO `sys_role_menu` VALUES ('1', '1020');
INSERT INTO `sys_role_menu` VALUES ('1', '1021');
INSERT INTO `sys_role_menu` VALUES ('1', '1022');
INSERT INTO `sys_role_menu` VALUES ('1', '1023');
INSERT INTO `sys_role_menu` VALUES ('1', '1024');
INSERT INTO `sys_role_menu` VALUES ('1', '1025');
INSERT INTO `sys_role_menu` VALUES ('1', '1026');
INSERT INTO `sys_role_menu` VALUES ('1', '1027');
INSERT INTO `sys_role_menu` VALUES ('1', '1028');
INSERT INTO `sys_role_menu` VALUES ('1', '1029');
INSERT INTO `sys_role_menu` VALUES ('1', '1030');
INSERT INTO `sys_role_menu` VALUES ('1', '1031');
INSERT INTO `sys_role_menu` VALUES ('1', '1032');
INSERT INTO `sys_role_menu` VALUES ('1', '1033');
INSERT INTO `sys_role_menu` VALUES ('1', '1034');
INSERT INTO `sys_role_menu` VALUES ('1', '1035');
INSERT INTO `sys_role_menu` VALUES ('1', '1036');
INSERT INTO `sys_role_menu` VALUES ('1', '1037');
INSERT INTO `sys_role_menu` VALUES ('1', '1038');
INSERT INTO `sys_role_menu` VALUES ('1', '1039');
INSERT INTO `sys_role_menu` VALUES ('1', '1040');
INSERT INTO `sys_role_menu` VALUES ('1', '1041');
INSERT INTO `sys_role_menu` VALUES ('1', '1042');
INSERT INTO `sys_role_menu` VALUES ('1', '1043');
INSERT INTO `sys_role_menu` VALUES ('1', '1044');
INSERT INTO `sys_role_menu` VALUES ('1', '1045');
INSERT INTO `sys_role_menu` VALUES ('1', '1046');
INSERT INTO `sys_role_menu` VALUES ('1', '1047');
INSERT INTO `sys_role_menu` VALUES ('1', '1048');
INSERT INTO `sys_role_menu` VALUES ('1', '1049');
INSERT INTO `sys_role_menu` VALUES ('1', '1050');
INSERT INTO `sys_role_menu` VALUES ('1', '1051');
INSERT INTO `sys_role_menu` VALUES ('1', '1052');
INSERT INTO `sys_role_menu` VALUES ('1', '1053');
INSERT INTO `sys_role_menu` VALUES ('1', '1054');
INSERT INTO `sys_role_menu` VALUES ('1', '1055');
INSERT INTO `sys_role_menu` VALUES ('2', '1');
INSERT INTO `sys_role_menu` VALUES ('2', '100');
INSERT INTO `sys_role_menu` VALUES ('2', '101');
INSERT INTO `sys_role_menu` VALUES ('2', '102');
INSERT INTO `sys_role_menu` VALUES ('2', '103');
INSERT INTO `sys_role_menu` VALUES ('2', '104');
INSERT INTO `sys_role_menu` VALUES ('2', '105');
INSERT INTO `sys_role_menu` VALUES ('2', '108');
INSERT INTO `sys_role_menu` VALUES ('2', '500');
INSERT INTO `sys_role_menu` VALUES ('2', '501');
INSERT INTO `sys_role_menu` VALUES ('2', '1000');
INSERT INTO `sys_role_menu` VALUES ('2', '1001');
INSERT INTO `sys_role_menu` VALUES ('2', '1002');
INSERT INTO `sys_role_menu` VALUES ('2', '1003');
INSERT INTO `sys_role_menu` VALUES ('2', '1004');
INSERT INTO `sys_role_menu` VALUES ('2', '1005');
INSERT INTO `sys_role_menu` VALUES ('2', '1006');
INSERT INTO `sys_role_menu` VALUES ('2', '1007');
INSERT INTO `sys_role_menu` VALUES ('2', '1008');
INSERT INTO `sys_role_menu` VALUES ('2', '1009');
INSERT INTO `sys_role_menu` VALUES ('2', '1010');
INSERT INTO `sys_role_menu` VALUES ('2', '1011');
INSERT INTO `sys_role_menu` VALUES ('2', '1012');
INSERT INTO `sys_role_menu` VALUES ('2', '1013');
INSERT INTO `sys_role_menu` VALUES ('2', '1014');
INSERT INTO `sys_role_menu` VALUES ('2', '1015');
INSERT INTO `sys_role_menu` VALUES ('2', '1016');
INSERT INTO `sys_role_menu` VALUES ('2', '1017');
INSERT INTO `sys_role_menu` VALUES ('2', '1018');
INSERT INTO `sys_role_menu` VALUES ('2', '1019');
INSERT INTO `sys_role_menu` VALUES ('2', '1020');
INSERT INTO `sys_role_menu` VALUES ('2', '1021');
INSERT INTO `sys_role_menu` VALUES ('2', '1022');
INSERT INTO `sys_role_menu` VALUES ('2', '1023');
INSERT INTO `sys_role_menu` VALUES ('2', '1024');
INSERT INTO `sys_role_menu` VALUES ('2', '1025');
INSERT INTO `sys_role_menu` VALUES ('2', '1026');
INSERT INTO `sys_role_menu` VALUES ('2', '1027');
INSERT INTO `sys_role_menu` VALUES ('2', '1028');
INSERT INTO `sys_role_menu` VALUES ('2', '1029');
INSERT INTO `sys_role_menu` VALUES ('2', '1030');
INSERT INTO `sys_role_menu` VALUES ('2', '1031');
INSERT INTO `sys_role_menu` VALUES ('2', '1032');
INSERT INTO `sys_role_menu` VALUES ('2', '1033');
INSERT INTO `sys_role_menu` VALUES ('2', '1034');
INSERT INTO `sys_role_menu` VALUES ('2', '1035');
INSERT INTO `sys_role_menu` VALUES ('2', '1036');
INSERT INTO `sys_role_menu` VALUES ('2', '1037');
INSERT INTO `sys_role_menu` VALUES ('2', '1038');
INSERT INTO `sys_role_menu` VALUES ('2', '1039');
INSERT INTO `sys_role_menu` VALUES ('2', '1040');
INSERT INTO `sys_role_menu` VALUES ('2', '1041');
INSERT INTO `sys_role_menu` VALUES ('2', '1042');
INSERT INTO `sys_role_menu` VALUES ('2', '1043');
INSERT INTO `sys_role_menu` VALUES ('2', '1044');
INSERT INTO `sys_role_menu` VALUES ('2', '1045');
INSERT INTO `sys_role_menu` VALUES ('100', '1');
INSERT INTO `sys_role_menu` VALUES ('100', '2');
INSERT INTO `sys_role_menu` VALUES ('100', '100');
INSERT INTO `sys_role_menu` VALUES ('100', '101');
INSERT INTO `sys_role_menu` VALUES ('100', '102');
INSERT INTO `sys_role_menu` VALUES ('100', '103');
INSERT INTO `sys_role_menu` VALUES ('100', '104');
INSERT INTO `sys_role_menu` VALUES ('100', '105');
INSERT INTO `sys_role_menu` VALUES ('100', '108');
INSERT INTO `sys_role_menu` VALUES ('100', '109');
INSERT INTO `sys_role_menu` VALUES ('100', '112');
INSERT INTO `sys_role_menu` VALUES ('100', '113');
INSERT INTO `sys_role_menu` VALUES ('100', '500');
INSERT INTO `sys_role_menu` VALUES ('100', '501');
INSERT INTO `sys_role_menu` VALUES ('100', '1000');
INSERT INTO `sys_role_menu` VALUES ('100', '1001');
INSERT INTO `sys_role_menu` VALUES ('100', '1002');
INSERT INTO `sys_role_menu` VALUES ('100', '1003');
INSERT INTO `sys_role_menu` VALUES ('100', '1004');
INSERT INTO `sys_role_menu` VALUES ('100', '1005');
INSERT INTO `sys_role_menu` VALUES ('100', '1006');
INSERT INTO `sys_role_menu` VALUES ('100', '1007');
INSERT INTO `sys_role_menu` VALUES ('100', '1008');
INSERT INTO `sys_role_menu` VALUES ('100', '1009');
INSERT INTO `sys_role_menu` VALUES ('100', '1010');
INSERT INTO `sys_role_menu` VALUES ('100', '1011');
INSERT INTO `sys_role_menu` VALUES ('100', '1012');
INSERT INTO `sys_role_menu` VALUES ('100', '1013');
INSERT INTO `sys_role_menu` VALUES ('100', '1014');
INSERT INTO `sys_role_menu` VALUES ('100', '1015');
INSERT INTO `sys_role_menu` VALUES ('100', '1016');
INSERT INTO `sys_role_menu` VALUES ('100', '1017');
INSERT INTO `sys_role_menu` VALUES ('100', '1018');
INSERT INTO `sys_role_menu` VALUES ('100', '1019');
INSERT INTO `sys_role_menu` VALUES ('100', '1020');
INSERT INTO `sys_role_menu` VALUES ('100', '1021');
INSERT INTO `sys_role_menu` VALUES ('100', '1022');
INSERT INTO `sys_role_menu` VALUES ('100', '1023');
INSERT INTO `sys_role_menu` VALUES ('100', '1024');
INSERT INTO `sys_role_menu` VALUES ('100', '1025');
INSERT INTO `sys_role_menu` VALUES ('100', '1026');
INSERT INTO `sys_role_menu` VALUES ('100', '1027');
INSERT INTO `sys_role_menu` VALUES ('100', '1028');
INSERT INTO `sys_role_menu` VALUES ('100', '1029');
INSERT INTO `sys_role_menu` VALUES ('100', '1030');
INSERT INTO `sys_role_menu` VALUES ('100', '1031');
INSERT INTO `sys_role_menu` VALUES ('100', '1032');
INSERT INTO `sys_role_menu` VALUES ('100', '1033');
INSERT INTO `sys_role_menu` VALUES ('100', '1034');
INSERT INTO `sys_role_menu` VALUES ('100', '1035');
INSERT INTO `sys_role_menu` VALUES ('100', '1036');
INSERT INTO `sys_role_menu` VALUES ('100', '1037');
INSERT INTO `sys_role_menu` VALUES ('100', '1038');
INSERT INTO `sys_role_menu` VALUES ('100', '1039');
INSERT INTO `sys_role_menu` VALUES ('100', '1040');
INSERT INTO `sys_role_menu` VALUES ('100', '1041');
INSERT INTO `sys_role_menu` VALUES ('100', '1042');
INSERT INTO `sys_role_menu` VALUES ('100', '1043');
INSERT INTO `sys_role_menu` VALUES ('100', '1044');
INSERT INTO `sys_role_menu` VALUES ('100', '1045');
INSERT INTO `sys_role_menu` VALUES ('100', '1046');
INSERT INTO `sys_role_menu` VALUES ('100', '1047');
INSERT INTO `sys_role_menu` VALUES ('100', '1048');
INSERT INTO `sys_role_menu` VALUES ('100', '1049');
INSERT INTO `sys_role_menu` VALUES ('100', '1050');
INSERT INTO `sys_role_menu` VALUES ('100', '1051');
INSERT INTO `sys_role_menu` VALUES ('100', '1052');
INSERT INTO `sys_role_menu` VALUES ('100', '1053');
INSERT INTO `sys_role_menu` VALUES ('100', '1054');
INSERT INTO `sys_role_menu` VALUES ('100', '1055');
INSERT INTO `sys_role_menu` VALUES ('100', '1056');
INSERT INTO `sys_role_menu` VALUES ('100', '1057');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` int(11) DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) DEFAULT '' COMMENT '密码',
  `salt` varchar(20) DEFAULT '' COMMENT '盐加密',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(50) DEFAULT '' COMMENT '最后登陆IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '103', 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '29c67a30398638269fe600f73a054934', '111111', '0', '0', '127.0.0.1', '2019-03-15 16:55:57', 'admin', '2018-03-16 11:33:00', 'ry', '2019-03-15 16:55:57', '管理员');
INSERT INTO `sys_user` VALUES ('2', '105', 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '8e6d98b90472783cc73c17047ddccf36', '222222', '1', '0', '127.0.0.1', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', 'admin', '2019-03-15 17:05:45', '测试员');
INSERT INTO `sys_user` VALUES ('3', '111', 'woshididi', '我是弟弟', '00', '317430085@qq.com', '18683570454', '0', '', '97e5d0a2508baa53aa94b0d1ffe79219', 'a4a72e', '1', '0', '127.0.0.1', '2019-03-15 14:59:59', 'admin', '2019-03-14 09:43:21', 'admin', '2019-03-15 17:05:37', '弟弟');
INSERT INTO `sys_user` VALUES ('4', '111', 'didi1', '弟弟1', '00', '55615@qq.com', '18683570451', '0', '', '3f2aeb0676d661b23ed46be10611261e', 'df4ba2', '1', '0', '', null, 'woshididi', '2019-03-14 17:40:24', '', '2019-03-15 17:05:34', '');
INSERT INTO `sys_user` VALUES ('5', '111', 'didi2', 'didi2', '00', '3030@qq.com', '18581878496', '0', '', '965b38dd0e5562dc3ca3834034c1e3fd', 'a4ae3b', '1', '0', '127.0.0.1', '2019-03-15 16:48:05', 'admin', '2019-03-15 14:43:56', '', '2019-03-15 17:05:32', 'didi2');
INSERT INTO `sys_user` VALUES ('6', '111', 'didi3', 'didi3', '00', '1161651@qq.com', '18683570452', '0', '', '9adf78d3c46386f53387f09c013c11cd', '0af52b', '1', '0', '', null, 'admin', '2019-03-15 15:17:36', '', '2019-03-15 17:05:30', 'didi3');
INSERT INTO `sys_user` VALUES ('7', '111', '132132@qq.com', 'didi4', '00', '21545@qq.com', '18683570455', '0', '', '8dd7eef3b6cced3101cbcf99f4164857', '976730', '1', '0', '', null, 'admin', '2019-03-15 16:01:51', '', '2019-03-15 17:05:47', '');

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online` (
  `sessionId` varchar(50) NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(50) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int(5) DEFAULT '0' COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='在线用户记录';

-- ----------------------------
-- Records of sys_user_online
-- ----------------------------
INSERT INTO `sys_user_online` VALUES ('aa4c14d5-e40f-4600-b99b-16c6cc26e60a', 'admin', '研发部门', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', 'on_line', '2019-03-15 16:55:45', '2019-03-15 17:16:05', '1800000');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `post_id` int(11) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与岗位关联表';

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES ('1', '1');
INSERT INTO `sys_user_post` VALUES ('2', '2');
INSERT INTO `sys_user_post` VALUES ('3', '2');
INSERT INTO `sys_user_post` VALUES ('4', '4');
INSERT INTO `sys_user_post` VALUES ('5', '4');
INSERT INTO `sys_user_post` VALUES ('6', '3');
INSERT INTO `sys_user_post` VALUES ('7', '3');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户和角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1');
INSERT INTO `sys_user_role` VALUES ('2', '1');
INSERT INTO `sys_user_role` VALUES ('2', '2');
INSERT INTO `sys_user_role` VALUES ('3', '1');
INSERT INTO `sys_user_role` VALUES ('3', '2');
INSERT INTO `sys_user_role` VALUES ('4', '2');
INSERT INTO `sys_user_role` VALUES ('5', '2');
INSERT INTO `sys_user_role` VALUES ('6', '1');
INSERT INTO `sys_user_role` VALUES ('7', '1');
