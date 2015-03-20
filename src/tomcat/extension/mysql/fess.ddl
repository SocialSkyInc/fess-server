DROP TABLE IF EXISTS FAVORITE_LOG;
DROP TABLE IF EXISTS SEARCH_FIELD_LOG;
DROP TABLE IF EXISTS FILE_AUTHENTICATION;
DROP TABLE IF EXISTS FAILURE_URL;
DROP TABLE IF EXISTS CLICK_LOG;
DROP TABLE IF EXISTS LABEL_TYPE_TO_ROLE_TYPE_MAPPING;
DROP TABLE IF EXISTS SEARCH_LOG;
DROP TABLE IF EXISTS USER_INFO;
DROP TABLE IF EXISTS DATA_CONFIG_TO_BROWSER_TYPE_MAPPING;
DROP TABLE IF EXISTS DATA_CONFIG_TO_LABEL_TYPE_MAPPING;
DROP TABLE IF EXISTS DATA_CONFIG_TO_ROLE_TYPE_MAPPING;
DROP TABLE IF EXISTS DATA_CRAWLING_CONFIG;
DROP TABLE IF EXISTS WEB_CONFIG_TO_ROLE_TYPE_MAPPING;
DROP TABLE IF EXISTS FILE_CONFIG_TO_ROLE_TYPE_MAPPING;
DROP TABLE IF EXISTS ROLE_TYPE;
DROP TABLE IF EXISTS WEB_CONFIG_TO_LABEL_TYPE_MAPPING;
DROP TABLE IF EXISTS FILE_CONFIG_TO_LABEL_TYPE_MAPPING;
DROP TABLE IF EXISTS LABEL_TYPE;
DROP TABLE IF EXISTS CRAWLING_SESSION_INFO;
DROP TABLE IF EXISTS WEB_AUTHENTICATION;
DROP TABLE IF EXISTS KEY_MATCH;
DROP TABLE IF EXISTS BOOST_DOCUMENT_RULE;
DROP TABLE IF EXISTS REQUEST_HEADER;
DROP TABLE IF EXISTS OVERLAPPING_HOST;
DROP TABLE IF EXISTS CRAWLING_SESSION;
DROP TABLE IF EXISTS PATH_MAPPING;
DROP TABLE IF EXISTS JOB_LOG;
DROP TABLE IF EXISTS SCHEDULED_JOB;
DROP TABLE IF EXISTS FILE_CONFIG_TO_BROWSER_TYPE_MAPPING;
DROP TABLE IF EXISTS WEB_CONFIG_TO_BROWSER_TYPE_MAPPING;
DROP TABLE IF EXISTS FILE_CRAWLING_CONFIG;
DROP TABLE IF EXISTS BROWSER_TYPE;
DROP TABLE IF EXISTS WEB_CRAWLING_CONFIG;
DROP TABLE IF EXISTS SUGGEST_BAD_WORD;
DROP TABLE IF EXISTS SUGGEST_ELAVATE_WORD;

/**********************************/
/* Table Name: Web Crawling Config */
/**********************************/
CREATE TABLE WEB_CRAWLING_CONFIG(
  ID BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  NAME VARCHAR(200) NOT NULL,
  URLS TEXT NOT NULL,
  INCLUDED_URLS TEXT,
  EXCLUDED_URLS TEXT,
  INCLUDED_DOC_URLS TEXT,
  EXCLUDED_DOC_URLS TEXT,
  CONFIG_PARAMETER TEXT,
  DEPTH INTEGER,
  MAX_ACCESS_COUNT BIGINT,
  USER_AGENT VARCHAR(200) NOT NULL,
  NUM_OF_THREAD INTEGER NOT NULL,
  INTERVAL_TIME INTEGER NOT NULL,
  BOOST FLOAT NOT NULL,
  AVAILABLE VARCHAR(1) NOT NULL,
  SORT_ORDER INTEGER NOT NULL,
  CREATED_BY VARCHAR(255) NOT NULL,
  CREATED_TIME TIMESTAMP NOT NULL,
  UPDATED_BY VARCHAR(255),
  UPDATED_TIME TIMESTAMP,
  DELETED_BY VARCHAR(255),
  DELETED_TIME TIMESTAMP,
  VERSION_NO INTEGER NOT NULL
);

/**********************************/
/* Table Name: File Crawling Config */
/**********************************/
CREATE TABLE FILE_CRAWLING_CONFIG(
  ID BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  NAME VARCHAR(200) NOT NULL,
  PATHS TEXT NOT NULL,
  INCLUDED_PATHS TEXT,
  EXCLUDED_PATHS TEXT,
  INCLUDED_DOC_PATHS TEXT,
  EXCLUDED_DOC_PATHS TEXT,
  CONFIG_PARAMETER TEXT,
  DEPTH INTEGER,
  MAX_ACCESS_COUNT BIGINT,
  NUM_OF_THREAD INTEGER NOT NULL,
  INTERVAL_TIME INTEGER NOT NULL,
  BOOST FLOAT NOT NULL,
  AVAILABLE VARCHAR(1) NOT NULL,
  SORT_ORDER INTEGER NOT NULL,
  CREATED_BY VARCHAR(255) NOT NULL,
  CREATED_TIME TIMESTAMP NOT NULL,
  UPDATED_BY VARCHAR(255),
  UPDATED_TIME TIMESTAMP,
  DELETED_BY VARCHAR(255),
  DELETED_TIME TIMESTAMP,
  VERSION_NO INTEGER NOT NULL
);

/**********************************/
/* Table Name: Scheduled Job */
/**********************************/
CREATE TABLE SCHEDULED_JOB(
  ID BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  NAME VARCHAR(100) NOT NULL,
  TARGET VARCHAR(100) NOT NULL,
  CRON_EXPRESSION VARCHAR(100) NOT NULL,
  SCRIPT_TYPE VARCHAR(100) NOT NULL,
  SCRIPT_DATA TEXT,
  CRAWLER VARCHAR(1) NOT NULL,
  JOB_LOGGING VARCHAR(1) NOT NULL,
  AVAILABLE VARCHAR(1) NOT NULL,
  SORT_ORDER INTEGER NOT NULL,
  CREATED_BY VARCHAR(255) NOT NULL,
  CREATED_TIME TIMESTAMP NOT NULL,
  UPDATED_BY VARCHAR(255),
  UPDATED_TIME TIMESTAMP,
  DELETED_BY VARCHAR(255),
  DELETED_TIME TIMESTAMP,
  VERSION_NO INTEGER NOT NULL
);

/**********************************/
/* Table Name: Job Log */
/**********************************/
CREATE TABLE JOB_LOG(
  ID BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  JOB_NAME VARCHAR(100) NOT NULL,
  JOB_STATUS VARCHAR(10) NOT NULL,
  TARGET VARCHAR(100) NOT NULL,
  SCRIPT_TYPE VARCHAR(100) NOT NULL,
  SCRIPT_DATA TEXT,
  SCRIPT_RESULT TEXT,
  START_TIME TIMESTAMP NOT NULL,
  END_TIME TIMESTAMP
);

/**********************************/
/* Table Name: Path Mapping */
/**********************************/
CREATE TABLE PATH_MAPPING(
  ID BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  REGEX TEXT NOT NULL,
  REPLACEMENT TEXT NOT NULL,
  PROCESS_TYPE VARCHAR(1) NOT NULL,
  SORT_ORDER INTEGER NOT NULL,
  CREATED_BY VARCHAR(255) NOT NULL,
  CREATED_TIME TIMESTAMP NOT NULL,
  UPDATED_BY VARCHAR(255),
  UPDATED_TIME TIMESTAMP,
  DELETED_BY VARCHAR(255),
  DELETED_TIME TIMESTAMP,
  VERSION_NO INTEGER NOT NULL
);

/**********************************/
/* Table Name: Crawling Session */
/**********************************/
CREATE TABLE CRAWLING_SESSION(
  ID BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  SESSION_ID VARCHAR(20) NOT NULL,
  NAME VARCHAR(20),
  EXPIRED_TIME TIMESTAMP,
  CREATED_TIME TIMESTAMP NOT NULL
);

/**********************************/
/* Table Name: Overlapping Host */
/**********************************/
CREATE TABLE OVERLAPPING_HOST(
  ID BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  REGULAR_NAME TEXT NOT NULL,
  OVERLAPPING_NAME TEXT NOT NULL,
  SORT_ORDER INTEGER NOT NULL,
  CREATED_BY VARCHAR(255) NOT NULL,
  CREATED_TIME TIMESTAMP NOT NULL,
  UPDATED_BY VARCHAR(255),
  UPDATED_TIME TIMESTAMP,
  DELETED_BY VARCHAR(255),
  DELETED_TIME TIMESTAMP,
  VERSION_NO INTEGER NOT NULL
);

/**********************************/
/* Table Name: Request Header */
/**********************************/
CREATE TABLE REQUEST_HEADER(
  ID BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  NAME VARCHAR(100) NOT NULL,
  VALUE TEXT NOT NULL,
  WEB_CRAWLING_CONFIG_ID BIGINT NOT NULL,
  CREATED_BY VARCHAR(255) NOT NULL,
  CREATED_TIME TIMESTAMP NOT NULL,
  UPDATED_BY VARCHAR(255),
  UPDATED_TIME TIMESTAMP,
  DELETED_BY VARCHAR(255),
  DELETED_TIME TIMESTAMP,
  VERSION_NO INTEGER NOT NULL,
  FOREIGN KEY (WEB_CRAWLING_CONFIG_ID) REFERENCES WEB_CRAWLING_CONFIG (ID)
);

/**********************************/
/* Table Name: Boost Document Rule */
/**********************************/
CREATE TABLE BOOST_DOCUMENT_RULE(
  ID BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  URL_EXPR TEXT NOT NULL,
  BOOST_EXPR TEXT NOT NULL,
  SORT_ORDER INTEGER NOT NULL,
  CREATED_BY VARCHAR(255) NOT NULL,
  CREATED_TIME TIMESTAMP NOT NULL,
  UPDATED_BY VARCHAR(255),
  UPDATED_TIME TIMESTAMP,
  DELETED_BY VARCHAR(255),
  DELETED_TIME TIMESTAMP,
  VERSION_NO INTEGER NOT NULL
);

/**********************************/
/* Table Name: Key Match */
/**********************************/
CREATE TABLE KEY_MATCH(
  ID BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  TERM VARCHAR(100) NOT NULL,
  QUERY TEXT NOT NULL,
  MAX_SIZE INTEGER NOT NULL,
  BOOST FLOAT NOT NULL,
  CREATED_BY VARCHAR(255) NOT NULL,
  CREATED_TIME TIMESTAMP NOT NULL,
  UPDATED_BY VARCHAR(255),
  UPDATED_TIME TIMESTAMP,
  DELETED_BY VARCHAR(255),
  DELETED_TIME TIMESTAMP,
  VERSION_NO INTEGER NOT NULL
);

/**********************************/
/* Table Name: Web Authentication */
/**********************************/
CREATE TABLE WEB_AUTHENTICATION(
  ID BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  HOSTNAME VARCHAR(100),
  PORT INTEGER NOT NULL,
  AUTH_REALM VARCHAR(100),
  PROTOCOL_SCHEME VARCHAR(10),
  USERNAME VARCHAR(100) NOT NULL,
  PASSWORD VARCHAR(100),
  PARAMETERS TEXT,
  WEB_CRAWLING_CONFIG_ID BIGINT NOT NULL,
  CREATED_BY VARCHAR(255) NOT NULL,
  CREATED_TIME TIMESTAMP NOT NULL,
  UPDATED_BY VARCHAR(255),
  UPDATED_TIME TIMESTAMP,
  DELETED_BY VARCHAR(255),
  DELETED_TIME TIMESTAMP,
  VERSION_NO INTEGER NOT NULL,
  FOREIGN KEY (WEB_CRAWLING_CONFIG_ID) REFERENCES WEB_CRAWLING_CONFIG (ID)
);

/**********************************/
/* Table Name: Crawling Session Info */
/**********************************/
CREATE TABLE CRAWLING_SESSION_INFO(
  ID BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  CRAWLING_SESSION_ID BIGINT NOT NULL,
  ID_KEY VARCHAR(20) NOT NULL,
  VALUE VARCHAR(100) NOT NULL,
  CREATED_TIME TIMESTAMP NOT NULL,
  FOREIGN KEY (CRAWLING_SESSION_ID) REFERENCES CRAWLING_SESSION (ID)
);

/**********************************/
/* Table Name: Label Type */
/**********************************/
CREATE TABLE LABEL_TYPE(
  ID BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  NAME VARCHAR(100) NOT NULL,
  VALUE VARCHAR(20) NOT NULL,
  INCLUDED_PATHS TEXT,
  EXCLUDED_PATHS TEXT,
  SORT_ORDER INTEGER NOT NULL,
  CREATED_BY VARCHAR(255) NOT NULL,
  CREATED_TIME TIMESTAMP NOT NULL,
  UPDATED_BY VARCHAR(255),
  UPDATED_TIME TIMESTAMP,
  DELETED_BY VARCHAR(255),
  DELETED_TIME TIMESTAMP,
  VERSION_NO INTEGER NOT NULL
);

/**********************************/
/* Table Name: File To Label Mapping */
/**********************************/
CREATE TABLE FILE_CONFIG_TO_LABEL_TYPE_MAPPING(
  ID BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  FILE_CONFIG_ID BIGINT NOT NULL,
  LABEL_TYPE_ID BIGINT NOT NULL,
  FOREIGN KEY (LABEL_TYPE_ID) REFERENCES LABEL_TYPE (ID),
  FOREIGN KEY (FILE_CONFIG_ID) REFERENCES FILE_CRAWLING_CONFIG (ID)
);

/**********************************/
/* Table Name: Web To Label Mapping */
/**********************************/
CREATE TABLE WEB_CONFIG_TO_LABEL_TYPE_MAPPING(
  ID BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  WEB_CONFIG_ID BIGINT NOT NULL,
  LABEL_TYPE_ID BIGINT NOT NULL,
  FOREIGN KEY (LABEL_TYPE_ID) REFERENCES LABEL_TYPE (ID),
  FOREIGN KEY (WEB_CONFIG_ID) REFERENCES WEB_CRAWLING_CONFIG (ID)
);

/**********************************/
/* Table Name: Role Type */
/**********************************/
CREATE TABLE ROLE_TYPE(
  ID BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  NAME VARCHAR(100) NOT NULL,
  VALUE VARCHAR(20) NOT NULL,
  SORT_ORDER INTEGER NOT NULL,
  CREATED_BY VARCHAR(255) NOT NULL,
  CREATED_TIME TIMESTAMP NOT NULL,
  UPDATED_BY VARCHAR(255),
  UPDATED_TIME TIMESTAMP,
  DELETED_BY VARCHAR(255),
  DELETED_TIME TIMESTAMP,
  VERSION_NO INTEGER NOT NULL
);

/**********************************/
/* Table Name: File To Role Mapping */
/**********************************/
CREATE TABLE FILE_CONFIG_TO_ROLE_TYPE_MAPPING(
  ID BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  FILE_CONFIG_ID BIGINT NOT NULL,
  ROLE_TYPE_ID BIGINT NOT NULL,
  FOREIGN KEY (FILE_CONFIG_ID) REFERENCES FILE_CRAWLING_CONFIG (ID),
  FOREIGN KEY (ROLE_TYPE_ID) REFERENCES ROLE_TYPE (ID)
);

/**********************************/
/* Table Name: Web To Role Mapping */
/**********************************/
CREATE TABLE WEB_CONFIG_TO_ROLE_TYPE_MAPPING(
  ID BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  WEB_CONFIG_ID BIGINT NOT NULL,
  ROLE_TYPE_ID BIGINT NOT NULL,
  FOREIGN KEY (WEB_CONFIG_ID) REFERENCES WEB_CRAWLING_CONFIG (ID),
  FOREIGN KEY (ROLE_TYPE_ID) REFERENCES ROLE_TYPE (ID)
);

/**********************************/
/* Table Name: Data Crawling Config */
/**********************************/
CREATE TABLE DATA_CRAWLING_CONFIG(
  ID BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  NAME VARCHAR(200) NOT NULL,
  HANDLER_NAME VARCHAR(200) NOT NULL,
  HANDLER_PARAMETER TEXT,
  HANDLER_SCRIPT TEXT,
  BOOST FLOAT NOT NULL,
  AVAILABLE VARCHAR(1) NOT NULL,
  SORT_ORDER INTEGER NOT NULL,
  CREATED_BY VARCHAR(255) NOT NULL,
  CREATED_TIME TIMESTAMP NOT NULL,
  UPDATED_BY VARCHAR(255),
  UPDATED_TIME TIMESTAMP,
  DELETED_BY VARCHAR(255),
  DELETED_TIME TIMESTAMP,
  VERSION_NO INTEGER NOT NULL
);

/**********************************/
/* Table Name: Data To Role Mapping */
/**********************************/
CREATE TABLE DATA_CONFIG_TO_ROLE_TYPE_MAPPING(
  ID BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  DATA_CONFIG_ID BIGINT NOT NULL,
  ROLE_TYPE_ID BIGINT NOT NULL,
  FOREIGN KEY (DATA_CONFIG_ID) REFERENCES DATA_CRAWLING_CONFIG (ID),
  FOREIGN KEY (ROLE_TYPE_ID) REFERENCES ROLE_TYPE (ID)
);

/**********************************/
/* Table Name: Data To Label Mapping */
/**********************************/
CREATE TABLE DATA_CONFIG_TO_LABEL_TYPE_MAPPING(
  ID BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  DATA_CONFIG_ID BIGINT NOT NULL,
  LABEL_TYPE_ID BIGINT NOT NULL,
  FOREIGN KEY (DATA_CONFIG_ID) REFERENCES DATA_CRAWLING_CONFIG (ID),
  FOREIGN KEY (LABEL_TYPE_ID) REFERENCES LABEL_TYPE (ID)
);

/**********************************/
/* Table Name: User Info */
/**********************************/
CREATE TABLE USER_INFO(
  ID BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  CODE TEXT NOT NULL,
  CREATED_TIME TIMESTAMP NOT NULL,
  UPDATED_TIME TIMESTAMP NOT NULL
);

/**********************************/
/* Table Name: Search Log */
/**********************************/
CREATE TABLE SEARCH_LOG(
  ID BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  SEARCH_WORD TEXT,
  REQUESTED_TIME TIMESTAMP NOT NULL,
  RESPONSE_TIME INTEGER NOT NULL,
  HIT_COUNT BIGINT NOT NULL,
  QUERY_OFFSET INTEGER NOT NULL,
  QUERY_PAGE_SIZE INTEGER NOT NULL,
  USER_AGENT VARCHAR(255),
  REFERER TEXT,
  CLIENT_IP VARCHAR(50),
  USER_SESSION_ID VARCHAR(100),
  ACCESS_TYPE VARCHAR(1) NOT NULL,
  USER_ID BIGINT,
  FOREIGN KEY (USER_ID) REFERENCES USER_INFO (ID)
);

/**********************************/
/* Table Name: Label Type To Role Type Mapping */
/**********************************/
CREATE TABLE LABEL_TYPE_TO_ROLE_TYPE_MAPPING(
  ID BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  LABEL_TYPE_ID BIGINT NOT NULL,
  ROLE_TYPE_ID BIGINT NOT NULL,
  FOREIGN KEY (LABEL_TYPE_ID) REFERENCES LABEL_TYPE (ID),
  FOREIGN KEY (ROLE_TYPE_ID) REFERENCES ROLE_TYPE (ID)
);

/**********************************/
/* Table Name: Click Log */
/**********************************/
CREATE TABLE CLICK_LOG(
  ID BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  SEARCH_ID BIGINT NOT NULL,
  URL TEXT NOT NULL,
  REQUESTED_TIME TIMESTAMP NOT NULL,
  FOREIGN KEY (SEARCH_ID) REFERENCES SEARCH_LOG (ID)
);

/**********************************/
/* Table Name: Failure Url */
/**********************************/
CREATE TABLE FAILURE_URL(
  ID BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  URL TEXT NOT NULL,
  THREAD_NAME VARCHAR(30) NOT NULL,
  ERROR_NAME VARCHAR(255),
  ERROR_LOG TEXT,
  ERROR_COUNT INTEGER NOT NULL,
  LAST_ACCESS_TIME TIMESTAMP NOT NULL,
  CONFIG_ID VARCHAR(100)
);

/**********************************/
/* Table Name: File Authentication */
/**********************************/
CREATE TABLE FILE_AUTHENTICATION(
  ID BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  HOSTNAME VARCHAR(255),
  PORT INTEGER NOT NULL,
  PROTOCOL_SCHEME VARCHAR(10),
  USERNAME VARCHAR(100) NOT NULL,
  PASSWORD VARCHAR(100),
  PARAMETERS TEXT,
  FILE_CRAWLING_CONFIG_ID BIGINT NOT NULL,
  CREATED_BY VARCHAR(255) NOT NULL,
  CREATED_TIME TIMESTAMP NOT NULL,
  UPDATED_BY VARCHAR(255),
  UPDATED_TIME TIMESTAMP,
  DELETED_BY VARCHAR(255),
  DELETED_TIME TIMESTAMP,
  VERSION_NO INTEGER NOT NULL,
  FOREIGN KEY (FILE_CRAWLING_CONFIG_ID) REFERENCES FILE_CRAWLING_CONFIG (ID)
);

/**********************************/
/* Table Name: Search Field Log */
/**********************************/
CREATE TABLE SEARCH_FIELD_LOG(
  ID BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  SEARCH_ID BIGINT NOT NULL,
  NAME VARCHAR(255) NOT NULL,
  VALUE TEXT NOT NULL,
  FOREIGN KEY (SEARCH_ID) REFERENCES SEARCH_LOG (ID)
);

/**********************************/
/* Table Name: Favorite Log */
/**********************************/
CREATE TABLE FAVORITE_LOG(
  ID BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  USER_ID BIGINT NOT NULL,
  URL TEXT NOT NULL,
  CREATED_TIME TIMESTAMP NOT NULL,
  FOREIGN KEY (USER_ID) REFERENCES USER_INFO (ID)
);

/**********************************/
/* Table Name: Suggest Ng Word */
/**********************************/
CREATE TABLE SUGGEST_BAD_WORD(
  ID BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  SUGGEST_WORD VARCHAR(255) NOT NULL,
  TARGET_ROLE VARCHAR(255),
  TARGET_LABEL VARCHAR(255),
  CREATED_BY VARCHAR(255) NOT NULL,
  CREATED_TIME TIMESTAMP NOT NULL,
  UPDATED_BY VARCHAR(255),
  UPDATED_TIME TIMESTAMP,
  DELETED_BY VARCHAR(255),
  DELETED_TIME TIMESTAMP,
  VERSION_NO INTEGER NOT NULL
);

/**********************************/
/* Table Name: Suggest Elevate word */
/**********************************/
CREATE TABLE SUGGEST_ELEVATE_WORD(
  ID BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  SUGGEST_WORD VARCHAR(255) NOT NULL,
  READING VARCHAR(255),
  TARGET_ROLE VARCHAR(255),
  TARGET_LABEL VARCHAR(255),
  BOOST FLOAT NOT NULL,
  CREATED_BY VARCHAR(255) NOT NULL,
  CREATED_TIME TIMESTAMP NOT NULL,
  UPDATED_BY VARCHAR(255),
  UPDATED_TIME TIMESTAMP,
  DELETED_BY VARCHAR(255),
  DELETED_TIME TIMESTAMP,
  VERSION_NO INTEGER NOT NULL
);

CREATE UNIQUE INDEX UQ_FAVORITE_LOG ON FAVORITE_LOG (USER_ID, URL(200));

CREATE INDEX IDX_OVERLAPPING_HOST_BY_REGULAR_NAME_AND_SORT_ORDER ON OVERLAPPING_HOST (REGULAR_NAME(200), SORT_ORDER);

CREATE INDEX IDX_FILE_CONFIG_TO_LABEL_TYPE_MAPPING_FOR_FILE_CONFIG ON FILE_CONFIG_TO_LABEL_TYPE_MAPPING (FILE_CONFIG_ID);

CREATE INDEX IDX_WEB_CONFIG_TO_LABEL_TYPE_MAPPING__FOR_WEB_CONFIG ON WEB_CONFIG_TO_LABEL_TYPE_MAPPING (WEB_CONFIG_ID);

CREATE INDEX IDX_FILE_CONFIG_TO_ROLE_TYPE_MAPPING_FOR_FILE_CONFIG ON FILE_CONFIG_TO_ROLE_TYPE_MAPPING (FILE_CONFIG_ID);

CREATE INDEX IDX_WEB_CONFIG_TO_ROLE_TYPE_MAPPING_FOR_WEB_CONFIG ON WEB_CONFIG_TO_ROLE_TYPE_MAPPING (WEB_CONFIG_ID);

CREATE INDEX IDX_DATA_CONFIG_TO_ROLE_TYPE_MAPPING_FOR_DATA_CONFIG ON DATA_CONFIG_TO_ROLE_TYPE_MAPPING (DATA_CONFIG_ID);

CREATE INDEX IDX_DATA_CONFIG_TO_LABEL_TYPE_MAPPING_FOR_DATA_CONFIG ON DATA_CONFIG_TO_LABEL_TYPE_MAPPING (DATA_CONFIG_ID);

CREATE INDEX IDX_SEARCH_LOG_BY_HIT_COUNT ON SEARCH_LOG (HIT_COUNT);
CREATE INDEX IDX_SEARCH_LOG_BY_RESPONSE_TIME ON SEARCH_LOG (RESPONSE_TIME);
CREATE INDEX IDX_SEARCH_LOG_BY_REQUESTED_TIME ON SEARCH_LOG (REQUESTED_TIME);
CREATE INDEX IDX_SEARCH_LOG_BY_SEARCH_WORD ON SEARCH_LOG (SEARCH_WORD(255));
CREATE INDEX IDX_SEARCH_LOG_BY_RTIME_USID ON SEARCH_LOG (REQUESTED_TIME, USER_SESSION_ID);
CREATE INDEX IDX_SEARCH_LOG_BY_USER_ID ON SEARCH_LOG (USER_ID);

CREATE INDEX IDX_CLICK_LOG_URL ON CLICK_LOG (URL(255));

CREATE INDEX IDX_FAILURE_URL_FOR_LIST ON FAILURE_URL (URL(200), LAST_ACCESS_TIME, ERROR_NAME(100), ERROR_COUNT);
CREATE INDEX IDX_FAILURE_URL_BY_CONFIG_ID ON FAILURE_URL (CONFIG_ID);

CREATE INDEX IDX_SEARCH_FIELD_LOG_NAME ON SEARCH_FIELD_LOG (NAME);

CREATE INDEX IDX_SESSION_NAME_EXPIRED ON CRAWLING_SESSION (NAME, EXPIRED_TIME);

INSERT INTO SCHEDULED_JOB (ID, NAME, TARGET, CRON_EXPRESSION, SCRIPT_TYPE, SCRIPT_DATA, CRAWLER, JOB_LOGGING, AVAILABLE, SORT_ORDER, CREATED_BY, CREATED_TIME, UPDATED_BY, UPDATED_TIME, VERSION_NO) VALUES (1, 'Crawler', 'all', '0 0 0 * * ?', 'groovy', 'return container.getComponent("crawlJob").execute(executor);', 'T', 'T', 'T', 0, 'system', '2000-01-01 00:00:00', 'system', '2000-01-01 00:00:00', 0);
INSERT INTO SCHEDULED_JOB (ID, NAME, TARGET, CRON_EXPRESSION, SCRIPT_TYPE, SCRIPT_DATA, CRAWLER, JOB_LOGGING, AVAILABLE, SORT_ORDER, CREATED_BY, CREATED_TIME, UPDATED_BY, UPDATED_TIME, VERSION_NO) VALUES (2, 'Minutely Tasks', 'all', '0 * * * * ?', 'groovy', 'return container.getComponent("aggregateLogJob").execute();', 'F', 'F', 'T', 10, 'system', '2000-01-01 00:00:00', 'system', '2000-01-01 00:00:00', 0);
INSERT INTO SCHEDULED_JOB (ID, NAME, TARGET, CRON_EXPRESSION, SCRIPT_TYPE, SCRIPT_DATA, CRAWLER, JOB_LOGGING, AVAILABLE, SORT_ORDER, CREATED_BY, CREATED_TIME, UPDATED_BY, UPDATED_TIME, VERSION_NO) VALUES (3, 'Hourly Tasks', 'all', '0 0 * * * ?', 'groovy', 'return container.getComponent("updateStatsJob").execute()+container.getComponent("updateHotWordJob").execute();', 'F', 'F', 'T', 20, 'system', '2000-01-01 00:00:00', 'system', '2000-01-01 00:00:00', 0);
INSERT INTO SCHEDULED_JOB (ID, NAME, TARGET, CRON_EXPRESSION, SCRIPT_TYPE, SCRIPT_DATA, CRAWLER, JOB_LOGGING, AVAILABLE, SORT_ORDER, CREATED_BY, CREATED_TIME, UPDATED_BY, UPDATED_TIME, VERSION_NO) VALUES (4, 'Daily Tasks', 'all', '0 0 0 * * ?', 'groovy', 'return container.getComponent("purgeLogJob").execute();', 'F', 'F', 'T', 30, 'system', '2000-01-01 00:00:00', 'system', '2000-01-01 00:00:00', 0);
INSERT INTO SCHEDULED_JOB (ID, NAME, TARGET, CRON_EXPRESSION, SCRIPT_TYPE, SCRIPT_DATA, CRAWLER, JOB_LOGGING, AVAILABLE, SORT_ORDER, CREATED_BY, CREATED_TIME, UPDATED_BY, UPDATED_TIME, VERSION_NO) VALUES (5, 'Purge logs', 'all', '0 50 23 * * ?', 'groovy', 'def oneMonthAgo = (new Date()).time - 2592000000L

def clean = { f ->
  if (oneMonthAgo < f.lastModified()) {
    return
  }
  if(f.isFile()){
    f.delete();
  } else if (f.isDirectory()) {
    f.deleteDir()
  }
}

new File(container.getComponent(Class.forName("javax.servlet.ServletContext")).getRealPath("../../temp")).eachFile { clean(it) }
new File(container.getComponent(Class.forName("javax.servlet.ServletContext")).getRealPath("/WEB-INF/logs")).eachFile { clean(it) }', 'F', 'F', 'T', 100, 'system', '2000-01-01 00:00:00', 'system', '2000-01-01 00:00:00', 0);

