-- contributions from individuals

DROP VIEW IF EXISTS pres2020_indiv;

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

