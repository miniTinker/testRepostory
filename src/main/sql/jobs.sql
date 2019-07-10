-- 数据库初始化脚本

-- 创建数据库
CREATE DATABASE IF NOT EXISTS vrrg;

-- 使用数据库
USE vrrg;

-- 关闭外键校验
set foreign_key_checks = 0;
-- 创建岗位配置表
DROP TABLE IF EXISTS P_JOB_CONFIGURATION;
CREATE TABLE P_JOB_CONFIGURATION
(
    PJC_ID            INT(11)                NOT NULL AUTO_INCREMENT COMMENT 'ID',
    NAME              VARCHAR(255) COMMENT '岗位名称',
    DESCRIPTION       VARCHAR(750) COMMENT '描述',
    START_ACTIVE_TIME DATETIME COMMENT '生效时间',
    END_ACTIVE_TIME   DATETIME COMMENT '失效时间',
    VERSION_NUM       INT(11)  DEFAULT 0 COMMENT '版本号',
    CREATION_DATE     DATETIME DEFAULT NOW() NOT NULL COMMENT '创建时间',
    CREATED_BY        INT(11)  DEFAULT -1    NOT NULL COMMENT '创建人',
    LAST_UPDATED_BY   INT(11)  DEFAULT -1    NOT NULL COMMENT '最后修改人',
    LAST_UPDATE_DATE  DATETIME DEFAULT NOW() NOT NULL COMMENT '最后修改时间',
    LAST_UPDATE_LOGIN INT(11) COMMENT '最后登录人',
    PRIMARY KEY (PJC_ID)
)
    ENGINE = InnoDB
    AUTO_INCREMENT = 11
    DEFAULT CHARSET = utf8
    COMMENT '岗位配置表';

-- 创建岗位上游表
DROP TABLE IF EXISTS P_JOB_UPPER_COURSE;
CREATE TABLE P_JOB_UPPER_COURSE
(
    PJUC_ID           INT(11)                NOT NULL AUTO_INCREMENT COMMENT 'ID',
    PJC_ID            INT(11)                NOT NULL COMMENT '岗位ID',
    UPPER_COURSE_ID   INT(11)                NOT NULL COMMENT '上游ID',
    VERSION_NUM       INT(11)  DEFAULT 0 COMMENT '版本号',
    CREATION_DATE     DATETIME DEFAULT NOW() NOT NULL COMMENT '创建时间',
    CREATED_BY        INT(11)  DEFAULT -1    NOT NULL COMMENT '创建人',
    LAST_UPDATED_BY   INT(11)  DEFAULT -1    NOT NULL COMMENT '最后修改人',
    LAST_UPDATE_DATE  DATETIME DEFAULT NOW() NOT NULL COMMENT '最后修改时间',
    LAST_UPDATE_LOGIN INT(11) COMMENT '最后登录人',
    PRIMARY KEY (PJUC_ID),
    FOREIGN KEY (PJC_ID) REFERENCES P_JOB_CONFIGURATION (PJC_ID),
    KEY IDX_PJC_ID (PJC_ID),
    KEY IDX_UPPER_COURSE_ID (UPPER_COURSE_ID)
)
    ENGINE = InnoDB
    AUTO_INCREMENT = 11
    DEFAULT CHARSET = utf8
    COMMENT '岗位上游表';

-- 创建岗位上级表
DROP TABLE IF EXISTS P_JOB_SUPERIOR;
CREATE TABLE P_JOB_SUPERIOR
(
    PJS_ID            INT(11)                NOT NULL AUTO_INCREMENT COMMENT 'ID',
    PJC_ID            INT(11)                NOT NULL COMMENT '岗位ID',
    SUPERIOR_ID       INT(11)                NOT NULL COMMENT '上级ID',
    VERSION_NUM       INT(11)  DEFAULT 0 COMMENT '版本号',
    CREATION_DATE     DATETIME DEFAULT NOW() NOT NULL COMMENT '创建时间',
    CREATED_BY        INT(11)  DEFAULT -1    NOT NULL COMMENT '创建人',
    LAST_UPDATED_BY   INT(11)  DEFAULT -1    NOT NULL COMMENT '最后修改人',
    LAST_UPDATE_DATE  DATETIME DEFAULT NOW() NOT NULL COMMENT '最后修改时间',
    LAST_UPDATE_LOGIN INT(11) COMMENT '最后登录人',
    PRIMARY KEY (PJS_ID),
    FOREIGN KEY (PJC_ID) REFERENCES P_JOB_CONFIGURATION (PJC_ID),
    KEY IDX_PJC_ID (PJC_ID),
    KEY IDX_SUPERIOR_ID (SUPERIOR_ID)
)
    ENGINE = InnoDB
    AUTO_INCREMENT = 11
    DEFAULT CHARSET = utf8
    COMMENT '岗位上级表';

-- 创建岗位本部表
DROP TABLE IF EXISTS P_JOB_PART;
CREATE TABLE P_JOB_PART
(
    PJP_ID            INT(11)                NOT NULL AUTO_INCREMENT COMMENT 'ID',
    PJC_ID            INT(11)                NOT NULL COMMENT '岗位ID',
    PART_ID           INT(11)                NOT NULL COMMENT '本部ID',
    VERSION_NUM       INT(11)  DEFAULT 0 COMMENT '版本号',
    CREATION_DATE     DATETIME DEFAULT NOW() NOT NULL COMMENT '创建时间',
    CREATED_BY        INT(11)  DEFAULT -1    NOT NULL COMMENT '创建人',
    LAST_UPDATED_BY   INT(11)  DEFAULT -1    NOT NULL COMMENT '最后修改人',
    LAST_UPDATE_DATE  DATETIME DEFAULT NOW() NOT NULL COMMENT '最后修改时间',
    LAST_UPDATE_LOGIN INT(11) COMMENT '最后登录人',
    PRIMARY KEY (PJP_ID),
    FOREIGN KEY (PJC_ID) REFERENCES P_JOB_CONFIGURATION (PJC_ID),
    KEY IDX_PJC_ID (PJC_ID),
    KEY IDX_PART_ID (PART_ID)
)
    ENGINE = InnoDB
    AUTO_INCREMENT = 11
    DEFAULT CHARSET = utf8
    COMMENT '岗位本部表';

-- 创建岗位用户关联表
DROP TABLE IF EXISTS P_JOB_USER;
CREATE TABLE P_JOB_USER
(
    PJU_ID            INT(11)                NOT NULL AUTO_INCREMENT COMMENT 'ID',
    PJC_ID            INT(11)                NOT NULL COMMENT '岗位ID',
    USER_ID           INT(11)                NOT NULL COMMENT '岗位ID',
    VERSION_NUM       INT(11)  DEFAULT 0 COMMENT '版本号',
    CREATION_DATE     DATETIME DEFAULT NOW() NOT NULL COMMENT '创建时间',
    CREATED_BY        INT(11)  DEFAULT -1    NOT NULL COMMENT '创建人',
    LAST_UPDATED_BY   INT(11)  DEFAULT -1    NOT NULL COMMENT '最后修改人',
    LAST_UPDATE_DATE  DATETIME DEFAULT NOW() NOT NULL COMMENT '最后修改时间',
    LAST_UPDATE_LOGIN INT(11) COMMENT '最后登录人',
    PRIMARY KEY (PJU_ID),
    KEY IDX_PJC_ID (PJC_ID),
    KEY IDX_USER_ID (USER_ID)
)
    ENGINE = InnoDB
    AUTO_INCREMENT = 11
    DEFAULT CHARSET = utf8
    COMMENT '岗位用户关联表';

-- 创建职位配置表
DROP TABLE IF EXISTS P_POSITION_CONFIGURATION;
CREATE TABLE P_POSITION_CONFIGURATION
(
    PPC_ID            INT(11)                NOT NULL AUTO_INCREMENT COMMENT 'ID',
    NAME              VARCHAR(255) COMMENT '职位名称',
    DESCRIPTION       VARCHAR(750) COMMENT '描述',
    START_ACTIVE_TIME DATETIME COMMENT '生效时间',
    END_ACTIVE_TIME   DATETIME COMMENT '失效时间',
    VERSION_NUM       INT(11)  DEFAULT 0 COMMENT '版本号',
    CREATION_DATE     DATETIME DEFAULT NOW() NOT NULL COMMENT '创建时间',
    CREATED_BY        INT(11)  DEFAULT -1    NOT NULL COMMENT '创建人',
    LAST_UPDATED_BY   INT(11)  DEFAULT -1    NOT NULL COMMENT '最后修改人',
    LAST_UPDATE_DATE  DATETIME DEFAULT NOW() NOT NULL COMMENT '最后修改时间',
    LAST_UPDATE_LOGIN INT(11) COMMENT '最后登录人',
    PRIMARY KEY (PPC_ID)
)
    ENGINE = InnoDB
    AUTO_INCREMENT = 21
    DEFAULT CHARSET = utf8
    COMMENT '职位配置表';

-- 创建职位关系表
DROP TABLE IF EXISTS P_POSITION_RELATION;
CREATE TABLE P_POSITION_RELATION(
    PPR_ID      INT(11)  NOT NULL AUTO_INCREMENT COMMENT 'ID',
    PPC_ID      INT(11) NOT NULL COMMENT '职位ID',
    UP_ID       INT(11) NOT NULL COMMENT '晋升职位ID',
    VERSION_NUM       INT(11)  DEFAULT 0 COMMENT '版本号',
    CREATION_DATE     DATETIME DEFAULT NOW() NOT NULL COMMENT '创建时间',
    CREATED_BY        INT(11)  DEFAULT -1    NOT NULL COMMENT '创建人',
    LAST_UPDATED_BY   INT(11)  DEFAULT -1    NOT NULL COMMENT '最后修改人',
    LAST_UPDATE_DATE  DATETIME DEFAULT NOW() NOT NULL COMMENT '最后修改时间',
    LAST_UPDATE_LOGIN INT(11) COMMENT '最后登录人',
    PRIMARY KEY (PPR_ID),
    KEY IDX_PPC_ID(PPC_ID),
    KEY IDX_UP_ID(UP_ID)
)
    ENGINE = InnoDB
    AUTO_INCREMENT = 21
    DEFAULT CHARSET = utf8
    COMMENT '创建职位关系表';

-- 创建职位晋升标准表
DROP TABLE IF EXISTS P_POSITION_PROMOTION;
CREATE TABLE P_POSITION_PROMOTION
(
    PPP_ID            INT(11)                NOT NULL AUTO_INCREMENT COMMENT 'ID',
    PPC_ID            INT(11)                NOT NULL COMMENT '职位id',
    INDICATORS        VARCHAR(225) COMMENT '指标项',
    PROPORTION        FLOAT(6, 4) COMMENT '指标比重',
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
    TASK_RATIO        FLOAT(6, 4) COMMENT '任务比重',
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
    TASK_RATIO        FLOAT(6, 4) COMMENT '任务比重',
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
    SCORE              FLOAT(6, 2) COMMENT '任务得分',
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

-- 创建线下结果录入表
DROP TABLE IF EXISTS TASK_OFFLINE_ENTRY;
CREATE TABLE TASK_OFFLINE_ENTRY
(
    TOE_ID              INT(11)                NOT NULL AUTO_INCREMENT COMMENT 'ID',
    USER_ID             INT(11) COMMENT '任务执行人',
    PJC_ID              INT(11) COMMENT '岗位id',
    CONTENT             VARCHAR(750) COMMENT '评分内容',
    TYPE                VARCHAR(255) COMMENT '评分类型(快码:TASK_GRADE_TYPE)',
    SCORE               FLOAT(6, 2) COMMENT '线下评分',
    DESCRIPTION         VARCHAR(750) COMMENT '评分描述',
    GRADE_TIME          DATETIME COMMENT '评分时间',
    PROCESS_INSTANCE_ID VARCHAR(200) COMMENT '流程id',
    STATUS              VARCHAR(255) COMMENT '流程状态',
    VERSION_NUM         INT(11)  DEFAULT 0 COMMENT '版本号',
    CREATION_DATE       DATETIME DEFAULT NOW() NOT NULL COMMENT '创建时间',
    CREATED_BY          INT(11)  DEFAULT -1    NOT NULL COMMENT '创建人',
    LAST_UPDATED_BY     INT(11)  DEFAULT -1    NOT NULL COMMENT '最后修改人',
    LAST_UPDATE_DATE    DATETIME DEFAULT NOW() NOT NULL COMMENT '最后修改时间',
    LAST_UPDATE_LOGIN   INT(11) COMMENT '最后登录人',
    PRIMARY KEY (TOE_ID),
    KEY IDX_USER_ID (USER_ID),
    KEY IDX_PJC_ID (PJC_ID)
)
    ENGINE = InnoDB
    AUTO_INCREMENT = 62
    DEFAULT CHARSET = utf8
    COMMENT '线下结果录入表';

-- 创建评价维度设置表
DROP TABLE IF EXISTS REVIEW_DIMENSION_SETTING;
CREATE TABLE REVIEW_DIMENSION_SETTING
(
    RDS_ID            INT(11)                NOT NULL AUTO_INCREMENT COMMENT 'ID',
    TS_ID             INT(11)                NOT NULL COMMENT '任务id',
    START_ACTIVE_TIME DATETIME COMMENT '生效时间',
    END_ACTIVE_TIME   DATETIME COMMENT '失效时间',
    DESCRIPTION       VARCHAR(750) COMMENT '平价描述',
    VERSION_NUM       INT(11)  DEFAULT 0 COMMENT '版本号',
    CREATION_DATE     DATETIME DEFAULT NOW() NOT NULL COMMENT '创建时间',
    CREATED_BY        INT(11)  DEFAULT -1    NOT NULL COMMENT '创建人',
    LAST_UPDATED_BY   INT(11)  DEFAULT -1    NOT NULL COMMENT '最后修改人',
    LAST_UPDATE_DATE  DATETIME DEFAULT NOW() NOT NULL COMMENT '最后修改时间',
    LAST_UPDATE_LOGIN INT(11) COMMENT '最后登录人',
    PRIMARY KEY (RDS_ID),
    FOREIGN KEY (TS_ID) REFERENCES TASK_STANDARD (TS_ID),
    KEY IDX_TS_ID (TS_ID)
)
    ENGINE = InnoDB
    AUTO_INCREMENT = 13
    DEFAULT CHARSET = utf8
    COMMENT '评价维度设置表';

-- 创建一级维度表
DROP TABLE IF EXISTS REVIEW_DIMENSION_LEVEL_1;
CREATE TABLE REVIEW_DIMENSION_LEVEL_1
(
    RDL1_ID           INT(11)                NOT NULL AUTO_INCREMENT COMMENT 'ID',
    RDS_ID            INT(11)                NOT NULL COMMENT '评价维度id',
    NAME              VARCHAR(255) COMMENT '维度名称(快码:DIMENSION_NAME)',
    PROPORTION        FLOAT(6, 4) COMMENT '维度占比',
    VERSION_NUM       INT(11)  DEFAULT 0 COMMENT '版本号',
    CREATION_DATE     DATETIME DEFAULT NOW() NOT NULL COMMENT '创建时间',
    CREATED_BY        INT(11)  DEFAULT -1    NOT NULL COMMENT '创建人',
    LAST_UPDATED_BY   INT(11)  DEFAULT -1    NOT NULL COMMENT '最后修改人',
    LAST_UPDATE_DATE  DATETIME DEFAULT NOW() NOT NULL COMMENT '最后修改时间',
    LAST_UPDATE_LOGIN INT(11) COMMENT '最后登录人',
    PRIMARY KEY (RDL1_ID),
    FOREIGN KEY (RDS_ID) REFERENCES REVIEW_DIMENSION_SETTING (RDS_ID),
    KEY IDX_RDS_ID (RDS_ID)
)
    ENGINE = InnoDB
    AUTO_INCREMENT = 23
    DEFAULT CHARSET = utf8
    COMMENT '评价维度一级维度表';

-- 创建二级维度表
DROP TABLE IF EXISTS REVIEW_DIMENSION_LEVEL_2;
CREATE TABLE REVIEW_DIMENSION_LEVEL_2
(
    RDL2_ID           INT(11)                NOT NULL AUTO_INCREMENT COMMENT 'ID',
    RDL1_ID           INT(11)                NOT NULL COMMENT '一级维度ID',
    WAY               VARCHAR(255) COMMENT '评价方式(快码:DIMENSION_WAY)',
    PROPORTION        FLOAT(6, 4) COMMENT '维度占比',
    IS_CLOSE_NODE     VARCHAR(2) COMMENT '是否关闭节点(快码:TASK_IS)',
    STANDARD_SQL      TEXT COMMENT '评价标准',
    RESULT_SLQ        TEXT COMMENT '结果得分',
    VERSION_NUM       INT(11)  DEFAULT 0 COMMENT '版本号',
    CREATION_DATE     DATETIME DEFAULT NOW() NOT NULL COMMENT '创建时间',
    CREATED_BY        INT(11)  DEFAULT -1    NOT NULL COMMENT '创建人',
    LAST_UPDATED_BY   INT(11)  DEFAULT -1    NOT NULL COMMENT '最后修改人',
    LAST_UPDATE_DATE  DATETIME DEFAULT NOW() NOT NULL COMMENT '最后修改时间',
    LAST_UPDATE_LOGIN INT(11) COMMENT '最后登录人',
    PRIMARY KEY (RDL2_ID),
    FOREIGN KEY (RDL1_ID) REFERENCES REVIEW_DIMENSION_LEVEL_1 (RDL1_ID),
    KEY IDX_RDL1_ID (RDL1_ID)
)
    ENGINE = InnoDB
    AUTO_INCREMENT = 33
    DEFAULT CHARSET = utf8
    COMMENT '评价维度二级维度表';

-- 创建人员维度得分表
DROP TABLE IF EXISTS USER_DIMENSION_SCORE;
CREATE TABLE USER_DIMENSION_SCORE
(
    UDS_ID            INT(11)                NOT NULL AUTO_INCREMENT COMMENT 'ID',
    USER_ID           INT(11)                NOT NULL COMMENT '用户ID',
    TUE_ID            INT(11)                NOT NULL COMMENT '人员可执行任务id',
    LEVEL_1           VARCHAR(255) COMMENT '一级维度',
    PROPORTION_1      FLOAT(6, 4) COMMENT '一经比重',
    LEVEL_2           VARCHAR(255) COMMENT '二级维度',
    PROPORTION_2      FLOAT(6, 4) COMMENT '二级比重',
    SCORE             FLOAT(6, 2) COMMENT '维度得分',
    DESCRIPTION       VARCHAR(255) COMMENT '得分备注(快码:SCORE_TYPE)',
    SCORE_TIME        DATETIME COMMENT '得分时间',
    VERSION_NUM       INT(11)  DEFAULT 0 COMMENT '版本号',
    CREATION_DATE     DATETIME DEFAULT NOW() NOT NULL COMMENT '创建时间',
    CREATED_BY        INT(11)  DEFAULT -1    NOT NULL COMMENT '创建人',
    LAST_UPDATED_BY   INT(11)  DEFAULT -1    NOT NULL COMMENT '最后修改人',
    LAST_UPDATE_DATE  DATETIME DEFAULT NOW() NOT NULL COMMENT '最后修改时间',
    LAST_UPDATE_LOGIN INT(11) COMMENT '最后登录人',
    PRIMARY KEY (UDS_ID),
    KEY IDX_USER_ID (USER_ID),
    KEY IDX_TUE_ID (TUE_ID)
)
    ENGINE = InnoDB
    AUTO_INCREMENT = 14
    DEFAULT CHARSET = utf8
    COMMENT '人员维度得分表';

-- 创建人员单任务得分
DROP TABLE IF EXISTS USER_ONE_TASK_SCORE;
CREATE TABLE USER_ONE_TASK_SCORE
(
    UOTS_ID           INT(11)                NOT NULL AUTO_INCREMENT COMMENT 'ID',
    USER_ID           INT(11)                NOT NULL COMMENT '用户ID',
    TUE_ID            INT(11) COMMENT '人员可执行任务ID',
    SCORE             FLOAT(6, 2) COMMENT '任务得分',
    DESCRIPTION       VARCHAR(255) COMMENT '得分备注(快码:SCORE_TYPE)',
    STATISTICAL_TIME  DATETIME COMMENT '得分时间',
    VERSION_NUM       INT(11)  DEFAULT 0 COMMENT '版本号',
    CREATION_DATE     DATETIME DEFAULT NOW() NOT NULL COMMENT '创建时间',
    CREATED_BY        INT(11)  DEFAULT -1    NOT NULL COMMENT '创建人',
    LAST_UPDATED_BY   INT(11)  DEFAULT -1    NOT NULL COMMENT '最后修改人',
    LAST_UPDATE_DATE  DATETIME DEFAULT NOW() NOT NULL COMMENT '最后修改时间',
    LAST_UPDATE_LOGIN INT(11) COMMENT '最后登录人',
    PRIMARY KEY (UOTS_ID),
    KEY IDX_USER_ID (USER_ID),
    KEY IDX_TUE_ID (TUE_ID)
)
    ENGINE = InnoDB
    AUTO_INCREMENT = 24
    DEFAULT CHARSET = utf8
    COMMENT '人员单任务得分表';

-- 创建人员同类任务得分表(通过人员单任得分统计,通过USER_ID,PJC_ID,TS_ID三个维度汇总)
DROP TABLE IF EXISTS USER_SIMILAR_SCORE;
CREATE TABLE USER_SIMILAR_SCORE
(
    USS_ID            INT(11)                NOT NULL AUTO_INCREMENT COMMENT 'ID',
    USER_ID           INT(11)                NOT NULL COMMENT '用户ID',
    PJC_ID            INT(11) COMMENT '岗位ID',
    TS_ID             INT(11) COMMENT '任务ID',
    TJ_ID             INT(11) COMMENT '岗位任务ID',
    USER_NAME         VARCHAR(255) COMMENT '人员名称',
    JOBS_NAME         VARCHAR(255) COMMENT '岗位名称',
    HR_NAME           VARCHAR(255) COMMENT 'HR岗位',
    SAP_NUM           VARCHAR(255) COMMENT 'SAP号',
    JOB_TASK          VARCHAR(255) COMMENT '岗位任务',
    TYPE              VARCHAR(255) COMMENT '任务类型(快码:TASK_TYPE)',
    IS_SYNC           VARCHAR(2) COMMENT '是否同步(快码:TASK_IS)',
    TASK_COUNT        FLOAT COMMENT '统计任务数',
    COUNT_SCORE       FLOAT COMMENT '任务总得分',
    MAX_SCORE         FLOAT COMMENT '当期最高得分',
    CONVERSION_SCORE  FLOAT(6, 2) COMMENT '换算百分制分数',
    STATISTICAL_TIME  DATETIME COMMENT '统计时间',
    VERSION_NUM       INT(11)  DEFAULT 0 COMMENT '版本号',
    CREATION_DATE     DATETIME DEFAULT NOW() NOT NULL COMMENT '创建时间',
    CREATED_BY        INT(11)  DEFAULT -1    NOT NULL COMMENT '创建人',
    LAST_UPDATED_BY   INT(11)  DEFAULT -1    NOT NULL COMMENT '最后修改人',
    LAST_UPDATE_DATE  DATETIME DEFAULT NOW() NOT NULL COMMENT '最后修改时间',
    LAST_UPDATE_LOGIN INT(11) COMMENT '最后登录人',
    PRIMARY KEY (USS_ID),
    KEY IDX_USER_ID (USER_ID),
    KEY IDX_PJC_ID (PJC_ID),
    KEY IDX_TJ_ID (TJ_ID),
    KEY IDX_TS_ID (TS_ID)
)
    ENGINE = InnoDB
    AUTO_INCREMENT = 34
    DEFAULT CHARSET = utf8
    COMMENT '人员同类任务得分表';

-- 创建人员岗位任务得分表(按年依存)
DROP TABLE IF EXISTS USER_JOB_SCORE;
CREATE TABLE USER_JOB_SCORE
(
    UJS_ID            INT(11)                NOT NULL AUTO_INCREMENT COMMENT 'ID',
    YEAR              VARCHAR(20) COMMENT '年',
    USER_ID           INT(11) COMMENT '用户ID',
    PJC_ID            INT(11) COMMENT '岗位ID',
    TJ_ID             INT(11) COMMENT '岗位任务ID',
    USER_NAME         VARCHAR(255) COMMENT '人员名称',
    JOBS_NAME         VARCHAR(255) COMMENT '岗位名称',
    HR_NAME           VARCHAR(255) COMMENT 'HR岗位',
    SAP_NUM           VARCHAR(255) COMMENT 'SAP号',
    JOB_TASK          VARCHAR(255) COMMENT '岗位任务',
    TYPE              VARCHAR(255) COMMENT '任务类型(快码:TASK_TYPE)',
    IS_SYNC           VARCHAR(2) COMMENT '是否同步(快码:TASK_IS)',
    TASK_RATIO        FLOAT(6, 4) COMMENT '任务比重',
    IS_SHARE_RATIO    VARCHAR(2) COMMENT '是否分摊比重(快码:TASK_IS)',
    TASK_SCORE        FLOAT(6, 2) COMMENT '任务得分',
    CONVERSION_SCORE  FLOAT(6, 2) COMMENT '换算后得分',
    STATISTICAL_TIME  DATETIME COMMENT '统计时间',
    VERSION_NUM       INT(11)  DEFAULT 0 COMMENT '版本号',
    CREATION_DATE     DATETIME DEFAULT NOW() NOT NULL COMMENT '创建时间',
    CREATED_BY        INT(11)  DEFAULT -1    NOT NULL COMMENT '创建人',
    LAST_UPDATED_BY   INT(11)  DEFAULT -1    NOT NULL COMMENT '最后修改人',
    LAST_UPDATE_DATE  DATETIME DEFAULT NOW() NOT NULL COMMENT '最后修改时间',
    LAST_UPDATE_LOGIN INT(11) COMMENT '最后登录人',
    PRIMARY KEY (UJS_ID),
    KEY IDX_USER_ID (USER_ID),
    KEY IDX_PJC_ID (PJC_ID),
    KEY IDX_TJ_ID (TJ_ID)
)
    ENGINE = InnoDB
    AUTO_INCREMENT = 44
    DEFAULT CHARSET = utf8
    COMMENT '人员岗位任务得分表';

-- 创建KPI考核导入表
DROP TABLE IF EXISTS KPI_ASSESS;
CREATE TABLE KPI_ASSESS
(
    KA_ID             INT(11)                NOT NULL AUTO_INCREMENT COMMENT 'ID',
    USER_ID           INT(11) COMMENT '用户ID',
    USER_NAME         VARCHAR(255) COMMENT '人员',
    PJC_ID            INT(11) COMMENT '岗位ID',
    JOB_NAME          VARCHAR(255) COMMENT '岗位名称',
    INDEX_ITEM        VARCHAR(255) COMMENT '指标项',
    INDEX_RATIO       FLOAT(6, 4) COMMENT '指标占比',
    NORM_RATIO        FLOAT(6, 4) COMMENT '标准项',
    ACTUAL_RATIO      FLOAT(6, 4) COMMENT '实际项',
    SCORE             FLOAT(6, 2) COMMENT '得分值',
    DESCRIPTION       VARCHAR(750) COMMENT '备注',
    VERSION_NUM       INT(11)  DEFAULT 0 COMMENT '版本号',
    CREATION_DATE     DATETIME DEFAULT NOW() NOT NULL COMMENT '创建时间',
    CREATED_BY        INT(11)  DEFAULT -1    NOT NULL COMMENT '创建人',
    LAST_UPDATED_BY   INT(11)  DEFAULT -1    NOT NULL COMMENT '最后修改人',
    LAST_UPDATE_DATE  DATETIME DEFAULT NOW() NOT NULL COMMENT '最后修改时间',
    LAST_UPDATE_LOGIN INT(11) COMMENT '最后登录人',
    PRIMARY KEY (KA_ID),
    KEY IDX_USER_ID (USER_ID),
    KEY IDX_PJC_ID (PJC_ID)
)
    ENGINE = InnoDB
    AUTO_INCREMENT = 54
    DEFAULT CHARSET = utf8
    COMMENT 'KPI考核导入表';

-- 上下游评价
-- 创建模板库表
DROP TABLE IF EXISTS EVAL_TEMP_LIBRARY;
CREATE TABLE EVAL_TEMP_LIBRARY
(
    ETL_ID            INT(11)                NOT NULL AUTO_INCREMENT COMMENT 'ID',
    PARENT_ID         INT(11) COMMENT '父ID',
    NAME              VARCHAR(255) COMMENT '模板名',
    DESCRIPTION       VARCHAR(750) COMMENT '描述',
    VERSION_NUM       INT(11)  DEFAULT 0 COMMENT '版本号',
    CREATION_DATE     DATETIME DEFAULT NOW() NOT NULL COMMENT '创建时间',
    CREATED_BY        INT(11)  DEFAULT -1    NOT NULL COMMENT '创建人',
    LAST_UPDATED_BY   INT(11)  DEFAULT -1    NOT NULL COMMENT '最后修改人',
    LAST_UPDATE_DATE  DATETIME DEFAULT NOW() NOT NULL COMMENT '最后修改时间',
    LAST_UPDATE_LOGIN INT(11) COMMENT '最后登录人',
    PRIMARY KEY (ETL_ID),
    KEY IDX_PARENT_ID (PARENT_ID)
)
    ENGINE = InnoDB
    AUTO_INCREMENT = 15
    DEFAULT CHARSET = utf8
    COMMENT '上下游模板库表';

-- 创建平价模板
DROP TABLE IF EXISTS EVAL_TEMP;
CREATE TABLE EVAL_TEMP
(
    ET_ID             INT(11)                NOT NULL AUTO_INCREMENT COMMENT 'ID',
    ETL_ID            INT(11) COMMENT '模板库ID',
    PJC_ID            INT(11) COMMENT '岗位ID',
    TEMP_NAME         VARCHAR(255) COMMENT '模板名称',
    JOB_NAME          VARCHAR(255) COMMENT '岗位名称',
    NODE              VARCHAR(255) COMMENT '评价节点(快码:EVAL_NODE)',
    DESCRIPTION       VARCHAR(750) COMMENT '描述信息',
    START_ACTIVE_TIME DATETIME COMMENT '生效时间',
    END_ACTIVE_TIME   DATETIME COMMENT '失效时间',
    VERSION_NUM       INT(11)  DEFAULT 0 COMMENT '版本号',
    CREATION_DATE     DATETIME DEFAULT NOW() NOT NULL COMMENT '创建时间',
    CREATED_BY        INT(11)  DEFAULT -1    NOT NULL COMMENT '创建人',
    LAST_UPDATED_BY   INT(11)  DEFAULT -1    NOT NULL COMMENT '最后修改人',
    LAST_UPDATE_DATE  DATETIME DEFAULT NOW() NOT NULL COMMENT '最后修改时间',
    LAST_UPDATE_LOGIN INT(11) COMMENT '最后登录人',
    PRIMARY KEY (ET_ID),
    KEY IDX_ETL_ID (ETL_ID),
    KEY IDX_PJC_ID (PJC_ID)
)
    ENGINE = InnoDB
    AUTO_INCREMENT = 25
    DEFAULT CHARSET = utf8
    COMMENT '上下游评价模板表';

-- 创建发布评价表
DROP TABLE IF EXISTS EVAL_RELEASE;
CREATE TABLE EVAL_RELEASE
(
    ER_ID             INT(11)                NOT NULL AUTO_INCREMENT COMMENT 'ID',
    PJC_ID            INT(11) COMMENT '岗位ID',
    JOB_NAME          VARCHAR(255) COMMENT '岗位名称',
    CITY_ID           INT(11) COMMENT '城市ID',
    EVAL_CODE         VARCHAR(255) COMMENT '发布编号',
    NAME              VARCHAR(255) COMMENT '发布名称',
    STATUS            VARCHAR(255) COMMENT '发布状态(快码:EVAL_RELEASE_STATUS)',
    START_ACTIVE_TIME DATETIME COMMENT '生效时间',
    END_ACTIVE_TIME   DATETIME COMMENT '失效时间',
    DESCRIPTION       VARCHAR(750) COMMENT '描述',
    VERSION_NUM       INT(11)  DEFAULT 0 COMMENT '版本号',
    CREATION_DATE     DATETIME DEFAULT NOW() NOT NULL COMMENT '创建时间',
    CREATED_BY        INT(11)  DEFAULT -1    NOT NULL COMMENT '创建人',
    LAST_UPDATED_BY   INT(11)  DEFAULT -1    NOT NULL COMMENT '最后修改人',
    LAST_UPDATE_DATE  DATETIME DEFAULT NOW() NOT NULL COMMENT '最后修改时间',
    LAST_UPDATE_LOGIN INT(11) COMMENT '最后登录人',
    PRIMARY KEY (ER_ID),
    KEY IDX_PJC_ID (PJC_ID),
    KEY IDX_CITY_ID (CITY_ID)
)
    ENGINE = InnoDB
    AUTO_INCREMENT = 35
    DEFAULT CHARSET = utf8
    COMMENT '发布评价表';

-- 创建被评价人表
DROP TABLE IF EXISTS EVAL_BY_NAME;
CREATE TABLE EVAL_BY_NAME
(
    EBN_ID            INT(11)                NOT NULL AUTO_INCREMENT COMMENT 'ID',
    ER_ID             INT(11)                NOT NULL COMMENT '发布评价ID',
    USER_ID           INT(11) COMMENT '用户ID',
    VERSION_NUM       INT(11)  DEFAULT 0 COMMENT '版本号',
    CREATION_DATE     DATETIME DEFAULT NOW() NOT NULL COMMENT '创建时间',
    CREATED_BY        INT(11)  DEFAULT -1    NOT NULL COMMENT '创建人',
    LAST_UPDATED_BY   INT(11)  DEFAULT -1    NOT NULL COMMENT '最后修改人',
    LAST_UPDATE_DATE  DATETIME DEFAULT NOW() NOT NULL COMMENT '最后修改时间',
    LAST_UPDATE_LOGIN INT(11) COMMENT '最后登录人',
    PRIMARY KEY (EBN_ID),
    FOREIGN KEY (ER_ID) REFERENCES EVAL_RELEASE (ER_ID),
    KEY IDX_ER_ID (ER_ID),
    KEY IDX_USER_ID (USER_ID)
)
    ENGINE = InnoDB
    AUTO_INCREMENT 45
    DEFAULT CHARSET = utf8
    COMMENT '被评价人表';

-- 创建评价人表
DROP TABLE IF EXISTS EVAL_NAME;
CREATE TABLE EVAL_NAME
(
    EN_ID             INT(11)                NOT NULL AUTO_INCREMENT COMMENT 'ID',
    ER_ID             INT(11)                NOT NULL COMMENT '发布评价ID',
    USER_ID           INT(11) COMMENT '用户ID',
    VERSION_NUM       INT(11)  DEFAULT 0 COMMENT '版本号',
    CREATION_DATE     DATETIME DEFAULT NOW() NOT NULL COMMENT '创建时间',
    CREATED_BY        INT(11)  DEFAULT -1    NOT NULL COMMENT '创建人',
    LAST_UPDATED_BY   INT(11)  DEFAULT -1    NOT NULL COMMENT '最后修改人',
    LAST_UPDATE_DATE  DATETIME DEFAULT NOW() NOT NULL COMMENT '最后修改时间',
    LAST_UPDATE_LOGIN INT(11) COMMENT '最后登录人',
    PRIMARY KEY (EN_ID),
    FOREIGN KEY (ER_ID) REFERENCES EVAL_RELEASE (ER_ID),
    KEY IDX_ER_ID (ER_ID),
    KEY IDX_USER_ID (USER_ID)
)
    ENGINE = InnoDB
    AUTO_INCREMENT = 55
    DEFAULT CHARSET = utf8
    COMMENT '评价人表';

-- 创建发布评价模板表
DROP TABLE IF EXISTS EVAL_RELEASE_TEMP;
CREATE TABLE EVAL_RELEASE_TEMP
(
    ERT_ID            INT(11)                NOT NULL AUTO_INCREMENT COMMENT 'ID',
    ER_ID             INT(11)                NOT NULL COMMENT '发布评价ID',
    ET_ID             INT(11)                NOT NULL COMMENT '评价模板ID',
    RATIO             FLOAT(6, 4) COMMENT '评价比重',
    VERSION_NUM       INT(11)  DEFAULT 0 COMMENT '版本号',
    CREATION_DATE     DATETIME DEFAULT NOW() NOT NULL COMMENT '创建时间',
    CREATED_BY        INT(11)  DEFAULT -1    NOT NULL COMMENT '创建人',
    LAST_UPDATED_BY   INT(11)  DEFAULT -1    NOT NULL COMMENT '最后修改人',
    LAST_UPDATE_DATE  DATETIME DEFAULT NOW() NOT NULL COMMENT '最后修改时间',
    LAST_UPDATE_LOGIN INT(11) COMMENT '最后登录人',
    PRIMARY KEY (ERT_ID),
    FOREIGN KEY (ER_ID) REFERENCES EVAL_RELEASE (ER_ID),
    FOREIGN KEY (ET_ID) REFERENCES EVAL_TEMP (ET_ID),
    KEY IDX_ER_ID (ER_ID),
    KEY IDX_ET_ID (ET_ID)
)
    ENGINE = InnoDB
    AUTO_INCREMENT = 65
    DEFAULT CHARSET = utf8
    COMMENT '发布评价模板表';

-- 创建评价详情表
DROP TABLE IF EXISTS EVAL_DETAIL;
CREATE TABLE EVAL_DETAIL
(
    ED_ID             INT(11)                NOT NULL AUTO_INCREMENT COMMENT 'ID',
    ER_ID             INT(11) COMMENT '发布评价ID',
    EN_ID             INT(11) COMMENT '评价人ID',
    ET_ID             INT(11) COMMENT '评价模板ID',
    TEMP_NAME         VARCHAR(255) COMMENT '模板名',
    EBN_ID            INT(11) COMMENT '被评价人ID',
    USER_NAME         VARCHAR(255) COMMENT '用户启',
    SCORE             FLOAT(6, 2) COMMENT '得分',
    VERSION_NUM       INT(11)  DEFAULT 0 COMMENT '版本号',
    CREATION_DATE     DATETIME DEFAULT NOW() NOT NULL COMMENT '创建时间',
    CREATED_BY        INT(11)  DEFAULT -1    NOT NULL COMMENT '创建人',
    LAST_UPDATED_BY   INT(11)  DEFAULT -1    NOT NULL COMMENT '最后修改人',
    LAST_UPDATE_DATE  DATETIME DEFAULT NOW() NOT NULL COMMENT '最后修改时间',
    LAST_UPDATE_LOGIN INT(11) COMMENT '最后登录人',
    PRIMARY KEY (ED_ID),
    FOREIGN KEY (ER_ID) REFERENCES EVAL_RELEASE (ER_ID),
    FOREIGN KEY (EN_ID) REFERENCES EVAL_NAME (EN_ID),
    FOREIGN KEY (ET_ID) REFERENCES EVAL_TEMP (ET_ID),
    FOREIGN KEY (EBN_ID) REFERENCES EVAL_BY_NAME (EBN_ID),
    KEY IDX_ER_ID (ER_ID),
    KEY IDX_EN_ID (EN_ID),
    KEY IDX_ET_ID (ET_ID),
    KEY IDX_EBN_ID (EBN_ID)
)
    ENGINE = InnoDB
    AUTO_INCREMENT = 75
    DEFAULT CHARSET = utf8
    COMMENT '评价详情表';

-- 创建师徒关系表
DROP TABLE IF EXISTS MD_MASTER_DISCIPLE;
CREATE TABLE MD_MASTER_DISCIPLE
(
    MMD_ID            INT(11)                NOT NULL AUTO_INCREMENT COMMENT 'ID',
    M_USER_ID         INT(11)                NOT NULL COMMENT '师父id',
    M_CITY_ID         INT(11)                NOT NULL COMMENT '师父城市ID',
    D_USER_ID         INT(11)                NOT NULL COMMENT '徒弟ID',
    D_CITY_ID         INT(11)                NOT NULL COMMENT '徒弟城市ID',
    SKILL             VARCHAR(255) COMMENT '技能(快码:VR_PROCESS_TYPE)',
    START_TIME        DATETIME COMMENT '成师时间(对应师父字段)',
    START_ACTIVE_TIME DATETIME COMMENT '有效时间',
    END_ACTIVE_TIME   DATETIME COMMENT '失效时间',
    START_MONTH       VARCHAR(10) COMMENT '带教开始月份(对应徒弟字段)',
    SHOULD_MONTH      VARCHAR(10) COMMENT '理应结业月份(对应徒弟字段)',
    DELAY_MONTH       VARCHAR(10) COMMENT '延期结业月份(对应徒弟字段)',
    ACTUAL_MONTH      VARCHAR(10) COMMENT '实际结业月份(对应徒弟字段)',
    ALLOWANCE_RATIO   INT COMMENT '结业津贴比例',
    AMOUNT            DECIMAL COMMENT '带教津贴金额',
    VERSION_NUM       INT(11)  DEFAULT 0 COMMENT '版本号',
    CREATION_DATE     DATETIME DEFAULT NOW() NOT NULL COMMENT '创建时间',
    CREATED_BY        INT(11)  DEFAULT -1    NOT NULL COMMENT '创建人',
    LAST_UPDATED_BY   INT(11)  DEFAULT -1    NOT NULL COMMENT '最后修改人',
    LAST_UPDATE_DATE  DATETIME DEFAULT NOW() NOT NULL COMMENT '最后修改时间',
    LAST_UPDATE_LOGIN INT(11) COMMENT '最后登录人',
    PRIMARY KEY (MMD_ID),
    KEY IDX_M_USER_ID (M_USER_ID),
    KEY IDX_M_CITY_ID (M_CITY_ID),
    KEY IDX_D_USER_ID (D_USER_ID),
    KEY IDX_D_CITY_ID (D_CITY_ID)
)
    ENGINE = InnoDB
    AUTO_INCREMENT = 16
    DEFAULT CHARSET = utf8
    COMMENT '师徒关系表';

-- 创建师父年收益情况表
DROP TABLE IF EXISTS MD_MASTER_ANNUAL_EARNINGS;
CREATE TABLE MD_MASTER_ANNUAL_EARNINGS
(
    MMAE_ID           INT(11)                NOT NULL AUTO_INCREMENT COMMENT 'ID',
    YEAR              VARCHAR(10)            NOT NULL COMMENT '年份',
    CITY_ID           INT(11) COMMENT '城市ID',
    CITY_NAME         VARCHAR(255) COMMENT '城市名',
    USER_ID           INT(11) COMMENT '师父ID',
    USER_NAME         VARCHAR(255) COMMENT '师父姓名',
    SKILL             VARCHAR(255) COMMENT '技能专长',
    ENTRY_TIME        DATETIME COMMENT '入职时间',
    START_TIME        DATETIME COMMENT '成师时间',
    TEACH_COUNT       INT(11) COMMENT '当年带教人数',
    GRADUATION_COUNT  INT(11) COMMENT '当年结业人数',
    TEACH_AMOUNT      DECIMAL COMMENT '年度带教总津贴',
    LEVEL1_AMOUNT     DECIMAL COMMENT '年度一代结业津贴',
    LEVEL2_AMOUNT     DECIMAL COMMENT '年度二代结业津贴',
    VERSION_NUM       INT(11)  DEFAULT 0 COMMENT '版本号',
    CREATION_DATE     DATETIME DEFAULT NOW() NOT NULL COMMENT '创建时间',
    CREATED_BY        INT(11)  DEFAULT -1    NOT NULL COMMENT '创建人',
    LAST_UPDATED_BY   INT(11)  DEFAULT -1    NOT NULL COMMENT '最后修改人',
    LAST_UPDATE_DATE  DATETIME DEFAULT NOW() NOT NULL COMMENT '最后修改时间',
    LAST_UPDATE_LOGIN INT(11) COMMENT '最后登录人',
    PRIMARY KEY (MMAE_ID),
    KEY IDX_CITY_ID (CITY_ID),
    KEY IDX_USER_ID (USER_ID)
)
    ENGINE = InnoDB
    AUTO_INCREMENT = 26
    DEFAULT CHARSET = utf8
    COMMENT '师父年收益情况';

-- 创建城市人员月份计件金额表(只统计已结业的人员)
DROP TABLE IF EXISTS MD_CITY_USER_AMOUNT;
CREATE TABLE MD_CITY_USER_AMOUNT
(
    MCUA_ID           INT(11)                NOT NULL AUTO_INCREMENT COMMENT 'ID',
    CITY_ID           INT(11)                NOT NULL COMMENT '城市ID',
    VALUE_MONTH       VARCHAR(10) COMMENT '月',
    USER_ID           INT(11)                NOT NULL COMMENT '人员',
    AMOUNT            DECIMAL COMMENT '当月计件金额',
    VERSION_NUM       INT(11)  DEFAULT 0 COMMENT '版本号',
    CREATION_DATE     DATETIME DEFAULT NOW() NOT NULL COMMENT '创建时间',
    CREATED_BY        INT(11)  DEFAULT -1    NOT NULL COMMENT '创建人',
    LAST_UPDATED_BY   INT(11)  DEFAULT -1    NOT NULL COMMENT '最后修改人',
    LAST_UPDATE_DATE  DATETIME DEFAULT NOW() NOT NULL COMMENT '最后修改时间',
    LAST_UPDATE_LOGIN INT(11) COMMENT '最后登录人',
    PRIMARY KEY (MCUA_ID),
    KEY IDX_CITY_ID (CITY_ID),
    KEY IDX_USER_ID (USER_ID)
)
    ENGINE = InnoDB
    AUTO_INCREMENT = 36
    DEFAULT CHARSET = utf8
    COMMENT '城市人员月份计件金额表(只统计已结业的人员)';
