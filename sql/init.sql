CREATE SCHEMA STAGE;


CREATE TABLE STAGE.SINK_USERS (
    USER_ID serial PRIMARY KEY,
    NAME VARCHAR ( 50 ),
    EMAIL VARCHAR ( 255 ),
    MODIFIED_TS TIMESTAMP NOT NULL, 
    CREATED_TS TIMESTAMP NOT NULL
);