DROP TABLE contrib_from_cmtes;

CREATE TABLE contrib_from_cmtes
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
    occupation VARCHAR(38),
    transaction_dt DATE,
    transaction_amt NUMERIC(14,2),
    other_id VARCHAR(9),
    cand_id VARCHAR(9),
    tran_id VARCHAR(32),
    file_num NUMERIC(22),
    memo_cd VARCHAR(1),
    memo_text VARCHAR(100),
    sub_id VARCHAR(19) NOT NULL,
    
    CONSTRAINT contrib_from_cmtes_pkey PRIMARY KEY (cmte_id),
    
    CONSTRAINT contrib_from_cmtes_fkey_cand FOREIGN KEY (cand_id)
    REFERENCES candidate_master_info (cand_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION,
    
    CONSTRAINT contrib_from_cmtes_fkey_cmte FOREIGN KEY (cmte_id)
    REFERENCES public.cmte_master (cmte_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
   );
   
   --COPY itpas2 FROM '/Users/mm10204/Desktop/Git/Presidential_Election/data'
   

