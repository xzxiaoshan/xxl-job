/*
 Target Server Type    : Oracle
 Date: 29/06/2020 10:24:23
*/

-- ----------------------------
-- Table structure for XXL_JOB_GROUP
-- ----------------------------
DROP TABLE XXL_JOB_GROUP;
CREATE TABLE XXL_JOB_GROUP (
  ID NUMBER(20) NOT NULL ,
  APP_NAME NVARCHAR2(64) NOT NULL ,
  TITLE NVARCHAR2(12) NOT NULL ,
  ADDRESS_TYPE NUMBER(4) NOT NULL ,
  ADDRESS_LIST NVARCHAR2(512) 
);
COMMENT ON COLUMN XXL_JOB_GROUP.APP_NAME IS '执行器AppName';
COMMENT ON COLUMN XXL_JOB_GROUP.TITLE IS '执行器名称';
COMMENT ON COLUMN XXL_JOB_GROUP.ADDRESS_TYPE IS '执行器地址类型：0=自动注册、1=手动录入';
COMMENT ON COLUMN XXL_JOB_GROUP.ADDRESS_LIST IS '执行器地址列表，多地址逗号分隔';

-- ----------------------------
-- Records of XXL_JOB_GROUP
-- ----------------------------
INSERT INTO XXL_JOB_GROUP VALUES ('1', 'xxl-job-executor-sample', '示例执行器', '0', NULL);

-- ----------------------------
-- Primary Key structure for table XXL_JOB_GROUP
-- ----------------------------
ALTER TABLE XXL_JOB_GROUP ADD CONSTRAINT SYS_C0026588 PRIMARY KEY (ID);


-- ----------------------------
-- Table structure for XXL_JOB_INFO
-- ----------------------------
DROP TABLE XXL_JOB_INFO;
CREATE TABLE XXL_JOB_INFO (
  ID NUMBER(20) NOT NULL ,
  JOB_GROUP NUMBER(11) NOT NULL ,
  JOB_CRON NVARCHAR2(128) NOT NULL ,
  JOB_DESC NVARCHAR2(255) NOT NULL ,
  ADD_TIME DATE ,
  UPDATE_TIME DATE ,
  AUTHOR NVARCHAR2(64) ,
  ALARM_EMAIL NVARCHAR2(255) ,
  EXECUTOR_ROUTE_STRATEGY NVARCHAR2(50) ,
  EXECUTOR_HANDLER NVARCHAR2(255) ,
  EXECUTOR_PARAM NVARCHAR2(512) ,
  EXECUTOR_BLOCK_STRATEGY NVARCHAR2(50) ,
  EXECUTOR_TIMEOUT NUMBER(11) NOT NULL ,
  EXECUTOR_FAIL_RETRY_COUNT NUMBER(11) NOT NULL ,
  GLUE_TYPE NVARCHAR2(50) NOT NULL ,
  GLUE_SOURCE NCLOB ,
  GLUE_REMARK NVARCHAR2(128) ,
  GLUE_UPDATETIME DATE ,
  CHILD_JOBID NVARCHAR2(255) ,
  TRIGGER_STATUS NUMBER(4) NOT NULL ,
  TRIGGER_LAST_TIME NUMBER(20) NOT NULL ,
  TRIGGER_NEXT_TIME NUMBER(20) NOT NULL 
);
COMMENT ON COLUMN XXL_JOB_INFO.JOB_GROUP IS '执行器主键ID';
COMMENT ON COLUMN XXL_JOB_INFO.JOB_CRON IS '任务执行CRON';
COMMENT ON COLUMN XXL_JOB_INFO.AUTHOR IS '作者';
COMMENT ON COLUMN XXL_JOB_INFO.ALARM_EMAIL IS '报警邮件';
COMMENT ON COLUMN XXL_JOB_INFO.EXECUTOR_ROUTE_STRATEGY IS '执行器路由策略';
COMMENT ON COLUMN XXL_JOB_INFO.EXECUTOR_HANDLER IS '执行器任务handler';
COMMENT ON COLUMN XXL_JOB_INFO.EXECUTOR_PARAM IS '执行器任务参数';
COMMENT ON COLUMN XXL_JOB_INFO.EXECUTOR_BLOCK_STRATEGY IS '阻塞处理策略';
COMMENT ON COLUMN XXL_JOB_INFO.EXECUTOR_TIMEOUT IS '任务执行超时时间，单位秒';
COMMENT ON COLUMN XXL_JOB_INFO.EXECUTOR_FAIL_RETRY_COUNT IS '失败重试次数';
COMMENT ON COLUMN XXL_JOB_INFO.GLUE_TYPE IS 'GLUE类型';
COMMENT ON COLUMN XXL_JOB_INFO.GLUE_SOURCE IS 'GLUE源代码';
COMMENT ON COLUMN XXL_JOB_INFO.GLUE_REMARK IS 'GLUE备注';
COMMENT ON COLUMN XXL_JOB_INFO.GLUE_UPDATETIME IS 'GLUE更新时间';
COMMENT ON COLUMN XXL_JOB_INFO.CHILD_JOBID IS '子任务ID，多个逗号分隔';
COMMENT ON COLUMN XXL_JOB_INFO.TRIGGER_STATUS IS '调度状态：0-停止，1-运行';
COMMENT ON COLUMN XXL_JOB_INFO.TRIGGER_LAST_TIME IS '上次调度时间';
COMMENT ON COLUMN XXL_JOB_INFO.TRIGGER_NEXT_TIME IS '下次调度时间';

-- ----------------------------
-- Records of XXL_JOB_INFO
-- ----------------------------
INSERT INTO XXL_JOB_INFO VALUES ('1', '1', '0 0 0 * * ? *', '测试任务1', TO_DATE('2018-11-03 22:21:31', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2018-11-03 22:21:31', 'SYYYY-MM-DD HH24:MI:SS'), 'XXL', NULL, 'FIRST', 'demoJobHandler', NULL, 'SERIAL_EXECUTION', '0', '0', 'BEAN', NULL, 'GLUE代码初始化', TO_DATE('2018-11-03 22:21:31', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '0', '0', '0');

-- ----------------------------
-- Primary Key structure for table XXL_JOB_INFO
-- ----------------------------
ALTER TABLE XXL_JOB_INFO ADD CONSTRAINT SYS_C0026589 PRIMARY KEY (ID);


-- ----------------------------
-- Table structure for XXL_JOB_LOCK
-- ----------------------------
DROP TABLE XXL_JOB_LOCK;
CREATE TABLE XXL_JOB_LOCK (
  LOCK_NAME NVARCHAR2(50) NOT NULL 
);
COMMENT ON COLUMN XXL_JOB_LOCK.LOCK_NAME IS '锁名称';

-- ----------------------------
-- Records of XXL_JOB_LOCK
-- ----------------------------
INSERT INTO XXL_JOB_LOCK VALUES ('schedule_lock');


-- ----------------------------
-- Table structure for XXL_JOB_LOG
-- ----------------------------
DROP TABLE XXL_JOB_LOG;
CREATE TABLE XXL_JOB_LOG (
  ID NUMBER(20) NOT NULL ,
  JOB_GROUP NUMBER(11) NOT NULL ,
  JOB_ID NUMBER(11) NOT NULL ,
  EXECUTOR_ADDRESS NVARCHAR2(255) ,
  EXECUTOR_HANDLER NVARCHAR2(255) ,
  EXECUTOR_PARAM NVARCHAR2(512) ,
  EXECUTOR_SHARDING_PARAM NVARCHAR2(20) ,
  EXECUTOR_FAIL_RETRY_COUNT NUMBER(11) NOT NULL ,
  TRIGGER_TIME DATE ,
  TRIGGER_CODE NUMBER(11) NOT NULL ,
  TRIGGER_MSG NCLOB ,
  HANDLE_TIME DATE ,
  HANDLE_CODE NUMBER(11) NOT NULL ,
  HANDLE_MSG NCLOB ,
  ALARM_STATUS NUMBER(4) NOT NULL 
);
COMMENT ON COLUMN XXL_JOB_LOG.JOB_GROUP IS '执行器主键ID';
COMMENT ON COLUMN XXL_JOB_LOG.JOB_ID IS '任务，主键ID';
COMMENT ON COLUMN XXL_JOB_LOG.EXECUTOR_ADDRESS IS '执行器地址，本次执行的地址';
COMMENT ON COLUMN XXL_JOB_LOG.EXECUTOR_HANDLER IS '执行器任务handler';
COMMENT ON COLUMN XXL_JOB_LOG.EXECUTOR_PARAM IS '执行器任务参数';
COMMENT ON COLUMN XXL_JOB_LOG.EXECUTOR_SHARDING_PARAM IS '执行器任务分片参数，格式如 1/2';
COMMENT ON COLUMN XXL_JOB_LOG.EXECUTOR_FAIL_RETRY_COUNT IS '失败重试次数';
COMMENT ON COLUMN XXL_JOB_LOG.TRIGGER_TIME IS '调度-时间';
COMMENT ON COLUMN XXL_JOB_LOG.TRIGGER_CODE IS '调度-结果';
COMMENT ON COLUMN XXL_JOB_LOG.TRIGGER_MSG IS '调度-日志';
COMMENT ON COLUMN XXL_JOB_LOG.HANDLE_TIME IS '执行-时间';
COMMENT ON COLUMN XXL_JOB_LOG.HANDLE_CODE IS '执行-状态';
COMMENT ON COLUMN XXL_JOB_LOG.HANDLE_MSG IS '执行-日志';
COMMENT ON COLUMN XXL_JOB_LOG.ALARM_STATUS IS '告警状态：0-默认、1-无需告警、2-告警成功、3-告警失败';

-- ----------------------------
-- Primary Key structure for table XXL_JOB_LOG
-- ----------------------------
ALTER TABLE XXL_JOB_LOG ADD CONSTRAINT SYS_C0026591 PRIMARY KEY (ID);

-- ----------------------------
-- Indexes structure for table XXL_JOB_LOG
-- ----------------------------
CREATE INDEX I_HANDLE_CODE
  ON XXL_JOB_LOG (HANDLE_CODE ASC);
CREATE INDEX I_TRIGGER_TIME
  ON XXL_JOB_LOG (TRIGGER_TIME ASC);

-- ----------------------------
-- Table structure for XXL_JOB_LOG_REPORT
-- ----------------------------
DROP TABLE XXL_JOB_LOG_REPORT;
CREATE TABLE XXL_JOB_LOG_REPORT (
  ID NUMBER(20) NOT NULL ,
  TRIGGER_DAY DATE ,
  RUNNING_COUNT NUMBER(11) NOT NULL ,
  SUC_COUNT NUMBER(11) NOT NULL ,
  FAIL_COUNT NUMBER(11) NOT NULL 
);
COMMENT ON COLUMN XXL_JOB_LOG_REPORT.TRIGGER_DAY IS '调度-时间';
COMMENT ON COLUMN XXL_JOB_LOG_REPORT.RUNNING_COUNT IS '运行中-日志数量';
COMMENT ON COLUMN XXL_JOB_LOG_REPORT.SUC_COUNT IS '执行成功-日志数量';
COMMENT ON COLUMN XXL_JOB_LOG_REPORT.FAIL_COUNT IS '执行失败-日志数量';

-- ----------------------------
-- Primary Key structure for table XXL_JOB_LOG_REPORT
-- ----------------------------
ALTER TABLE XXL_JOB_LOG_REPORT ADD CONSTRAINT SYS_C0026592 PRIMARY KEY (ID);

-- ----------------------------
-- Indexes structure for table XXL_JOB_LOG_REPORT
-- ----------------------------
CREATE UNIQUE INDEX I_TRIGGER_DAY
  ON XXL_JOB_LOG_REPORT (TRIGGER_DAY ASC);
  

-- ----------------------------
-- Table structure for XXL_JOB_LOGGLUE
-- ----------------------------
DROP TABLE XXL_JOB_LOGGLUE;
CREATE TABLE XXL_JOB_LOGGLUE (
  ID NUMBER(20) NOT NULL ,
  JOB_ID NUMBER(20) NOT NULL ,
  GLUE_TYPE NVARCHAR2(50) ,
  GLUE_SOURCE NCLOB ,
  GLUE_REMARK NVARCHAR2(128) NOT NULL ,
  ADD_TIME DATE ,
  UPDATE_TIME DATE 
);
COMMENT ON COLUMN XXL_JOB_LOGGLUE.JOB_ID IS '任务，主键ID';
COMMENT ON COLUMN XXL_JOB_LOGGLUE.GLUE_TYPE IS 'GLUE类型';
COMMENT ON COLUMN XXL_JOB_LOGGLUE.GLUE_SOURCE IS 'GLUE源代码';
COMMENT ON COLUMN XXL_JOB_LOGGLUE.GLUE_REMARK IS 'GLUE备注';

-- ----------------------------
-- Primary Key structure for table XXL_JOB_LOGGLUE
-- ----------------------------
ALTER TABLE XXL_JOB_LOGGLUE ADD CONSTRAINT SYS_C0026593 PRIMARY KEY (ID);



-- ----------------------------
-- Table structure for XXL_JOB_REGISTRY
-- ----------------------------
DROP TABLE XXL_JOB_REGISTRY;
CREATE TABLE XXL_JOB_REGISTRY (
  ID NUMBER(20) NOT NULL ,
  REGISTRY_GROUP NVARCHAR2(50) NOT NULL ,
  REGISTRY_KEY NVARCHAR2(255) NOT NULL ,
  REGISTRY_VALUE NVARCHAR2(255) NOT NULL ,
  UPDATE_TIME DATE 
);

-- ----------------------------
-- Primary Key structure for table XXL_JOB_REGISTRY
-- ----------------------------
ALTER TABLE XXL_JOB_REGISTRY ADD CONSTRAINT SYS_C0026594 PRIMARY KEY (ID);

-- ----------------------------
-- Indexes structure for table XXL_JOB_REGISTRY
-- ----------------------------
CREATE INDEX I_G_K_V
  ON XXL_JOB_REGISTRY (REGISTRY_GROUP ASC, REGISTRY_VALUE ASC, REGISTRY_KEY ASC);



-- ----------------------------
-- Table structure for XXL_JOB_USER
-- ----------------------------
DROP TABLE XXL_JOB_USER;
CREATE TABLE XXL_JOB_USER (
  ID NUMBER(20) NOT NULL ,
  USERNAME NVARCHAR2(50) NOT NULL ,
  PASSWORD NVARCHAR2(50) NOT NULL ,
  ROLE NUMBER(4) NOT NULL ,
  PERMISSION NVARCHAR2(255) 
);
COMMENT ON COLUMN XXL_JOB_USER.USERNAME IS '账号';
COMMENT ON COLUMN XXL_JOB_USER.PASSWORD IS '密码';
COMMENT ON COLUMN XXL_JOB_USER.ROLE IS '角色：0-普通用户、1-管理员';
COMMENT ON COLUMN XXL_JOB_USER.PERMISSION IS '权限：执行器ID列表，多个逗号分割';

-- ----------------------------
-- Records of XXL_JOB_USER
-- ----------------------------
INSERT INTO XXL_JOB_USER VALUES ('1', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '1', NULL);

-- ----------------------------
-- Primary Key structure for table XXL_JOB_USER
-- ----------------------------
ALTER TABLE XXL_JOB_USER ADD CONSTRAINT SYS_C0026595 PRIMARY KEY (ID);

-- ----------------------------
-- Indexes structure for table XXL_JOB_USER
-- ----------------------------
CREATE UNIQUE INDEX I_USERNAME
  ON XXL_JOB_USER (USERNAME ASC);



-- ----------------------------
-- Table structure for XXL_JOB_MACHINE
-- ----------------------------
DROP TABLE XXL_JOB_MACHINE;
CREATE TABLE XXL_JOB_MACHINE (
    MACHINE_IP NVARCHAR2(22) NOT NULL ,
    MACHINE_ID NUMBER(4) NOT NULL ,
    ADD_TIME DATE NOT NULL ,
    HEART_LAST_TIME DATE NOT NULL
);
COMMENT ON COLUMN XXL_JOB_MACHINE.MACHINE_IP IS '主机IP';
COMMENT ON COLUMN XXL_JOB_MACHINE.MACHINE_ID IS '主机IP对应的机器码';
COMMENT ON COLUMN XXL_JOB_MACHINE.ADD_TIME IS '创建时间';
COMMENT ON COLUMN XXL_JOB_MACHINE.HEART_LAST_TIME IS '最后一次心跳时间';

-- ----------------------------
-- Primary Key structure for table XXL_JOB_MACHINE
-- ----------------------------
ALTER TABLE XXL_JOB_MACHINE ADD CONSTRAINT SYS_C0026684 PRIMARY KEY (MACHINE_IP);

CREATE UNIQUE INDEX I_MACHINE_ID
  ON XXL_JOB_MACHINE (MACHINE_ID ASC);

-- ----------------------------
-- Checks structure for table XXL_JOB_MACHINE
-- ----------------------------
ALTER TABLE XXL_JOB_MACHINE ADD CONSTRAINT SYS_C0026680 CHECK (MACHINE_IP IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE XXL_JOB_MACHINE ADD CONSTRAINT SYS_C0026681 CHECK (MACHINE_ID IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE XXL_JOB_MACHINE ADD CONSTRAINT SYS_C0026682 CHECK (ADD_TIME IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE XXL_JOB_MACHINE ADD CONSTRAINT SYS_C0026683 CHECK (HEART_LAST_TIME IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
