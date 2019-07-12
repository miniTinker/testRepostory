-- 数据库初始化脚本
-- 人才盘点相关表

-- 创建数据库
CREATE DATABASE IF NOT EXISTS vrrg;

-- 使用数据库
USE vrrg;

-- 关闭外键校验
set foreign_key_checks = 0;

-- 创建业绩指标库表
DROP TABLE IF EXISTS PD_INDEX_LIBRARY;
CREATE TABLE PD_INDEX_LIBRARY
(
    PIL_ID            INT(11)                NOT NULL AUTO_INCREMENT COMMENT 'ID',
    NAME              VARCHAR(255)           NOT NULL COMMENT '业绩指标名称',
    SQL_VAL           TEXT COMMENT '业绩指标取值SQL',
    START_ACTIVE_TIME DATETIME COMMENT '生效时间',
    END_ACTIVE_TIME   DATETIME COMMENT '失效时间',
    VERSION_NUM       INT(11)  DEFAULT 0 COMMENT '版本号',
    CREATION_DATE     DATETIME DEFAULT NOW() NOT NULL COMMENT '创建时间',
    CREATED_BY        INT(11)  DEFAULT -1    NOT NULL COMMENT '创建人',
    LAST_UPDATED_BY   INT(11)  DEFAULT -1    NOT NULL COMMENT '最后修改人',
    LAST_UPDATE_DATE  DATETIME DEFAULT NOW() NOT NULL COMMENT '最后修改时间',
    LAST_UPDATE_LOGIN INT(11) COMMENT '最后登录人',
    PRIMARY KEY (PIL_ID),
    UNIQUE KEY IDX_NAME (NAME)
)
    ENGINE = InnoDB
    AUTO_INCREMENT = 11
    DEFAULT CHARSET = utf8
    COMMENT '业绩指标库表';

-- 创建岗位指标库关联表
DROP TABLE IF EXISTS PD_JOB_INDEX;
CREATE TABLE PD_JOB_INDEX
(
    PJI_ID            INT(11)                NOT NULL AUTO_INCREMENT COMMENT 'ID',
    PJC_ID            INT(11)                NOT NULL COMMENT '岗位ID',
    PIL_ID            INT(11)                NOT NULL COMMENT '业绩指标ID',
    START_ACTIVE_TIME DATETIME COMMENT '生效时间',
    END_ACTIVE_TIME   DATETIME COMMENT '失效时间',
    VERSION_NUM       INT(11)  DEFAULT 0 COMMENT '版本号',
    CREATION_DATE     DATETIME DEFAULT NOW() NOT NULL COMMENT '创建时间',
    CREATED_BY        INT(11)  DEFAULT -1    NOT NULL COMMENT '创建人',
    LAST_UPDATED_BY   INT(11)  DEFAULT -1    NOT NULL COMMENT '最后修改人',
    LAST_UPDATE_DATE  DATETIME DEFAULT NOW() NOT NULL COMMENT '最后修改时间',
    LAST_UPDATE_LOGIN INT(11) COMMENT '最后登录人',
    PRIMARY KEY (PJI_ID),
    KEY IDX_PJC_ID (PJC_ID),
    KEY IDX_PIL_ID (PIL_ID)
)
    ENGINE = InnoDB
    AUTO_INCREMENT = 21
    DEFAULT CHARSET = utf8
    COMMENT '岗位指标库关联表';

-- 创建价值贡献指标库表
DROP TABLE IF EXISTS PD_VALUE_INDEX;
CREATE TABLE PD_VALUE_INDEX
(
    PVI_ID            INT(11)                NOT NULL AUTO_INCREMENT COMMENT 'ID',
    NAME              VARCHAR(255)           NOT NULL COMMENT '价值贡献指标名称',
    SCORE             FLOAT(6, 2)            NOT NULL COMMENT '标准分值',
    START_ACTIVE_TIME DATETIME COMMENT '生效时间',
    END_ACTIVE_TIME   DATETIME COMMENT '失效时间',
    VERSION_NUM       INT(11)  DEFAULT 0 COMMENT '版本号',
    CREATION_DATE     DATETIME DEFAULT NOW() NOT NULL COMMENT '创建时间',
    CREATED_BY        INT(11)  DEFAULT -1    NOT NULL COMMENT '创建人',
    LAST_UPDATED_BY   INT(11)  DEFAULT -1    NOT NULL COMMENT '最后修改人',
    LAST_UPDATE_DATE  DATETIME DEFAULT NOW() NOT NULL COMMENT '最后修改时间',
    LAST_UPDATE_LOGIN INT(11) COMMENT '最后登录人',
    PRIMARY KEY (PVI_ID),
    UNIQUE KEY IDX_NAME (NAME)
)
    ENGINE = InnoDB
    AUTO_INCREMENT = 31
    DEFAULT CHARSET = utf8
    COMMENT '价值贡献指标库表';

-- 创建价值贡献导入头表
DROP TABLE IF EXISTS PD_VALUE_HEAD;
CREATE TABLE PD_VALUE_HEAD
(
    PVH_ID            INT(11)                NOT NULL AUTO_INCREMENT COMMENT 'ID',
    CODE              VARCHAR(255)           NOT NULL COMMENT '导入编号',
    TITLE             VARCHAR(255) COMMENT '导入文件名称',
    VERSION_NUM       INT(11)  DEFAULT 0 COMMENT '版本号',
    CREATION_DATE     DATETIME DEFAULT NOW() NOT NULL COMMENT '创建时间',
    CREATED_BY        INT(11)  DEFAULT -1    NOT NULL COMMENT '创建人',
    LAST_UPDATED_BY   INT(11)  DEFAULT -1    NOT NULL COMMENT '最后修改人',
    LAST_UPDATE_DATE  DATETIME DEFAULT NOW() NOT NULL COMMENT '最后修改时间',
    LAST_UPDATE_LOGIN INT(11) COMMENT '最后登录人',
    PRIMARY KEY (PVH_ID)
)
    ENGINE = InnoDB
    AUTO_INCREMENT = 41
    DEFAULT CHARSET = utf8
    COMMENT '价值贡献导入头表';

-- 创建人才盘点表
DROP TABLE IF EXISTS PD_PROCESS;
CREATE TABLE PD_PROCESS
(
    PP_ID             INT(11)                NOT NULL AUTO_INCREMENT COMMENT 'ID',
    CODE              VARCHAR(255)           NOT NULL COMMENT '盘点编号',
    NAME              VARCHAR(255) COMMENT '盘点名称',
    PJC_ID            INT(11)                NOT NULL COMMENT '岗位ID',
    CITY_ID           INT(11) COMMENT '城市ID',
    START_ACTIVE_TIME DATETIME COMMENT '生效时间',
    END_ACTIVE_TIME   DATETIME COMMENT '失效时间',
    VERSION_NUM       INT(11)  DEFAULT 0 COMMENT '版本号',
    CREATION_DATE     DATETIME DEFAULT NOW() NOT NULL COMMENT '创建时间',
    CREATED_BY        INT(11)  DEFAULT -1    NOT NULL COMMENT '创建人',
    LAST_UPDATED_BY   INT(11)  DEFAULT -1    NOT NULL COMMENT '最后修改人',
    LAST_UPDATE_DATE  DATETIME DEFAULT NOW() NOT NULL COMMENT '最后修改时间',
    LAST_UPDATE_LOGIN INT(11) COMMENT '最后登录人',
    PRIMARY KEY (PP_ID),
    KEY IDX_PJC_ID (PJC_ID),
    KEY IDX_CITY_ID (CITY_ID)
)
    ENGINE = InnoDB
    AUTO_INCREMENT = 51
    DEFAULT CHARSET = utf8
    COMMENT '人才盘点表';

-- 创建被盘点人表
DROP TABLE IF EXISTS PD_PROCESS_USER;
CREATE TABLE PD_PROCESS_USER
(
    PPU_ID            INT(11)                NOT NULL AUTO_INCREMENT COMMENT 'ID',
    PP_ID             INT(11)                NOT NULL COMMENT '人才盘点表ID',
    USER_ID           INT(11)                NOT NULL COMMENT '用户ID',
    VERSION_NUM       INT(11)  DEFAULT 0 COMMENT '版本号',
    CREATION_DATE     DATETIME DEFAULT NOW() NOT NULL COMMENT '创建时间',
    CREATED_BY        INT(11)  DEFAULT -1    NOT NULL COMMENT '创建人',
    LAST_UPDATED_BY   INT(11)  DEFAULT -1    NOT NULL COMMENT '最后修改人',
    LAST_UPDATE_DATE  DATETIME DEFAULT NOW() NOT NULL COMMENT '最后修改时间',
    LAST_UPDATE_LOGIN INT(11) COMMENT '最后登录人',
    PRIMARY KEY (PPU_ID),
    FOREIGN KEY (PP_ID) REFERENCES PD_PROCESS (PP_ID),
    KEY IDX_PP_ID (PP_ID),
    KEY IDX_USER_ID (USER_ID)
)
    ENGINE = InnoDB
    AUTO_INCREMENT = 61
    DEFAULT CHARSET = utf8
    COMMENT '被盘点人表';

-- 创建盘点岗位业绩目标设置表
DROP TABLE IF EXISTS PD_PROCESS_INDEX;
CREATE TABLE PD_PROCESS_INDEX
(
    PPI_ID            INT(11)                NOT NULL AUTO_INCREMENT COMMENT 'ID',
    PP_ID             INT(11)                NOT NULL COMMENT '人才盘点表ID',
    PIL_ID            INT(11)                NOT NULL COMMENT '业绩指标ID',
    TARGET            DECIMAL  DEFAULT 0 COMMENT '业绩目标值',
    RATIO             FLOAT(6, 2) COMMENT '业绩占比',
    VERSION_NUM       INT(11)  DEFAULT 0 COMMENT '版本号',
    CREATION_DATE     DATETIME DEFAULT NOW() NOT NULL COMMENT '创建时间',
    CREATED_BY        INT(11)  DEFAULT -1    NOT NULL COMMENT '创建人',
    LAST_UPDATED_BY   INT(11)  DEFAULT -1    NOT NULL COMMENT '最后修改人',
    LAST_UPDATE_DATE  DATETIME DEFAULT NOW() NOT NULL COMMENT '最后修改时间',
    LAST_UPDATE_LOGIN INT(11) COMMENT '最后登录人',
    PRIMARY KEY (PPI_ID),
    FOREIGN KEY (PP_ID) REFERENCES PD_PROCESS (PP_ID),
    FOREIGN KEY (PIL_ID) REFERENCES PD_INDEX_LIBRARY (PIL_ID),
    KEY IDX_PP_ID (PP_ID),
    KEY IDX_PIL_ID (PIL_ID)
)
    ENGINE = InnoDB
    AUTO_INCREMENT = 71
    DEFAULT CHARSET = utf8
    COMMENT '盘点岗位业绩目标设置表';

-- 创建盘点维度设置表
DROP TABLE IF EXISTS PD_PROCESS_DIMENSION;
CREATE TABLE PD_PROCESS_DIMENSION
(
    PPD_ID            INT(11)                NOT NULL AUTO_INCREMENT COMMENT 'ID',
    PP_ID             INT(11)                NOT NULL COMMENT '人才盘点表ID',
    DIMENSION         VARCHAR(255) COMMENT '维度',
    INDEX_NAME        VARCHAR(255) COMMENT '指标',
    RATIO             FLOAT(6, 2) COMMENT '业绩维度占比',
    DESCRIPTION       VARCHAR(255) COMMENT '盘点描述',
    VERSION_NUM       INT(11)  DEFAULT 0 COMMENT '版本号',
    CREATION_DATE     DATETIME DEFAULT NOW() NOT NULL COMMENT '创建时间',
    CREATED_BY        INT(11)  DEFAULT -1    NOT NULL COMMENT '创建人',
    LAST_UPDATED_BY   INT(11)  DEFAULT -1    NOT NULL COMMENT '最后修改人',
    LAST_UPDATE_DATE  DATETIME DEFAULT NOW() NOT NULL COMMENT '最后修改时间',
    LAST_UPDATE_LOGIN INT(11) COMMENT '最后登录人',
    PRIMARY KEY (PPD_ID),
    FOREIGN KEY (PP_ID) REFERENCES PD_PROCESS (PP_ID),
    KEY IDX_PP_ID (PP_ID)
)
    ENGINE = InnoDB
    AUTO_INCREMENT = 81
    DEFAULT CHARSET = utf8
    COMMENT '盘点维度设置表';

-- 创建盘点结果表
DROP TABLE IF EXISTS PD_RESULT;
CREATE TABLE PD_RESULT
(
    PR_ID             INT(11)                NOT NULL AUTO_INCREMENT COMMENT 'ID',
    PP_ID             INT(11)                NOT NULL COMMENT '人才盘点表ID',
    CITY_ID           INT(11) COMMENT '城市ID',
    CITY_NAME         VARCHAR(255) COMMENT '城市名',
    USER_ID           INT(11) COMMENT '用户ID',
    USER_NAME         VARCHAR(255) COMMENT '用户名',
    PJC_ID            INT(11) COMMENT '岗位ID',
    JOB_NAME          VARCHAR(255) COMMENT '当前岗位',
    INDEX_SCORE       FLOAT(6, 2) COMMENT '业绩指标',
    KPI_SCORE         FLOAT(6, 2) COMMENT '人员KPI',
    PERFORMANCE_SCORE FLOAT(6, 2) COMMENT '业绩得分',
    PERFORMANCE_RANK  DECIMAL(22, 2) COMMENT '业绩排名',
    PERFORMANCE_LEVEL VARCHAR(255) COMMENT '业绩评优快码(PD_LEVEL)',
    TASK_SCORE        FLOAT(6, 2) COMMENT '任务评价',
    VERTICAL_SCORE    FLOAT(6, 2) COMMENT '上下游评价',
    VALUE_SCORE       FLOAT(6, 2) COMMENT '价值贡献',
    QUALITY_SCORE     FLOAT(6, 2) COMMENT '素质得分',
    QUALITY_RANK      DECIMAL(22, 2) COMMENT '素质排名',
    QUALITY_LEVEL     VARCHAR(255) COMMENT '素质评优快码(PD_LEVEL)',
    CURRENT_POSITION  int(11) COMMENT '当前所属宫格',
    VERSION_NUM       INT(11)  DEFAULT 0 COMMENT '版本号',
    CREATION_DATE     DATETIME DEFAULT NOW() NOT NULL COMMENT '创建时间',
    CREATED_BY        INT(11)  DEFAULT -1    NOT NULL COMMENT '创建人',
    LAST_UPDATED_BY   INT(11)  DEFAULT -1    NOT NULL COMMENT '最后修改人',
    LAST_UPDATE_DATE  DATETIME DEFAULT NOW() NOT NULL COMMENT '最后修改时间',
    LAST_UPDATE_LOGIN INT(11) COMMENT '最后登录人',
    PRIMARY KEY (PR_ID),
    FOREIGN KEY (PP_ID) REFERENCES PD_PROCESS (PP_ID),
    KEY IDX_PP_ID (PP_ID),
    KEY IDX_CITY_ID (CITY_ID),
    KEY IDX_USER_ID (USER_ID),
    KEY IDX_PJC_ID (PJC_ID)
)
    ENGINE = InnoDB
    AUTO_INCREMENT = 91
    DEFAULT CHARSET = utf8
    COMMENT '盘点结果表';
