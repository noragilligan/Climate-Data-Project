# Data Management and Analysis Project

## 1. Documentation

### Project Description

Looking at environmental data over the course of the last 140 years to detect if there is a turning point in yearly temperatures being less than the baseline to being greater than the baseline.

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

__TODO__: Describe the goals of your analysis.

[__TODO__: Link to analysis script in repository (you can create any file you like)](queries.sql)

Links to exact line of required usage of CTE, comprehension, etc.
[__TODO__: Link to exact line of required usage of CTE, comprehension, etc.](name-of-analysis-script)

## 5. Research

* __TODO__: Link to documentation / site of new concept or technology used
* __TODO__: Describe what you'll be using this technology for
* [__TODO__: Link to application of research in repository](name-of-some-file)

