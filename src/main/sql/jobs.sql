-- 数据库初始化脚本

-- 创建数据库
CREATE DATABASE IF NOT EXISTS VRRG;

-- 使用数据库
USE VRRG;

-- 创建岗位配置表
DROP TABLE IF EXISTS P_JOB_CONFIGURATION;
CREATE TABLE P_JOB_CONFIGURATION
(
    PJC_ID            INT(11)                NOT NULL AUTO_INCREMENT COMMENT 'ID',
    NAME              VARCHAR(255) COMMENT '岗位名称',
    UPPER_COURSE_ID   INT(11) COMMENT '上游ID',
    SUPERIOR_ID       INT(11) COMMENT '上级ID',
    PART              VARCHAR(255) COMMENT '本部',
    DESCRIPTION       VARCHAR(750) COMMENT '描述',
    START_ACTIVE_TIME DATETIME COMMENT '生效时间',
    END_ACTIVE_TIME   DATETIME COMMENT '失效时间',
    VERSION_NUM       INT(11)  DEFAULT 0 COMMENT '版本号',
    CREATION_DATE     DATETIME DEFAULT NOW() NOT NULL COMMENT '创建时间',
    CREATED_BY        INT(11)  DEFAULT -1    NOT NULL COMMENT '创建人',
    LAST_UPDATED_BY   INT(11)  DEFAULT -1    NOT NULL COMMENT '最后修改人',
    LAST_UPDATE_DATE  DATETIME DEFAULT NOW() NOT NULL COMMENT '最后修改时间',
    LAST_UPDATE_LOGIN INT(11) COMMENT '最后登录人',
    PRIMARY KEY (PJC_ID),
    KEY IDX_UPPER_COURSE_ID (UPPER_COURSE_ID),
    KEY IDX_SUPERIOR_ID (SUPERIOR_ID)
)
    ENGINE = InnoDB
    AUTO_INCREMENT = 11
    DEFAULT CHARSET = utf8
    COMMENT '岗位配置表';

-- 创建职位配置表
DROP TABLE IF EXISTS P_POSITION_CONFIGURATION;
CREATE TABLE P_POSITION_CONFIGURATION
(
    PPC_ID            INT(11)                NOT NULL AUTO_INCREMENT COMMENT 'ID',
    NAME              VARCHAR(255) COMMENT '职位名称',
    UP_ID             INT(11) COMMENT '晋升职位ID',
    DESCRIPTION       VARCHAR(750) COMMENT '描述',
    START_ACTIVE_TIME DATETIME COMMENT '生效时间',
    END_ACTIVE_TIME   DATETIME COMMENT '失效时间',
    VERSION_NUM       INT(11)  DEFAULT 0 COMMENT '版本号',
    CREATION_DATE     DATETIME DEFAULT NOW() NOT NULL COMMENT '创建时间',
    CREATED_BY        INT(11)  DEFAULT -1    NOT NULL COMMENT '创建人',
    LAST_UPDATED_BY   INT(11)  DEFAULT -1    NOT NULL COMMENT '最后修改人',
    LAST_UPDATE_DATE  DATETIME DEFAULT NOW() NOT NULL COMMENT '最后修改时间',
    LAST_UPDATE_LOGIN INT(11) COMMENT '最后登录人',
    PRIMARY KEY (PPC_ID),
    KEY IDX_UP_ID (UP_ID)
)
    ENGINE = InnoDB
    AUTO_INCREMENT = 21
    DEFAULT CHARSET = utf8
    COMMENT '职位配置表';

-- 创建职位晋升标准表
DROP TABLE IF EXISTS P_POSITION_PROMOTION;
CREATE TABLE P_POSITION_PROMOTION
(
    PPP_ID            INT(11)                NOT NULL AUTO_INCREMENT COMMENT 'ID',
    PPC_ID            INT(11)                NOT NULL COMMENT '职位id',
    INDICATORS        VARCHAR(225) COMMENT '指标项',
    PROPORTION        FLOAT(2, 4) COMMENT '指标比重',
    TARGET_REACHED    DECIMAL(22, 2) COMMENT '达成目标',
    IS_THRESHOLD      VARCHAR(2) COMMENT '是否有门槛',
    SQL_VAL           TEXT COMMENT '目标取值SQL',
    DESCRIPTION       VARCHAR(255) COMMENT '晋升描述',
    START_ACTIVE_TIME DATETIME COMMENT '生效时间',
    END_ACTIVE_TIME   DATETIME COMMENT '失效时间',
    VERSION_NUM       INT(11)  DEFAULT 0 COMMENT '版本号',
    CREATION_DATE     DATETIME DEFAULT NOW() NOT NULL COMMENT '创建时间',
    CREATED_BY        INT(11)  DEFAULT -1    NOT NULL COMMENT '创建人',
    LAST_UPDATED_BY   INT(11)  DEFAULT -1    NOT NULL COMMENT '最后修改人',
    LAST_UPDATE_DATE  DATETIME DEFAULT NOW() NOT NULL COMMENT '最后修改时间',
    LAST_UPDATE_LOGIN INT(11) COMMENT '最后登录人',
    PRIMARY KEY (PPP_ID),
    FOREIGN KEY (PPC_ID) REFERENCES P_POSITION_CONFIGURATION (PPC_ID),
    KEY IDX_PPC_ID (PPC_ID)
)
    ENGINE InnoDB
    AUTO_INCREMENT = 31
    DEFAULT CHARSET = utf8
    COMMENT '职位晋升标准表';

-- 创建标准任务庫表
DROP TABLE IF EXISTS TASK_STANDARD;
CREATE TABLE TASK_STANDARD
(
    TS_ID             INT(11)                NOT NULL AUTO_INCREMENT COMMENT '任务ID',
    TS_CODE           varchar(40) COMMENT '任务编码',
    TYPE              varchar(225) COMMENT '任务类型（快码：TASK_TYPE）',
    PRIORITY          varchar(255) COMMENT '优先级（快码:TASK_PRIORITY）',
    IS_SYNC           VARCHAR(2) COMMENT '是否同步(快码:TASK_IS)',
    USER_ID           INT(11) COMMENT '验证人(saaf_user表ID)',
    FORM_URL          VARCHAR(255) COMMENT '表单链接',
    KNOWLEDGE_URL     VARCHAR(255) COMMENT '知识库连接',
    DURATION          VARCHAR(255) COMMENT '正常时数(h)',
    DELAY             VARCHAR(255) COMMENT '延期时数(h)',
    IS_DELAY          VARCHAR(2) COMMENT '允许延期执行(快码:TASK_IS)',
    CLOSE_WAY         VARCHAR(255) COMMENT '关闭方式(TASK_CLOSE_WAY)',
    SQL_VAL           TEXT COMMENT '分配规则SQL',
    DESCRIPTION       VARCHAR(750) COMMENT '描述',
    START_ACTIVE_TIME DATETIME COMMENT '生效时间',
    END_ACTIVE_TIME   DATETIME COMMENT '失效时间',
    VERSION_NUM       INT(11)  DEFAULT 0 COMMENT '版本号',
    CREATION_DATE     DATETIME DEFAULT NOW() NOT NULL COMMENT '创建时间',
    CREATED_BY        INT(11)  DEFAULT -1    NOT NULL COMMENT '创建人',
    LAST_UPDATED_BY   INT(11)  DEFAULT -1    NOT NULL COMMENT '最后修改人',
    LAST_UPDATE_DATE  DATETIME DEFAULT NOW() NOT NULL COMMENT '最后修改时间',
    LAST_UPDATE_LOGIN INT(11) COMMENT '最后登录人',
    PRIMARY KEY (TS_ID),
    KEY IDX_USER_ID (USER_ID)
)
    ENGINE = InnoDB
    AUTO_INCREMENT = 12
    DEFAULT CHARSET = utf8
    COMMENT '职位晋升标准表';

-- 创建任务消息推送表
DROP TABLE IF EXISTS TASK_PUSH_MESSAGE;
CREATE TABLE TASK_PUSH_MESSAGE
(
    TPM_ID            INT(11)                NOT NULL AUTO_INCREMENT COMMENT 'ID',
    TS_ID             INT(11)                NOT NULL COMMENT '任务ID',
    PUSH_NODE         VARCHAR(255) COMMENT '推送节点(快码:TASK_PUSH_NODE)',
    EWC_HEADER_ID     INT(11) COMMENT '推送内容ID（saaf_ew_config_headers表EWC_HEADER_ID）',
    VERSION_NUM       INT(11)  DEFAULT 0 COMMENT '版本号',
    CREATION_DATE     DATETIME DEFAULT NOW() NOT NULL COMMENT '创建时间',
    CREATED_BY        INT(11)  DEFAULT -1    NOT NULL COMMENT '创建人',
    LAST_UPDATED_BY   INT(11)  DEFAULT -1    NOT NULL COMMENT '最后修改人',
    LAST_UPDATE_DATE  DATETIME DEFAULT NOW() NOT NULL COMMENT '最后修改时间',
    LAST_UPDATE_LOGIN INT(11) COMMENT '最后登录人',
    PRIMARY KEY (TPM_ID),
    KEY IDX_EWC_HEADER_ID (EWC_HEADER_ID)
)
    ENGINE = InnoDB
    AUTO_INCREMENT = 22
    DEFAULT CHARSET = utf8
    COMMENT '任务消息推送表';

-- 创建岗位任务表
DROP TABLE IF EXISTS TASK_JOB;
CREATE TABLE TASK_JOB
(
    TJ_ID             INT(11)                NOT NULL AUTO_INCREMENT COMMENT 'ID',
    PJC_JD            INT(11)                NOT NULL COMMENT '岗位id',
    TS_ID             INT(11)                NOT NULL COMMENT '任务id',
    TASK_RATIO        FLOAT(2, 4) COMMENT '任务比重',
    IS_SHARE_RATIO    VARCHAR(2) COMMENT '是否分摊比重(快码:TASK_IS)',
    IS_NUM_SHARE      VARCHAR(2) COMMENT '是否有数分摊(快码:TASK_IS)',
    START_ACTIVE_TIME DATETIME COMMENT '生效时间',
    END_ACTIVE_TIME   DATETIME COMMENT '失效时间',
    VERSION_NUM       INT(11)  DEFAULT 0 COMMENT '版本号',
    CREATION_DATE     DATETIME DEFAULT NOW() NOT NULL COMMENT '创建时间',
    CREATED_BY        INT(11)  DEFAULT -1    NOT NULL COMMENT '创建人',
    LAST_UPDATED_BY   INT(11)  DEFAULT -1    NOT NULL COMMENT '最后修改人',
    LAST_UPDATE_DATE  DATETIME DEFAULT NOW() NOT NULL COMMENT '最后修改时间',
    LAST_UPDATE_LOGIN INT(11) COMMENT '最后登录人',
    PRIMARY KEY (TJ_ID),
    FOREIGN KEY (PJC_JD) REFERENCES P_JOB_CONFIGURATION (PJC_ID),
    FOREIGN KEY (TS_ID) REFERENCES TASK_STANDARD (TS_ID),
    KEY IDX_PJC_ID (PJC_JD),
    KEY IDX_TS_ID (TS_ID)
)
    ENGINE = InnoDB
    AUTO_INCREMENT = 32
    DEFAULT CHARSET = utf8
    COMMENT '岗位任务表';

-- 创建项目任务表
DROP TABLE IF EXISTS TASK_PROJECT;
CREATE TABLE TASK_PROJECT
(
    TP_ID             INT(11)                NOT NULL AUTO_INCREMENT COMMENT 'ID',
    PJC_ID            INT(11)                NOT NULL COMMENT '岗位ID',
    TS_ID             INT(11)                NOT NULL COMMENT '任务ID',
    TASK_RATIO        FLOAT(2, 4) COMMENT '任务比重',
    IS_SHARE_RATIO    VARCHAR(2) COMMENT '是否分摊比重(快码:TASK_IS)',
    START_ACTIVE_TIME DATETIME COMMENT '生效时间',
    END_ACTIVE_TIME   DATETIME COMMENT '失效时间',
    VERSION_NUM       INT(11)  DEFAULT 0 COMMENT '版本号',
    CREATION_DATE     DATETIME DEFAULT NOW() NOT NULL COMMENT '创建时间',
    CREATED_BY        INT(11)  DEFAULT -1    NOT NULL COMMENT '创建人',
    LAST_UPDATED_BY   INT(11)  DEFAULT -1    NOT NULL COMMENT '最后修改人',
    LAST_UPDATE_DATE  DATETIME DEFAULT NOW() NOT NULL COMMENT '最后修改时间',
    LAST_UPDATE_LOGIN INT(11) COMMENT '最后登录人',
    PRIMARY KEY (TP_ID),
    FOREIGN KEY (PJC_ID) REFERENCES P_JOB_CONFIGURATION (PJC_ID),
    FOREIGN KEY (TS_ID) REFERENCES TASK_STANDARD (TS_ID),
    KEY IDX_PJC_ID (PJC_ID),
    KEY IDX_TS_ID (TS_ID)
)
    ENGINE = InnoDB
    AUTO_INCREMENT = 42
    DEFAULT CHARSET = utf8
    COMMENT '项目任务表';

-- 创建人员可执行任务表
DROP TABLE IF EXISTS TASK_USER_EXECUTABLE;
CREATE TABLE TASK_USER_EXECUTABLE
(
    TUE_ID             INT(11)                NOT NULL AUTO_INCREMENT COMMENT 'ID',
    USER_ID            INT(11)                NOT NULL COMMENT '用户id',
    PJC_ID             INT(11)                NOT NULL COMMENT '岗位id',
    TS_ID              INT(11)                NOT NULL COMMENT '任务ID',
    PROJECT_ID         INT(11) COMMENT '项目id(任务涉及到项目的要记录项目ID)',
    SOURCE             VARCHAR(255) COMMENT '任务来源(快码:TASK_SOURCE)',
    NAME               VARCHAR(400) COMMENT '可执行任务名称',
    STATUS             VARCHAR(255) COMMENT '完成状态(快码:TASK_STATUS)',
    FINISH_USER        INT(11) COMMENT '完成人',
    COMPLETE_SITUATION VARCHAR(255) COMMENT '完全情况(快三:TASK_SITUATION)',
    SCORE              FLOAT(3, 2) COMMENT '任务得分',
    ARRIVE_DATE        DATETIME COMMENT '任务到达时间',
    NORMAL_DATE        DATETIME COMMENT '正常完成时间',
    DELAY_DATE         DATETIME COMMENT '延期完成时间',
    OPERATION_DATE     DATETIME COMMENT '操作时间',
    ACTUAL_DATE        DATETIME COMMENT '实际完成时间',
    VERSION_NUM        INT(11)  DEFAULT 0 COMMENT '版本号',
    CREATION_DATE      DATETIME DEFAULT NOW() NOT NULL COMMENT '创建时间',
    CREATED_BY         INT(11)  DEFAULT -1    NOT NULL COMMENT '创建人',
    LAST_UPDATED_BY    INT(11)  DEFAULT -1    NOT NULL COMMENT '最后修改人',
    LAST_UPDATE_DATE   DATETIME DEFAULT NOW() NOT NULL COMMENT '最后修改时间',
    LAST_UPDATE_LOGIN  INT(11) COMMENT '最后登录人',
    PRIMARY KEY (TUE_ID),
    FOREIGN KEY (PJC_ID) REFERENCES P_JOB_CONFIGURATION (PJC_ID),
    FOREIGN KEY (TS_ID) REFERENCES TASK_STANDARD (TS_ID),
    KEY IDX_USER_ID (USER_ID),
    KEY IDX_PJC_ID (PJC_ID),
    KEY IDX_TS_ID (TS_ID),
    KEY IDX_PROJECT_ID (PROJECT_ID)
)
    ENGINE = InnoDB
    AUTO_INCREMENT = 52
    DEFAULT CHARSET = utf8
    COMMENT '人员可执行任务表';

