CREATE EXTERNAL TABLE [SqlAnalyticsConnector].[aztjTutE57K_s1RJx1EGQJE] (
    [key] NVARCHAR (4000) NULL,
    [time] BIGINT NULL,
    [newValue] NVARCHAR (4000) NULL,
    [deleted] BIT NULL
)
    WITH (
    DATA_SOURCE = [SQLAnalyticsConnectorDataSource_s1RJx1EGQJE],
    LOCATION = N'SQLAnalyticsConnectorStaging/application_1631378015730_0001/aztjTutE57K_s1RJx1EGQJE.tbl',
    FILE_FORMAT = [SQLAnalyticsConnectorFileFormat_s1RJx1EGQJE],
    REJECT_TYPE = VALUE,
    REJECT_VALUE = 0
    );


GO

