
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

-- is dn = 0 a turning point?
SELECT year FROM complete_data
WHERE dn = 0;

-- look at averages below baseline before the year where dn = 0
WITH cte AS (SELECT year FROM complete_data WHERE dn = 0)
SELECT COUNT(*) FROM complete_data
WHERE year < (SELECT year FROM cte)
AND dn != 999;


WITH cte AS (SELECT year FROM complete_data WHERE dn = 0)
SELECT COUNT(*) FROM complete_data
WHERE year < (SELECT year FROM cte)
AND dn < 0 AND dn != 999;

-- look at averages above baseline after the year where dn = 0
WITH cte AS (SELECT year FROM complete_data WHERE dn = 0)
SELECT COUNT(*) FROM complete_data
WHERE year > (SELECT year FROM cte)
AND dn != 999;


WITH cte AS (SELECT year FROM complete_data WHERE dn = 0)
SELECT COUNT(*) FROM complete_data
WHERE year > (SELECT year FROM cte)
AND dn > 0 AND dn != 999;

-- is there some other turning point in dn
SELECT max(year) FROM complete_data
WHERE dn < 0
AND dn != 999;

SELECT min(year) FROM complete_data
WHERE dn > 0
AND dn != 999;

-- jn
SELECT max(year) FROM complete_data
WHERE jd < 0
AND jd != 999;

SELECT min(year) FROM complete_data
WHERE jd > 0
AND jd != 999;


-- what season has the most averages above baseline
SELECT COUNT(*) FROM complete_data
WHERE djf > 0
AND djf != 999;

SELECT COUNT(*) FROM complete_data
WHERE mam > 0
AND mam != 999;

SELECT COUNT(*) FROM complete_data
WHERE jja > 0
AND jja != 999;

SELECT COUNT(*) FROM complete_data
WHERE son > 0
AND son != 999;
	--overall counts
SELECT COUNT(*) FROM complete_data
WHERE djf != 999;

SELECT COUNT(*) FROM complete_data
WHERE mam != 999;

SELECT COUNT(*) FROM complete_data
WHERE jja != 999;

SELECT COUNT(*) FROM complete_data
WHERE son != 999;


-- what months have the most averages above baseline
SELECT COUNT(*) FROM complete_data
WHERE jan > 0
AND jan != 999;

SELECT COUNT(*) FROM complete_data
WHERE feb > 0
AND feb != 999;

SELECT COUNT(*) FROM complete_data
WHERE mar > 0
AND mar != 999;

SELECT COUNT(*) FROM complete_data
WHERE apr > 0
AND apr != 999;

SELECT COUNT(*) FROM complete_data
WHERE may > 0
AND may != 999;

SELECT COUNT(*) FROM complete_data
WHERE jun > 0
AND jun != 999;

SELECT COUNT(*) FROM complete_data
WHERE jul > 0
AND jul != 999;

SELECT COUNT(*) FROM complete_data
WHERE aug > 0
AND aug != 999;

SELECT COUNT(*) FROM complete_data
WHERE sep > 0
AND sep != 999;

SELECT COUNT(*) FROM complete_data
WHERE oct > 0
AND oct != 999;

SELECT COUNT(*) FROM complete_data
WHERE nov > 0
AND nov != 999;

SELECT COUNT(*) FROM complete_data
WHERE dec > 0
AND dec != 999;

-- Comparisons of prev_dec and dec
SELECT COUNT(*) FROM complete_data
WHERE prev_dec > dec 
AND prev_dec != 999 AND dec != 999;

SELECT COUNT(*) FROM complete_data
WHERE prev_dec < dec 
AND prev_dec != 999 AND dec != 999;

SELECT COUNT(*) FROM complete_data
WHERE prev_dec = dec 
AND prev_dec != 999 AND dec != 999;

-- drop view
DROP VIEW complete_data;


