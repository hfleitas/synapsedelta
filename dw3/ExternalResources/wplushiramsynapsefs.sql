CREATE EXTERNAL DATA SOURCE [wplushiramsynapsefs]
    WITH (
    TYPE = HADOOP,
    LOCATION = N'wasbs://wplushiramsynapsefs@wplushiramsynapseadlsv2.blob.core.windows.net/',
    CREDENTIAL = [wplushiramsynapsefs_cred]
    );


GO

