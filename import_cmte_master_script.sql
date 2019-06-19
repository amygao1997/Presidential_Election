-- Table: public.cmte_master

-- DROP TABLE public.cmte_master;

CREATE TABLE public.cmte_master
(
  cmte_id varchar(9) NOT NULL DEFAULT,
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
  candidate_id varchar(9)
  
  CONSTRAINT cmte_master_pkey PRIMARY KEY (cmte_id)
)
WITH (
  OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.cmte_master
OWNER to postgres;