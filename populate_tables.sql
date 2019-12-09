


CREATE TABLE tmp
(
	id serial PRIMARY KEY,
	year smallint,
	jan DECIMAL,
	feb DECIMAL,
	mar DECIMAL,
	apr DECIMAL,
	may DECIMAL,
	jun DECIMAL,
	jul DECIMAL,
	aug DECIMAL,
	sep DECIMAL,
	oct DECIMAL,
	nov DECIMAL,
	dec DECIMAL,
	prev_dec DECIMAL,
	jd DECIMAL,
	dn DECIMAL,
	djf DECIMAL,
	mam DECIMAL,
	jja DECIMAL,
	son DECIMAL
);

COPY tmp (
	year, jan, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, dec,
	prev_dec, jd, dn, djf, mam, jja, son
	)
	FROM '/Users/noragilligan/Desktop/fall19/Data/noragilligan-mini-project/project_data_modified.csv'
	(FORMAT CSV, HEADER, ENCODING 'LATIN1');

INSERT INTO djf_table (prev_dec, jan, feb, djf)
SELECT DISTINCT prev_dec, jan, feb, djf 
FROM tmp;

INSERT INTO mam_table (mar, apr, may, mam)
SELECT DISTINCT mar, apr, may, mam
FROM tmp;

INSERT INTO jja_table (jun, jul, aug, jja)
SELECT DISTINCT jun, jul, aug, jja
FROM tmp;

INSERT INTO son_table (sep, oct, nov, son)
SELECT DISTINCT sep, oct, nov, son
FROM tmp;

CREATE VIEW tmp_view AS
SELECT mam_id, jja_id, son_id, prev_dec, jan, feb, dec, year, jd, dn
FROM tmp AS t 
LEFT JOIN mam_table AS m
ON t.mar = m.mar AND t.apr = m.apr AND t.may = m.may
LEFT JOIN jja_table AS j 
ON t.jun = j.jun AND t.jul = j.jul AND t.aug = j.aug
LEFT JOIN son_table AS s 
ON t.sep = s.sep AND t.oct = s.oct AND t.nov = s.nov;

INSERT INTO dn_table (djf_id, mam_id, jja_id, son_id, dn)
SELECT DISTINCT djf_id, mam_id, jja_id, son_id, dn 
FROM tmp_view AS t
LEFT JOIN djf_table AS d
ON t.prev_dec = d.prev_dec AND t.jan = d.jan AND t.feb = d.feb;

INSERT INTO jd_table (mam_id, jja_id, son_id, dec, jd)
SELECT DISTINCT mam_id, jja_id, son_id, dec, jd
FROM tmp_view AS t;

INSERT INTO jd_table_to_djf (jd_id, djf_id)
SELECT DISTINCT jd_id, djf_id
FROM tmp_view AS t
LEFT JOIN djf_table AS d
ON t.jan = d.jan AND t.prev_dec = d.prev_dec AND t.feb = d.feb
LEFT JOIN jd_table AS j
ON j.mam_id = t.mam_id AND j.jja_id = t.jja_id AND j.son_id = t.son_id AND j.dec = t.dec;

INSERT INTO years
SELECT DISTINCT year, jd_id, dn_id
FROM tmp_view AS t
LEFT JOIN jd_table AS j
ON j.mam_id = t.mam_id AND j.jja_id = t.jja_id AND j.son_id = t.son_id AND j.dec = t.dec
LEFT JOIN djf_table AS dt
ON t.prev_dec = dt.prev_dec AND t.jan = dt.jan AND t.feb = dt.feb
LEFT JOIN dn_table AS d
ON d.djf_id = dt.djf_id AND d.mam_id = t.mam_id AND d.jja_id = t.jja_id AND d.son_id = t.son_id;


DROP VIEW tmp_view;
DROP TABLE tmp;
