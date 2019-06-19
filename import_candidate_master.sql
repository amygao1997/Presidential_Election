-- Table: candidate_master_info

-- DROP TABLE candidate_master_info;

CREATE TABLE candidate_master_info
(
  CAND_ID VARCHAR2(9) NOT NULL,
  CAND_NAME VARCHAR2(200),
  CAND_PTY_AFFILIATION VARCHAR2(3),
  CAND_ELECTION_YR Number(4),
  CAND_OFFICE_ST VARCHAR2(2), 
  CAND_OFFICE VARCHAR2(1), 
  CAND_OFFICE_DISTRICT VARCHAR2(2), 
  CAND_ICI VARCHAR2(1), 
  CAND_STATUS VARCHAR2(1), 
  CAND_PCC VARCHAR2(9), 
  CAND_ST1 VARCHAR2(34), 
  CAND_ST2 VARCHAR2(34), 
  CAND_CITY VARCHAR2(30), 
  CAND_ST VARCHAR2(2), 
  CAND_ZIP VARCHAR2(9),
  CONSTRAINT candidate_master_info_pkey PRIMARY KEY (CAND_ID),
)
WITH (
  OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE candidate_master_info
OWNER to postgres;