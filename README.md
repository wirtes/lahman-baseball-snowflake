# An attempt to make a Snowflake version of Lahman Baseball database
I tried starting with the R package https://github.com/cdalzell/Lahman but R seems to have a bizarre and unnatural cultural approach to NULL values. So I switched to trying to covert the MySQL version https://github.com/WebucatorTraining/lahman-baseball-mysql to Snowflake as I thought it might be easier.

## MySQL to Snowflake conversion notes:

 - remove the backticks (`) around table names and capitalize them, as is the Snowflake way.
 - remove the `(11)` in `int(11)`. Snowflake doesn't use display widths.
 - `AUTO_INCREMENT` becomes `AUTOINCREMENT` because we need to lock people into open platforms somehow.
