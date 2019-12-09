# Data Management and Analysis Project

## 1. Documentation

### Project Description

Looking at environmental data over the course of the last 140 years to detect if there is a turning point in yearly temperatures being less than the baseline to being greater than the baseline, if any month or season seems to be effected by global warming more than others, and if, based on december temperatures from one year to the next, we see a steady increase in temperature.

### Data Source or Description of Data 

https://data.giss.nasa.gov/gistemp/
This is data from NASA temperature data collected by weather stations from 1880 to 2019. A baseline temperature for each month, season, and year was calculated by looking at the data collected in the years from 1951 to 1980. The data represented is the difference in the average temperature of the specified period of time (month, season, or year) from the corresponding baseline temperature. 

The attached data is slightly modified version of this original NASA data in which missing values are marked by the number 999 and a column containing the previous decembers data is added since this is used in the calculations of the data fields dn and djf

### Field and / or Columns and Their Types

__TODO__: Enumerate fields or columns... specify type and add short description. For example:

* username: `varchar(255)` - name of the web site user
* active: `boolean` - "soft" delete flag (set false to delete)

* year: 'smallint' - the year in which the data was taken
* jan: 'decimal' - average temperature data from January subtracted from the January baseline
* feb: 'decimal' - average temperature data from February subtracted from the February baseline
* mar: 'decimal' - average temperature data from March subtracted from the March baseline
* apr: 'decimal' - average temperature data from April subtracted from the April baseline
* may: 'decimal' - average temperature data from May subtracted from the May baseline
* jun: 'decimal' - average temperature data from June subtracted from the June baseline
* jul: 'decimal' - average temperature data from July subtracted from the July baseline
* aug: 'decimal' - average temperature data from August subtracted from the August baseline
* sep: 'decimal' - average temperature data from September subtracted from the September baseline
* oct: 'decimal' - average temperature data from October subtracted from the October baseline
* nov: 'decimal' - average temperature data from November subtracted from the November baseline
* dec: 'decimal' - average temperature data from December subtracted from the December baseline
* prev_dec: 'decimal' - average temperature data from the previous December subtracted from the December baseline. (note: this is a manually added column not originally in the data in this place)
* jd: 'decimal' - average temperature data from the year (from January to December) minus the January to December baseline
* dn: 'decimal' - average temperature data from the year (from the previous December to November) minus the previous December to November baseline
* djf: 'decimal' - average temperature data from the previous December, January, February minus the DJF baseline
* mam: 'decimal' - average temperature data from March, April, May minus the MAM baseline
* jja: 'decimal' - average temperature data from June, July, August minus the JJA baseline
* son: 'deciaml' - average temperature data from June, July, August minus the SON baseline


## 2. Diagram / Sample Documents and Collections

![ER Diagram](er-diagram.png)

This ER diagram attempts to be normalized; however it is not completely in Third Normalized Form. This is partly due to the added column prev_dec which has the values of the dec column from the year before.

## 3. Data Import and Collection... or Data Generation

Create Tables:
[Create Tables](create_tables.sql)

Populate Tables:
[Populate Tables](populate_tables.sql)

## 4. Analysis

Goals of analysis:
* see if there is a notable turning point year in which temperatures went from being primarily below the baseline to primarily greater than the base line.
* see if there is there any month or season that has an abnormal (whethere this be larger or smaller than the rest) number of years in which it is greater than its baseline
* see if the increase in temperature appear to be happen consistantly from one year to the next by looking at dec and prev_dec values

[Link to analysis script](queries.sql)

Results of analysis:

* see if there is a notable turning point year in which temperatures went from being primarily below the baseline to primarily greater than the base line.
In 1938, the value of dn euqal to the baseline.
There are 57 years before 1938 with recorded dn values, 57 of these were below the baseline.
There are 80 years after 1938 with recorded dn values, 59 of these were above the baseine.

There was no year in which the value of jd was equal to the baseline.

The last year with a dn value below the baseline was 1976 and the first year with a dn value above the baseline was 1940.
The last year with a jd value below the baseline was 1976 and the first year with a jd value above the baseline was 1940.
This suggests a turning point within the years of 1940 to 1976. Note that 1938, the year in which dn was equal to the base line, is slightly outside of this window.

* see if there is there any month or season that has an abnormal (whethere this be larger or smaller than the rest) number of years in which it is greater than its baseline

Seasons
Winter: djf had 65 years in which its average was greater than its baseline out of 139 recorded years.
Spring: mam had 64 years in which its average was greater than its baseline out of 140 recorded years.
Summer: jja had 58 years in which its average was greater than its baseline out of 140 recorded years.
Autumn: son had 62 years in which its average was greater than its baseline out of 139 recorded years.

None of these values for seasons seem to be abnormal.

Months
jan had 65 years in which its average was greater than its baseline out of 140 recorded years.
feb had 64 years in which its average was greater than its baseline out of 140 recorded years.
mar had 70 years in which its average was greater than its baseline out of 140 recorded years.
apr had 66 years in which its average was greater than its baseline out of 140 recorded years.
may had 59 years in which its average was greater than its baseline out of 140 recorded years.
jun had 55 years in which its average was greater than its baseline out of 140 recorded years.
jul had 62 years in which its average was greater than its baseline out of 140 recorded years.
aug had 60 years in which its average was greater than its baseline out of 140 recorded years.
sep had 60 years in which its average was greater than its baseline out of 140 recorded years.
oct had 69 years in which its average was greater than its baseline out of 140 recorded years.
nov had 68 years in which its average was greater than its baseline out of 139 recorded years.
dec had 56 years in which its average was greater than its baseline out of 139 recorded years.

None of these values for months seem to be abnormal.

* see if the increase in temperature appear to be happen consistantly from one year to the next by looking at dec and prev_dec values

There are 74 years in which the previous december's average was larger than that decembers average out of 138 recorded years.
There are 62 years in which the previous december's average was smaller than that decembers average out of 138 recorded years.
There are 2 years in which the previous december's average was equal to that decembers average out of 138 recorded years.

Based on the December values alone (which is a very limited amount of data), the temperature does not increase from one year to the next every year, or even almost every year.

[Results of the queries](query-results)

Links to exact lines of required usage of CTE, comprehension, etc:

[View](https://github.com/nyu-csci-ua-0480-003-fall-2019/noragilligan-mini-project/blob/55e032212967082cd8cf6e2462584b93ce179ba6/queries.sql#L2)

[CTE](https://github.com/nyu-csci-ua-0480-003-fall-2019/noragilligan-mini-project/blob/55e032212967082cd8cf6e2462584b93ce179ba6/queries.sql#L23)

## 5. Research

Link to documentation / site of new concept or technology used:
https://www.postgresql.org/docs/current/tablefunc.html

* Describe what you'll be using this technology for
Look at the seasonal data at the begining of each decade, with each row being its own season and the columns being the decades.

* [application of research](research.sql)

