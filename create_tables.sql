DROP TABLE IF EXISTS years;

DROP TABLE IF EXISTS jd_table_to_djf;

DROP TABLE IF EXISTS dn_table;
DROP TABLE IF EXISTS jd_table;

DROP TABLE IF EXISTS djf_table;
DROP TABLE IF EXISTS mam_table;
DROP TABLE IF EXISTS jja_table;
DROP TABLE IF EXISTS son_table;

CREATE TABLE djf_table 
(
	djf_id serial PRIMARY KEY,
	prev_dec DECIMAL,
	jan DECIMAL,
	feb DECIMAL,
	djf DECIMAL
);


CREATE TABLE mam_table
(
	mam_id serial PRIMARY KEY,
	mar DECIMAL,
	apr DECIMAL,
	may DECIMAL,
	mam DECIMAL
);

CREATE TABLE jja_table
(
	jja_id serial PRIMARY KEY,
	jun DECIMAL,
	jul DECIMAL,
	aug DECIMAL,
	jja DECIMAL
);

CREATE TABLE son_table
(
	son_id serial PRIMARY KEY,
	sep DECIMAL,
	oct DECIMAL,
	nov DECIMAL,
	son DECIMAL
);


CREATE TABLE dn_table
(
	dn_id serial PRIMARY KEY,
	djf_id serial REFERENCES djf_table (djf_id),
	mam_id serial REFERENCES mam_table (mam_id),
	jja_id serial REFERENCES jja_table (jja_id),
	son_id serial REFERENCES son_table (son_id),
	dn DECIMAL
);

CREATE TABLE jd_table
(
	jd_id serial PRIMARY KEY,
	mam_id serial REFERENCES mam_table (mam_id),
	jja_id serial REFERENCES jja_table (jja_id),
	son_id serial REFERENCES son_table (son_id),
	dec DECIMAL,
	jd DECIMAL
);

CREATE TABLE jd_table_to_djf
(
	jd_id serial REFERENCES jd_table (jd_id),
	djf_id serial REFERENCES jja_table (jja_id),
	PRIMARY KEY (jd_id, djf_id)
);

CREATE TABLE years
(
	year smallint PRIMARY KEY,
	jd_id serial REFERENCES jd_table (jd_id),
	dn_id serial REFERENCES dn_table (dn_id)
);





