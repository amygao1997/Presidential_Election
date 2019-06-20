-- Table: candidate_master_info

DROP TABLE IF EXISTS candidate_master_info;

CREATE TABLE candidate_master_info
(
  CAND_ID VARCHAR(9) NOT NULL,
  CAND_NAME VARCHAR(200),
  CAND_PTY_AFFILIATION VARCHAR(3),
  CAND_ELECTION_YR VARCHAR(4),
  CAND_OFFICE_ST VARCHAR(2), 
  CAND_OFFICE VARCHAR(1), 
  CAND_OFFICE_DISTRICT VARCHAR(2), 
  CAND_ICI VARCHAR(1), 
  CAND_STATUS VARCHAR(1), 
  CAND_PCC VARCHAR(9), 
  CAND_ST1 VARCHAR(34), 
  CAND_ST2 VARCHAR(34), 
  CAND_CITY VARCHAR(30), 
  CAND_ST VARCHAR(2), 
  CAND_ZIP VARCHAR(9),
  CONSTRAINT candidate_master_info_pkey PRIMARY KEY (CAND_ID)
);

\COPY candidate_master_info FROM '/tmp/data/cn.txt' WITH (DELIMITER '|', HEADER FALSE);


