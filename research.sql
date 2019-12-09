
CREATE VIEW complete_data AS
SELECT year, jan, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, dec, prev_dec, jd, dn, djf, mam, jja, son
FROM years AS y 
LEFT JOIN jd_table AS j 
ON y.jd_id = j.jd_id
LEFT JOIN dn_table AS d 
ON y.dn_id = d.dn_id
LEFT JOIN djf_table AS dj 
ON d.djf_id = dj.djf_id
LEFT JOIN mam_table AS m 
ON d.mam_id = m.mam_id
LEFT JOIN jja_table AS jj 
ON d.jja_id = jj.jja_id
LEFT JOIN son_table AS s 
ON d.son_id = s.son_id;

SELECT * 
FROM crosstab('SELECT djf, mam, jja, son FROM complete_data WHERE MOD(year, 10) = 0') 
AS ct(djf, mam, jja, son);

DROP VIEW complete_data;