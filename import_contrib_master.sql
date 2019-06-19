DROP TABLE contrib_from_cmtes;

CREATE TABLE contrib_from_cmtes
--Contributions to candidates from committees info

(
    CMTE_ID VARCHAR(9) NOT NULL,
    AMNDT_IND VARCHAR(1),
    RPT_TP VARCHAR(3),
    TRANSACTION_PGI VARCHAR(5),
    IMG_NUM VARCHAR(18),
    TRANSACTION_TP VARCHAR(3),
    ENTITY_TP VARCHAR(3),
    NAME VARCHAR(200),
    CITY VARCHAR(30),
    STATE VARCHAR(2),
    ZIP_CODE VARCHAR(9),
    EMPLOYER VARCHAR(38),
    OCCUPATION VARCHAR(38),
    TRANSACTION_DT DATE,
    TRANSACTION_AMT NUMERIC(14,2),
    OTHER_ID VARCHAR(9),
    CAND_ID VARCHAR(9),
    TRAN_ID VARCHAR(32),
    FILE_NUM NUMERIC(22),
    MEMO_CD VARCHAR(1),
    MEMO_TEXT VARCHAR(100),
    SUB_ID VARCHAR(19) NOT NULL,
    
    CONSTRAINT contrib_from_cmtes_pkey PRIMARY KEY (CMTE_ID),
    
    CONSTRAINT contrib_from_cmtes_fkey_cand FOREIGN KEY (CAND_ID)
    REFERENCES candidate_master_info (CAND_ID) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION,
    
    CONSTRAINT contrib_from_cmtes_fkey_cmte FOREIGN KEY (CMTE_ID)
    REFERENCES public.cmte_master (cmte_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
   );
   
   --COPY itpas2 FROM '/Users/mm10204/Desktop/Git/Presidential_Election/data'
   

