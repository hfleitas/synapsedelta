CREATE EXTERNAL TABLE [SqlAnalyticsConnector].[amP8QwkSmu8_sj8AbXEFdLX] (
    [key] NVARCHAR (4000) NULL,
    [time] BIGINT NULL,
    [newValue] NVARCHAR (4000) NULL,
    [deleted] BIT NULL
)
    WITH (
    DATA_SOURCE = [SQLAnalyticsConnectorDataSource_sj8AbXEFdLX],
    LOCATION = N'SQLAnalyticsConnectorStaging/application_1631378015730_0001/amP8QwkSmu8_sj8AbXEFdLX.tbl',
    FILE_FORMAT = [SQLAnalyticsConnectorFileFormat_sj8AbXEFdLX],
    REJECT_TYPE = VALUE,
    REJECT_VALUE = 0
    );


GO

