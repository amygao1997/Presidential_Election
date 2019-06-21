-- contributions from individuals

DROP VIEW IF EXISTS pres2020_indiv CASCADE;

CREATE VIEW pres2020_indiv AS
SELECT  
   cands.cand_id,
   sum(transaction_amt) AS contrib_total
FROM contrib_by_indiv c
LEFT JOIN cmtes ON c.cmte_id = cmtes.cmte_id
LEFT JOIN cands ON cands.cand_id = cmtes.candidate_id
WHERE cands.cand_office = 'P'
AND cand_election_yr = '2020'
AND cand_status = 'C'
GROUP BY cands.cand_id;


-- transactions total 

DROP VIEW IF EXISTS pres2020_trans CASCADE;

CREATE VIEW pres2020_trans AS 
SELECT tl.cand_id, SUM(transaction_amt) AS transaction_total
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
GROUP BY tl.cand_id;

-- contributions to candidate committees from other committees
DROP VIEW IF EXISTS pres2020_cmtes CASCADE;
CREATE VIEW pres2020_cmtes AS
SELECT cands.cand_id, sum(cc.transaction_amt) as cmtes_total
FROM contrib_to_candidate_cmtes cc
LEFT JOIN cands on cands.cand_id = cc.cand_id
LEFT JOIN cmtes on cmtes.cmte_id = cc.cmte_id
WHERE cand_election_yr ='2020' AND cand_office = 'P' and cand_status = 'C'
GROUP BY cands.cand_id;

--expenditures
DROP VIEW IF EXISTS expend  CASCADE;

CREATE VIEW expend AS
SELECT  candidate_id, sum(transaction_amt)
FROM operating_expends 
JOIN cmtes ON operating_expends.cmte_id = cmtes.cmte_id
JOIN cands ON candidate_id = cands.cand_id
WHERE entity_tp = 'CCM' AND cand_election_yr = '2020' AND cand_office = 'P' AND cand_status = 'C'
GROUP BY candidate_id;

-- total table
DROP VIEW IF EXISTS total CASCADE;

CREATE VIEW total AS
SELECT c.cand_name, c.cand_id, coalesce(contrib_total,0) AS "contrib_total", coalesce(transaction_total,0) AS "transaction_total", 
coalesce(cmtes_total,0) as "cmtes_total", 
(coalesce(contrib_total,0) +coalesce(transaction_total,0) +coalesce(cmtes_total,0)) AS total
FROM cands c
FULL JOIN pres2020_cmtes cm ON c.cand_id = cm.cand_id 
FULL JOIN pres2020_indiv i ON c.cand_id = i.cand_id
FULL JOIN pres2020_trans t ON t.cand_id = c.cand_id
FULL JOIN expend AS e ON c.cand_id =  e.candidate_id
WHERE c.cand_election_yr ='2020' AND c.cand_office = 'P' and c.cand_status = 'C'
ORDER BY total DESC
