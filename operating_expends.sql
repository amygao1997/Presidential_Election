CREATE TABLE operating_expends
(
   cmte_id varchar(9) REFERENCES cmte_master(cmte_id),
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
   transaction_dt date,
   transaction_amt decimal(14,2),
   transaction_pgi varchar(5),
   purpose varchar(100),
   category varchar(3),
   category_desc varchar(40),
   memo_cd varchar(1),
   memo_text varchar(100),
   entity_tp varchar(3),
   sub_id bigint REFERENCES contrib_from_cmtes(sub_id),
   file_num bigint,
   tran_id varchar(32),
   back_ref_tran_id varchar(32)
    
);

