# An attempt to make a Snowflake version of Lahman Baseball database
I tried starting with the R package https://github.com/cdalzell/Lahman but R seems to have a bizarre and unnatural cultural approach to NULL values. So I switched to trying to covert the MySQL version https://github.com/WebucatorTraining/lahman-baseball-mysql to Snowflake as I thought it might be easier.

## In Snowflake:
 1. Create tables using `lahman_snowflake_table_definitions.sql`.
 1. Load data in `output_csv` using `lahman_data_file_import_format.sql`.
 1. Profit.

### MySQL to Snowflake conversion notes:

 - Remove the backticks around table names and capitalize them, as is the Snowflake way.
 - Remove display widths (the `(11)` in `int(11)`) from numbers. Snowflake doesn't use display widths.
 - `AUTO_INCREMENT` becomes `AUTOINCREMENT` because we need to lock people into open platforms somehow.
  - Remove any `UNIQUE KEY` and `KEY` statements. `PRIMARY KEY` is OK. I'm just punting on this to get the data in. We can tune later.
  - Remove any 	`CONSTRAINT` statements.
  
