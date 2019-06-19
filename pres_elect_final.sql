CREATE TABLE cand_to_cmte_linkage
(
    cand_id VARCHAR(9) REFERENCES candidate_master_info(cand_id),
    cand_election_yr SMALLINT,
    fec_election_yr SMALLINT,
    cmte_id VARCHAR(9) REFERENCES cmte_master(cmte_id),
    cmte_tp VARCHAR(1),
    cmte_dsgn VARCHAR(1),
    linkage_id INT PRIMARY KEY
    
);


CREATE TABLE contrib_to_cand_from_cmte
(
   cmte_id varchar(9) REFERENCES cmte_master(cmte_id),
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
   transaction_dt date,
   transaction_amt decimal(14,2)
   other_id varchar(9),
   cand_id varchar(9),
   tran_id varchar(32),
   file_num bigint,
   memo_cd varchar(1),
   memo_text varchar(100),
   sub_id bigint REFERENCES contrib_from_cmtes(sub_id)
    
);


CREATE TABLE contrib_by_indiv
(
   cmte_id varchar(9) REFERENCES cmte_master(cmte_id),
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
   transaction_dt date,
   transaction_amt decimal(14,2)
   other_id varchar(9),
   tran_id varchar(32),
   file_num bigint,
   memo_cd varchar(1),
   memo_text varchar(100),
   sub_id bigint REFERENCES contrib_from_cmtes(sub_id)
    
);