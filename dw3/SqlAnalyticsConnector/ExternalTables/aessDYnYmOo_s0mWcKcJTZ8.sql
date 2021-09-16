CREATE EXTERNAL TABLE [SqlAnalyticsConnector].[aessDYnYmOo_s0mWcKcJTZ8] (
    [key] NVARCHAR (4000) NULL,
    [time] BIGINT NULL,
    [newValue] NVARCHAR (4000) NULL,
    [deleted] BIT NULL
)
    WITH (
    DATA_SOURCE = [SQLAnalyticsConnectorDataSource_s0mWcKcJTZ8],
    LOCATION = N'SQLAnalyticsConnectorStaging/application_1631388437932_0001/aessDYnYmOo_s0mWcKcJTZ8.tbl',
    FILE_FORMAT = [SQLAnalyticsConnectorFileFormat_s0mWcKcJTZ8],
    REJECT_TYPE = VALUE,
    REJECT_VALUE = 0
    );


GO

