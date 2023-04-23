ALTER FILE FORMAT "LAHMAN"."PUBLIC".LAHMAN_LOAD SET COMPRESSION = 'AUTO' FIELD_DELIMITER = ',' RECORD_DELIMITER = '\n' SKIP_HEADER = 0 FIELD_OPTIONALLY_ENCLOSED_BY = '\047' TRIM_SPACE = FALSE ERROR_ON_COLUMN_COUNT_MISMATCH = TRUE ESCAPE = '\134' ESCAPE_UNENCLOSED_FIELD = '\134' DATE_FORMAT = 'AUTO' TIMESTAMP_FORMAT = 'AUTO' NULL_IF = ('NULL');

/* Here's the important stuff:

- Comma Delimited
- Line ends \n 
- No header row
- Fields optionally encolosed by single quotes
- Escape character: \ (this will get you if you forget it)
- NULL indicator: NULL_IF

*/
