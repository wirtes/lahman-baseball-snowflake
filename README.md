# An attempt to make a Snowflake version of Lahman Baseball database
I tried starting with the R package https://github.com/cdalzell/Lahman but R seems to have a bizarre and unnatural cultural approach to NULL values. So I switched to trying to covert the MySQL version https://github.com/WebucatorTraining/lahman-baseball-mysql to Snowflake as I thought it might be easier.

## In Snowflake:
 1. Create your LAHMAN database.
 1. Create tables using `lahman_snowflake_table_definitions.sql`.
 1. Create a File Format based on the `lahman_data_file_import_format.sql`. I created the format in the GUI, so this SQL may not work out-of-the-box. This is a key step because you're telling Snowflake how to handle the variations in the CSV. In this case: comma separated, single quotes around strings, NULL values are `NULL`, etc.
 1. Load data in each file in `output_csv` into the corresponding table using the file format you just created.
 1. Note that I haven't actually tried to work with this data -- I just loaded it. So there may be data quality or load issues that I haven't discovered, yet.

### MySQL to Snowflake conversion notes:

 - Remove the backticks around table names so they become case-insensitive. This makes the DB less fussy to deal with.
 - Changed "2B" and "3B" column names to "TwoB" and "ThreeB" respectively. See above comment on fussiness.
 - Remove display widths (the `(11)` in `int(11)`) from numbers. Snowflake doesn't use display widths.
 - `AUTO_INCREMENT` becomes `AUTOINCREMENT` because we need to lock people into open platforms somehow.
  - Remove any `UNIQUE KEY` and `KEY` statements. `PRIMARY KEY` worked out of the box. I'm just punting on the rest to get the data in. We can tune later.
  - Remove any 	`CONSTRAINT` statements. 
  

### Script
`make_it_snow_data.py` is a python hack that converts the Lahman SQL into CSV. This allowed me to load it using the Snowflake GUI's "Load Data..." functionality.

### Load File Settings (CSV characteristics):
 - Comma Delimited
 - Line ends `\n` 
 - No header row
 - Fields optionally encolosed by single quotes
 - Escape character: `\` (this will get you if you forget it)
 - NULL indicator: `NULL`
