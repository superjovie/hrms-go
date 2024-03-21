/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80036
 Source Host           : localhost:3306
 Source Schema         : hrms_c002

 Target Server Type    : MySQL
 Target Server Version : 80036
 File Encoding         : 65001

 Date: 27/02/2024 14:40:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for attendance_record
-- ----------------------------
DROP TABLE IF EXISTS `attendance_record`;
CREATE TABLE `attendance_record`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `attendance_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '考勤id',
  `staff_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '员工工号',
  `staff_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '员工姓名',
  `date` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '考勤月份',
  `work_days` int NOT NULL COMMENT '出勤天数',
  `leave_days` int NOT NULL COMMENT '请假天数',
  `overtime_days` int NOT NULL COMMENT '加班天数',
  `approve` int NOT NULL COMMENT '是否已审批, 0为未审批，1为审批通过，2为审批不通过',
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `deleted_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of attendance_record
-- ----------------------------

-- ----------------------------
-- Table structure for authority
-- ----------------------------
DROP TABLE IF EXISTS `authority`;
CREATE TABLE `authority`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '登陆授权表ID',
  `authority_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '登陆授权表ID',
  `staff_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '员工工号',
  `user_password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '登陆密码\\n',
  `user_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户标示，normal普通用户、sys系统管理员、supersys超级管理员',
  `created_at` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `deleted_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of authority
-- ----------------------------
INSERT INTO `authority` VALUES (1, '1', 'root', '698d51a19d8a121ce581499d7b701668', 'supersys', NULL, '2024-02-19 16:04:17', NULL);
INSERT INTO `authority` VALUES (2, '2', 'admin', '698d51a19d8a121ce581499d7b701668', 'sys', NULL, '2024-02-19 16:05:21', NULL);

-- ----------------------------
-- Table structure for authority_detail
-- ----------------------------
DROP TABLE IF EXISTS `authority_detail`;
CREATE TABLE `authority_detail`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色类型',
  `model` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '模块英文名称',
  `authority_content` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '授权详情',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '模块名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of authority_detail
-- ----------------------------
INSERT INTO `authority_detail` VALUES (4, 'supersys', 'staff_manage', 'create|delete|update|query', '员工管理');
INSERT INTO `authority_detail` VALUES (6, 'supersys', 'dep_manage', 'create|delete|update|query', '部门管理');
INSERT INTO `authority_detail` VALUES (7, 'supersys', 'password_manage', 'create|delete|update|query', '密码管理');
INSERT INTO `authority_detail` VALUES (8, 'supersys', 'rank_manage', 'create|delete|update|query', '职位管理');
INSERT INTO `authority_detail` VALUES (9, 'sys', 'admin_staff_manage', 'create|delete|update|query', '员工管理');
INSERT INTO `authority_detail` VALUES (10, 'sys', 'admin_notification_manage', 'create|delete|update|query', '通知管理');
INSERT INTO `authority_detail` VALUES (11, 'normal', 'normal_notification_manage', 'query|update', '通知管理');
INSERT INTO `authority_detail` VALUES (12, 'normal', 'normal_staff_manage', 'query|update', '员工管理');
INSERT INTO `authority_detail` VALUES (16, 'normal', 'normal_salary_detail_manage', 'query', '工资套账');
INSERT INTO `authority_detail` VALUES (17, 'sys', 'salary_detail_manage', 'create|delete|update|query', '工资套账');
INSERT INTO `authority_detail` VALUES (18, 'sys', 'salary_giving_manage', 'create|delete|update|query', '工资发放管理');
INSERT INTO `authority_detail` VALUES (19, 'sys', 'salary_history_manage', 'query', '工资历史');
INSERT INTO `authority_detail` VALUES (20, 'normal', 'normal_salary_history_manage', 'query', '工资历史');
INSERT INTO `authority_detail` VALUES (21, 'sys', 'attendance_giving_manage', 'create|delete|update|query', '考勤上报');
INSERT INTO `authority_detail` VALUES (22, 'sys', 'attendance_history_manage', 'query', '考勤历史');
INSERT INTO `authority_detail` VALUES (24, 'normal', 'normal_attendance_giving_manage', 'create|delete|update|query', '考勤上报');
INSERT INTO `authority_detail` VALUES (25, 'normal', 'normal_attendance_history_manage', 'query', '考勤历史');
INSERT INTO `authority_detail` VALUES (26, 'sys', 'recruitment_manage', 'create|delete|update|query', '招聘信息管理');
INSERT INTO `authority_detail` VALUES (27, 'normal', 'normal_recruitment_manage', 'query', '招聘信息管理');
INSERT INTO `authority_detail` VALUES (28, 'sys', 'candidate_manage', 'create|delete|update|query', '候选人管理');
INSERT INTO `authority_detail` VALUES (29, 'normal', 'normal_candidate_manage', 'update|query', '候选人管理');
INSERT INTO `authority_detail` VALUES (30, 'sys', 'example_manage', 'create|delete|update|query', '考试信息管理');
INSERT INTO `authority_detail` VALUES (31, 'normal', 'example_manage', 'query', '考试信息管理');
INSERT INTO `authority_detail` VALUES (32, 'sys', 'example_history', 'query', '考试历史');
INSERT INTO `authority_detail` VALUES (33, 'normal', 'normal_example_history', 'query', '考试历史');
INSERT INTO `authority_detail` VALUES (34, 'sys', 'attendance_approve_manage', 'update|query', '考勤审批');
INSERT INTO `authority_detail` VALUES (35, 'normal', 'attendance_approve_manage', 'update|query', '考勤审批');

-- ----------------------------
-- Table structure for branch_company
-- ----------------------------
DROP TABLE IF EXISTS `branch_company`;
CREATE TABLE `branch_company`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `branch_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分公司标识',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分公司名称',
  `desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '分公司介绍',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of branch_company
-- ----------------------------
INSERT INTO `branch_company` VALUES (1, 'C001', '公司1', NULL);
INSERT INTO `branch_company` VALUES (2, 'C002', '公司2', NULL);

-- ----------------------------
-- Table structure for candidate
-- ----------------------------
DROP TABLE IF EXISTS `candidate`;
CREATE TABLE `candidate`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `candidate_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '候选人ID',
  `staff_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '面试官工号',
  `name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '候选人姓名',
  `job_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位名称',
  `edu_level` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '学历',
  `major` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '专业',
  `experience` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '工作经历',
  `describe` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '技能描述',
  `email` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系邮箱',
  `evaluation` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '面试评价',
  `status` int NOT NULL COMMENT '录用状态，0录入信息、1拒绝、2通过',
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `deleted_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of candidate
-- ----------------------------

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `dep_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '部门id',
  `dep_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '部门名称',
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `deleted_at` datetime NULL DEFAULT NULL,
  `dep_describe` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '部门介绍',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of department
-- ----------------------------

-- ----------------------------
-- Table structure for example
-- ----------------------------
DROP TABLE IF EXISTS `example`;
CREATE TABLE `example`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `example_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '考试Id',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '考试名称',
  `describe` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '考试介绍',
  `date` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '考试日期',
  `limit` int NOT NULL COMMENT '限制考试时间',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '考试内容JSON格式',
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `deleted_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of example
-- ----------------------------
INSERT INTO `example` VALUES (9, 'example_757332288', '作息时间考试', '公司上下班时间考试测试', '2021-04-17', 1, '[{\"Num\":1,\"Title\":\"公司上班时间\",\"Items\":[\"A.8点\",\"B.9点\",\"C.10点\",\"D.11点\"],\"Ans\":\"A.8点\"},{\"Num\":2,\"Title\":\"公司下班时间\",\"Items\":[\"A.8点\",\"B.9点\",\"C.10点\",\"D.11点\"],\"Ans\":\"C.10点\"}]', '2021-03-28 11:07:10', '2021-04-17 00:16:22', NULL);
INSERT INTO `example` VALUES (11, 'example_2823890790', '职能通识考试', '职能通识考试相关', '2021-04-27', 10, '[{\"Num\":1,\"Title\":\"公司上班时间\",\"Items\":[\"A.8点\",\"B.9点\",\"C.10点\",\"D.11点\"],\"Ans\":\"B.9点\"},{\"Num\":2,\"Title\":\"公司下班时间\",\"Items\":[\"A.8点\",\"B.9点\",\"C.10点\",\"D.11点\"],\"Ans\":\"B.9点\"},{\"Num\":3,\"Title\":\"哪个职业开发软件\",\"Items\":[\"A.硬件\",\"B.软件\",\"C.产品\",\"D.测试\"],\"Ans\":\"B.软件\"}]', '2021-03-28 14:07:52', '2021-04-27 18:27:21', NULL);

-- ----------------------------
-- Table structure for example_score
-- ----------------------------
DROP TABLE IF EXISTS `example_score`;
CREATE TABLE `example_score`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `example_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '考试信息ID',
  `staff_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '考试人工号',
  `staff_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '员工名称',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '考试名称',
  `date` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '完成考试时间',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '标准答案',
  `commit` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '提交的答案',
  `score` int NOT NULL COMMENT '考试成绩',
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `deleted_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 65 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of example_score
-- ----------------------------

-- ----------------------------
-- Table structure for notification
-- ----------------------------
DROP TABLE IF EXISTS `notification`;
CREATE TABLE `notification`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `notice_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '通知Id',
  `notice_title` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '通知标题',
  `notice_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '通知内容',
  `type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '通知类别',
  `date` datetime NOT NULL COMMENT '通知时间',
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `deleted_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notification
-- ----------------------------

-- ----------------------------
-- Table structure for rank
-- ----------------------------
DROP TABLE IF EXISTS `rank`;
CREATE TABLE `rank`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `rank_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '职级id',
  `rank_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '职位名称',
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `deleted_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rank
-- ----------------------------

-- ----------------------------
-- Table structure for recruitment
-- ----------------------------
DROP TABLE IF EXISTS `recruitment`;
CREATE TABLE `recruitment`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `recruitment_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '招聘信息Id',
  `job_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '招聘岗位名称',
  `job_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位类型',
  `base_location` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '工作地点',
  `base_salary` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '基本薪资范围',
  `edu_level` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '学历要求',
  `experience` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '工作经验要求',
  `describe` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位描述',
  `email` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '投递邮箱',
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `deleted_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of recruitment
-- ----------------------------

-- ----------------------------
-- Table structure for salary
-- ----------------------------
DROP TABLE IF EXISTS `salary`;
CREATE TABLE `salary`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `salary_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '工资表ID',
  `staff_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '员工Id',
  `staff_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '员工姓名',
  `base` int NOT NULL COMMENT '基础薪资',
  `subsidy` int NOT NULL COMMENT '住房补贴',
  `bonus` int NOT NULL COMMENT '绩效奖金',
  `commission` int NOT NULL COMMENT '提成奖金',
  `fund` int NOT NULL COMMENT '是否交五险一金，1交2不交',
  `other` int NOT NULL COMMENT '其他奖金',
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `deleted_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of salary
-- ----------------------------

-- ----------------------------
-- Table structure for salary_record
-- ----------------------------
DROP TABLE IF EXISTS `salary_record`;
CREATE TABLE `salary_record`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `salary_record_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '工资单ID',
  `staff_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '员工Id',
  `staff_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '员工姓名',
  `base` int NOT NULL COMMENT '基础薪资',
  `subsidy` int NOT NULL COMMENT '住房补贴',
  `bonus` int NOT NULL COMMENT '绩效奖金',
  `commission` int NOT NULL COMMENT '提成薪资',
  `other` int NOT NULL COMMENT '其他薪资',
  `pension_insurance` decimal(10, 2) NOT NULL COMMENT '需缴养老保险',
  `unemployment_insurance` decimal(10, 2) NOT NULL COMMENT '需缴纳失业保险',
  `medical_insurance` decimal(10, 2) NOT NULL COMMENT '需缴医疗保险',
  `housing_fund` decimal(10, 2) NOT NULL COMMENT '需缴住房公积金',
  `tax` decimal(10, 2) NOT NULL COMMENT '需缴个人所得税',
  `overtime` int NOT NULL COMMENT '加班薪资',
  `total` decimal(10, 2) NOT NULL COMMENT '实发薪资',
  `is_pay` int NOT NULL COMMENT '是否已发放工资',
  `salary_date` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '记薪周期,202103',
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `deleted_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of salary_record
-- ----------------------------

-- ----------------------------
-- Table structure for staff
-- ----------------------------
DROP TABLE IF EXISTS `staff`;
CREATE TABLE `staff`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `staff_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '员工ID',
  `staff_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '员工姓名',
  `leader_staff_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '上级员工工号',
  `leader_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '上级员工名称',
  `birthday` date NOT NULL COMMENT '生日',
  `identity_num` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '身份证号',
  `sex` int NOT NULL COMMENT '性别；1男，0女',
  `nation` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '民族',
  `school` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '毕业院校',
  `major` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '毕业专业',
  `edu_level` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '学历',
  `base_salary` int NOT NULL COMMENT '基本工资',
  `card_num` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '银行卡号',
  `rank_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '职位ID',
  `dep_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '部门ID',
  `email` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '电子邮箱',
  `phone` bigint NOT NULL COMMENT '手机号',
  `entry_date` date NOT NULL COMMENT '入职日期',
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `deleted_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of staff
-- ----------------------------
INSERT INTO `staff` VALUES (1, 'root', '超级管理员', NULL, NULL, '1999-05-21', '-1', 1, '-1', '-1', '-1', '-1', -1, '-1', '-1', '-1', '-1', -1, '2021-01-02', NULL, NULL, NULL);
INSERT INTO `staff` VALUES (2, 'admin', '系统管理员', NULL, NULL, '1999-05-21', '-1', 1, '-1', '-1', '-1', '-1', -1, '-1', '-1', '-1', '-1', -1, '2021-01-02', NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
