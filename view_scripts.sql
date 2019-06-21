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


-- transactions total 

DROP VIEW IF EXISTS pres2020_trans;

CREATE VIEW pres2020_trans AS 
SELECT tl.cand_id, tl.cmte_id, SUM(transaction_amt) AS transaction_total
FROM transactions t
JOIN table_link tl ON (tl.cmte_id = t.cmte_id)
WHERE t.cmte_id IN (SELECT cmte_id
					FROM cmtes
					WHERE cmte_id IN (SELECT cmte_id
										FROM table_link
											WHERE cand_id IN (SELECT cand_id
				  		 							FROM cands
					   								WHERE cand_election_yr='2020' AND cand_office= 'P' AND cand_status ='C'
									)))
GROUP BY tl.cand_id, tl.cmte_id ;

-- contributions to candidate committees from other committees
DROP VIEW IF EXISTS pres2020_cmtes;
CREATE VIEW pres2020_cmtes AS
SELECT cands.cand_id, cmtes.cmte_id, sum(cc.transaction_amt) as cmtes_total
FROM contrib_to_candidate_cmtes cc
LEFT JOIN cands on cands.cand_id = cc.cand_id
LEFT JOIN cmtes on cmtes.cmte_id = cc.cmte_id
WHERE cand_election_yr ='2020' AND cand_office = 'P' and cand_status = 'C'
GROUP BY cands.cand_id, cmtes.cmte_id;

--expenditures
DROP VIEW IF EXISTS pres2020_expend;

CREATE VIEW pres2020_expend AS
SELECT operating_expends.cmte_id, sum(transaction_amt), candidate_id
FROM operating_expends 
JOIN cmtes ON operating_expends.cmte_id = cmtes.cmte_id
JOIN cands ON candidate_id = cands.cand_id
WHERE entity_tp = 'CCM' AND cand_election_yr = '2020' AND cand_office = 'P' AND cand_status = 'C'
GROUP BY operating_expends.cmte_id, candidate_id;

