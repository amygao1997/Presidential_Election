--Edwood

DROP TABLE IF EXISTS public.cmtes CASCADE; 

CREATE TABLE public.cmtes
(
  cmte_id varchar(9) NOT NULL,
  cmte_name varchar(200),
  tres_name varchar(90),
  cmte_street varchar(34),
  cmte_street2 varchar(34),
  cmte_city varchar(30),
  cmte_state varchar(2),
  cmte_zip varchar(9),
  cmte_designation varchar(1),
  cmte_type varchar(1),
  cmte_party_affiliation varchar(3),
  cmte_filing_freq varchar(1),
  org_interest_group varchar(1),
  connected_org_name varchar(200),
  candidate_id varchar(9),
  CONSTRAINT cmte_master_pkey PRIMARY KEY (cmte_id)
);

\COPY cmtes FROM '/tmp/data/cm.txt' WITH (DELIMITER '|', HEADER FALSE);



--Amy
DROP TABLE IF EXISTS cands CASCADE;

CREATE TABLE cands
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
  CONSTRAINT cands_info_pkey PRIMARY KEY (CAND_ID)
);

\COPY cands FROM '/tmp/data/cn.txt' WITH (DELIMITER '|', HEADER FALSE);



DROP TABLE IF EXISTS table_link;
CREATE TABLE table_link
(
    cand_id VARCHAR(9), --REFERENCES candidate_master_info(cand_id),
    cand_election_yr smallint NOT NULL,
    fec_election_yr smallint NOT NULL,
    cmte_id VARCHAR(9), --REFERENCES cmte_master(cmte_id),
    cmte_tp VARCHAR(1),
    cmte_dsgn VARCHAR(1),
    linkage_id INT PRIMARY KEY
    
);
\COPY table_link FROM '/tmp/data/ccl.txt' WITH (DELIMITER '|', HEADER FALSE);

--Olivia
DROP TABLE IF EXISTS contrib_to_candidate_cmtes;
CREATE TABLE contrib_to_candidate_cmtes
--Contributions to candidates from committees info

(
    cmte_id VARCHAR(9) NOT NULL,
    amndt_ind VARCHAR(1),
    rtp_tp VARCHAR(3),
    transaction_pgi VARCHAR(5),
    img_num VARCHAR(18),
    transaction_tp VARCHAR(3),
    entity_tp VARCHAR(3),
    name VARCHAR(200),
    city VARCHAR(30),
    state VARCHAR(2),
    zip_code VARCHAR(9),
    employer VARCHAR(38),
    occupation VARCHAR(38) default '',
    transaction_dt VARCHAR(8),
    transaction_amt NUMERIC(14,2),
    other_id VARCHAR(9),
    cand_id VARCHAR(9),
    tran_id VARCHAR(32),
    file_num NUMERIC(22),
    memo_cd VARCHAR(1),
    memo_text VARCHAR(100),
    sub_id bigint,
    
    CONSTRAINT contrib_to_candidate_cmtes_pkey PRIMARY KEY (sub_id)
    
    --CONSTRAINT contrib_from_cmtes_fkey_cand FOREIGN KEY (cand_id)
    --REFERENCES candidate_master_info (cand_id) MATCH SIMPLE
    --ON UPDATE NO ACTION
    --ON DELETE NO ACTION,
    
    --CONSTRAINT contrib_from_cmtes_fkey_cmte FOREIGN KEY (cmte_id)
    --REFERENCES public.cmte_master (cmte_id) MATCH SIMPLE
    --ON UPDATE NO ACTION
    --ON DELETE NO ACTION
   );
    
   \COPY contrib_to_candidate_cmtes FROM '/tmp/data/itpas2.txt' WITH (DELIMITER '|', HEADER FALSE);


    
DROP TABLE IF EXISTS transactions;
CREATE TABLE transactions
(
   cmte_id varchar(9) REFERENCES cmtes(cmte_id),
   amndt_ind varchar(1),
   rpt_tp varchar(3),
   transaction_pgi varchar(5),
   image_num varchar(18),
   transaction_tp varchar(3),
   entity_tp varchar(3),
   name varchar(200),
   city varchar(30),
   state varchar(2),
   zip_code varchar(9),
   employer varchar(38),
   occupation varchar(38),
   transaction_dt varchar(8),
   transaction_amt decimal(14,2),
   other_id varchar(9),
   tran_id varchar(32),
   file_num varchar(20),
   memo_cd varchar(1),
   memo_text varchar(100),
   sub_id varchar(100)
    
);
\COPY transactions FROM '/tmp/data/itoth.txt' WITH (DELIMITER '|', HEADER FALSE);

DROP TABLE IF EXISTS contrib_by_indiv;
CREATE TABLE contrib_by_indiv
(
   cmte_id varchar(9) REFERENCES cmtes(cmte_id),
   amndt_ind varchar(1),
   rpt_tp varchar(3),
   transaction_pgi varchar(5),
   image_num varchar(18),
   transaction_tp varchar(3),
   entity_tp varchar(3),
   name varchar(200),
   city varchar(30),
   state varchar(2),
   zip_code varchar(9),
   employer varchar(38),
   occupation varchar(38),
   transaction_dt varchar(8),
   transaction_amt decimal(14,2) default 0.00,
   other_id varchar(9),
   tran_id varchar(32),
   file_num bigint,
   memo_cd varchar(1),
   memo_text varchar(100),
   sub_id bigint
    
);
\COPY contrib_by_indiv FROM '/tmp/data/itcont.txt' WITH (DELIMITER '|', HEADER FALSE);

DROP TABLE IF EXISTS operating_expends;
CREATE TABLE operating_expends
(
   cmte_id varchar(9) REFERENCES cmtes(cmte_id),
   amndt_ind varchar(1),
   rpt_yr smallint,
   rpt_tp varchar(3),
   image_num varchar(18),
   line_num text,
   form_tp_cd varchar(8),
   sched_tp_cd varchar(8),
   name varchar(200),
   city varchar(30),
   state varchar(2),
   zip_code varchar(9),
   transaction_dt varchar(10),
   transaction_amt decimal(14,2),
   transaction_pgi varchar(5),
   purpose varchar(100),
   category varchar(3),
   category_desc varchar(40),
   memo_cd varchar(1),
   memo_text varchar(100),
   entity_tp varchar(3),
   sub_id bigint,
   file_num bigint,
   tran_id varchar(32),
   back_ref_tran_id varchar(32),
   garbage varchar(10) 
);
\COPY operating_expends FROM '/tmp/data/oppexp.txt' WITH (DELIMITER '|', HEADER FALSE);
ALTER TABLE operating_expends DROP garbage;

-- contributions from individuals
CREATE VIEW pres2020_indiv AS
SELECT cmtes.cmte_id, 
   cands.cand_id,
   sum(transaction_amt) AS contrib_total
FROM contrib_by_indiv c
LEFT JOIN cmtes ON c.cmte_id = cmtes.cmte_id
LEFT JOIN cands ON cands.cand_id = cmtes.candidate_id
WHERE cands.cand_office = 'P'
AND cand_election_yr = '2020'
AND cand_status = 'C'
GROUP BY cmtes.cmte_id, cands.cand_id;