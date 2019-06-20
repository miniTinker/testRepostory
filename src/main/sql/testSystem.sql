-- 数据库初始化脚本

-- 创建数据库
CREATE DATABASE IF NOT EXISTS vrrg;

-- 使用数据库
USE vrrg;

-- 创建选择题表
DROP TABLE IF EXISTS ks_choice_question;
CREATE TABLE ks_choice_question (
  cq_id             INT(11)                NOT NULL AUTO_INCREMENT
  COMMENT 'id',
  answer            VARCHAR(20)            NOT NULL
  COMMENT '正确答案',
  content           VARCHAR(400)           NOT NULL
  COMMENT '题目',
  contributor       INT(11) COMMENT '题目提供者',
  description       VARCHAR(400) COMMENT '题目解析',
  choice_a          VARCHAR(255) COMMENT '选项A',
  choice_b          VARCHAR(255) COMMENT '选项B',
  choice_c          VARCHAR(255) COMMENT '选项C',
  choice_d          VARCHAR(255) COMMENT '选项D',
  choice_e          VARCHAR(255) COMMENT '选项E',
  choice_f          VARCHAR(255) COMMENT '选项F',
  choice_g          VARCHAR(255) COMMENT '选项G',
  choice_h          VARCHAR(255) COMMENT '选项H',
  knowledge_point   VARCHAR(255) COMMENT '知识点',
  type              VARCHAR(255) COMMENT '类型(单选RADIO，多选MULTI_SELECT)',
  source            VARCHAR(255) COMMENT '来源(导入IMPORT，手工录入MANUALLY）',
  VERSION_NUM       INT(11)                         DEFAULT 0
  COMMENT '版本号',
  CREATION_DATE     DATETIME DEFAULT NOW() NOT NULL
  COMMENT '创建时间',
  CREATED_BY        INT(11) DEFAULT -1     NOT NULL
  COMMENT '创建人',
  LAST_UPDATED_BY   INT(11) DEFAULT -1     NOT NULL
  COMMENT '最后修改人',
  LAST_UPDATE_DATE  DATETIME DEFAULT NOW() NOT NULL
  COMMENT '最后修改时间',
  LAST_UPDATE_LOGIN INT(11) COMMENT '最后登录人',
  PRIMARY KEY (cq_id)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 11
  DEFAULT CHARSET = utf8
  COMMENT '选择题表';

-- 创建判断题表
DROP TABLE IF EXISTS ks_judge_quesion;
CREATE TABLE ks_judge_quesion (
  jq_id             INT(11)                NOT NULL AUTO_INCREMENT
  COMMENT 'id',
  answer            VARCHAR(20)            NOT NULL
  COMMENT '正确答案',
  content           VARCHAR(20)            NOT NULL
  COMMENT '题目',
  contributor       INT(11) COMMENT '题目提供者',
  description       VARCHAR(400) COMMENT '题目解析',
  knowledge_point   VARCHAR(255) COMMENT '知识点',
  source            VARCHAR(255) COMMENT '来源(导入IMPORT，手工录入MANUALLY）',
  VERSION_NUM       INT(11)                         DEFAULT 0
  COMMENT '版本号',
  CREATION_DATE     DATETIME DEFAULT NOW() NOT NULL
  COMMENT '创建时间',
  CREATED_BY        INT(11) DEFAULT -1     NOT NULL
  COMMENT '创建人',
  LAST_UPDATED_BY   INT(11) DEFAULT -1     NOT NULL
  COMMENT '最后修改人',
  LAST_UPDATE_DATE  DATETIME DEFAULT NOW() NOT NULL
  COMMENT '最后修改时间',
  LAST_UPDATE_LOGIN INT(11) COMMENT '最后登录人',
  PRIMARY KEY (jq_id)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 21
  DEFAULT CHARSET = utf8
  COMMENT '判断题表';

-- 创建试卷头表
DROP TABLE IF EXISTS ks_exam;
CREATE TABLE ks_exam (
  e_id              INT(11)                NOT NULL AUTO_INCREMENT
  COMMENT 'id',
  name              VARCHAR(200)           NOT NULL
  COMMENT '试卷名',
  detail            VARCHAR(400) COMMENT '试卷描述',
  type              VARCHAR(255)           NOT NULL
  COMMENT '组卷类型(随机RANDOM,手动MANUAL)',
  VERSION_NUM       INT(11)                         DEFAULT 0
  COMMENT '版本号',
  CREATION_DATE     DATETIME DEFAULT NOW() NOT NULL
  COMMENT '创建时间',
  CREATED_BY        INT(11) DEFAULT -1     NOT NULL
  COMMENT '创建人',
  LAST_UPDATED_BY   INT(11) DEFAULT -1     NOT NULL
  COMMENT '最后修改人',
  LAST_UPDATE_DATE  DATETIME DEFAULT NOW() NOT NULL
  COMMENT '最后修改时间',
  LAST_UPDATE_LOGIN INT(11) COMMENT '最后登录人',
  PRIMARY KEY (e_id)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 31
  DEFAULT CHARSET = utf8
  COMMENT '试卷头表';

-- 创建试卷明细表
DROP TABLE IF EXISTS ks_exam_detail;
CREATE TABLE ks_exam_detail (
  ed_id              INT(11)                NOT NULL AUTO_INCREMENT
  COMMENT 'id',
  question_type      VARCHAR(255) COMMENT '问题类型(单选RADIO，多选MULTI_SELECT,判断JUDGE)',
  choice_question_id INT(11) COMMENT '选择题id',
  judge_question_id  INT(11) COMMENT '判断题id',
  exam_id            INT(11)                NOT NULL
  COMMENT '头表id',
  score              FLOAT(3, 2)                     DEFAULT 0.00
  COMMENT '分数',
  VERSION_NUM        INT(11)                         DEFAULT 0
  COMMENT '版本号',
  CREATION_DATE      DATETIME DEFAULT NOW() NOT NULL
  COMMENT '创建时间',
  CREATED_BY         INT(11) DEFAULT -1     NOT NULL
  COMMENT '创建人',
  LAST_UPDATED_BY    INT(11) DEFAULT -1     NOT NULL
  COMMENT '最后修改人',
  LAST_UPDATE_DATE   DATETIME DEFAULT NOW() NOT NULL
  COMMENT '最后修改时间',
  LAST_UPDATE_LOGIN  INT(11) COMMENT '最后登录人',
  PRIMARY KEY (ed_id),
  FOREIGN KEY (choice_question_id) REFERENCES ks_choice_question (cq_id),
  FOREIGN KEY (judge_question_id) REFERENCES ks_judge_quesion (jq_id),
  FOREIGN KEY (exam_id) REFERENCES ks_exam (e_id),
  KEY idx_choice_question_id(choice_question_id),
  KEY idx_judge_question_id(judge_question_id),
  KEY idx_exam_id(exam_id)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 41
  DEFAULT CHARSET = utf8
  COMMENT '试卷明细表';

-- 创建人员试卷关联表
DROP TABLE IF EXISTS ks_user_exam;
CREATE TABLE ks_user_exam (
  ue_id             INT(11)                NOT NULL AUTO_INCREMENT
  COMMENT 'id',
  user_id           INT(11)                NOT NULL
  COMMENT '用户id',
  exam_id           INT(11)                NOT NULL
  COMMENT '试卷头表id',
  score             FLOAT(3, 2)                     DEFAULT 0.00
  COMMENT '总得分',
  status            VARCHAR(255) COMMENT '状态(未考试NEW,考试中HASING,已考试HAS)',
  VERSION_NUM       INT(11)                         DEFAULT 0
  COMMENT '版本号',
  CREATION_DATE     DATETIME DEFAULT NOW() NOT NULL
  COMMENT '创建时间',
  CREATED_BY        INT(11) DEFAULT -1     NOT NULL
  COMMENT '创建人',
  LAST_UPDATED_BY   INT(11) DEFAULT -1     NOT NULL
  COMMENT '最后修改人',
  LAST_UPDATE_DATE  DATETIME DEFAULT NOW() NOT NULL
  COMMENT '最后修改时间',
  LAST_UPDATE_LOGIN INT(11) COMMENT '最后登录人',
  PRIMARY KEY (ue_id),
  FOREIGN KEY (exam_id) REFERENCES ks_exam (e_id),
  KEY idx_user_id(user_id),
  KEY idx_exam_id(exam_id)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 51
  DEFAULT CHARSET = utf8
  COMMENT '人员试卷关联表';

-- 创建人员答题表
DROP TABLE IF EXISTS ks_user_answer;
CREATE TABLE ks_user_answer (
  ua_id             INT(11)                NOT NULL AUTO_INCREMENT
  COMMENT 'id',
  user_exam_id      INT(11)                NOT NULL
  COMMENT '人员试卷关联id',
  user_id           INT(11)                NOT NULL
  COMMENT '用户id',
  exam_detail_id    INT(11)                NOT NULL
  COMMENT '试卷明细id',
  answer            VARCHAR(20) COMMENT '答案',
  y_or_n            VARCHAR(2) COMMENT '答案是否正确"Y","N"',
  VERSION_NUM       INT(11)                         DEFAULT 0
  COMMENT '版本号',
  CREATION_DATE     DATETIME DEFAULT NOW() NOT NULL
  COMMENT '创建时间',
  CREATED_BY        INT(11) DEFAULT -1     NOT NULL
  COMMENT '创建人',
  LAST_UPDATED_BY   INT(11) DEFAULT -1     NOT NULL
  COMMENT '最后修改人',
  LAST_UPDATE_DATE  DATETIME DEFAULT NOW() NOT NULL
  COMMENT '最后修改时间',
  LAST_UPDATE_LOGIN INT(11) COMMENT '最后登录人',
  PRIMARY KEY (ua_id),
  FOREIGN KEY (user_exam_id) REFERENCES ks_user_exam (ue_id),
  FOREIGN KEY (exam_detail_id) REFERENCES ks_exam_detail (ed_id),
  KEY idx_user_id(user_id),
  KEY idx_user_exam_id(user_exam_id),
  KEY idx_exam_detail_id(exam_detail_id)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 61
  DEFAULT CHARSET = utf8
  COMMENT '人员答题表';
