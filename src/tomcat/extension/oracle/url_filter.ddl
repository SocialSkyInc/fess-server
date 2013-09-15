CREATE TABLE  "URL_FILTER" 
   (    "ID" NUMBER(19,0) NOT NULL ENABLE, 
    "SESSION_ID" VARCHAR2(20) NOT NULL ENABLE, 
    "URL" VARCHAR2(4000) NOT NULL ENABLE, 
    "FILTER_TYPE" VARCHAR2(1) NOT NULL ENABLE, 
    "CREATE_TIME" TIMESTAMP (6) NOT NULL ENABLE, 
     CONSTRAINT "URL_FILTER_PK" PRIMARY KEY ("ID") ENABLE
   ) ;

CREATE INDEX "URL_FILTER_UK_SID_FILTER" ON "URL_FILTER" ("SESSION_ID", "FILTER_TYPE");

CREATE SEQUENCE URL_FILTER_SEQ START WITH 1 INCREMENT BY 50;

