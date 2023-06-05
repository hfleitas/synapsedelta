CREATE EXTERNAL FILE FORMAT [skipHeader_CSV]
    WITH (
    FORMAT_TYPE = DELIMITEDTEXT,
    FORMAT_OPTIONS (FIELD_TERMINATOR = N',', STRING_DELIMITER = N'"', USE_TYPE_DEFAULT = True, FIRST_ROW = 2, ENCODING = N'UTF8')
    );


GO
