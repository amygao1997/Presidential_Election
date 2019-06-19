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
