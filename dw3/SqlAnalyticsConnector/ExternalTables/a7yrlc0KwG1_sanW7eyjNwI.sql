CREATE EXTERNAL TABLE [SqlAnalyticsConnector].[a7yrlc0KwG1_sanW7eyjNwI] (
    [key] NVARCHAR (4000) NULL,
    [time] BIGINT NULL,
    [newValue] NVARCHAR (4000) NULL,
    [deleted] BIT NULL
)
    WITH (
    DATA_SOURCE = [SQLAnalyticsConnectorDataSource_sanW7eyjNwI],
    LOCATION = N'SQLAnalyticsConnectorStaging/application_1631378015730_0001/a7yrlc0KwG1_sanW7eyjNwI.tbl',
    FILE_FORMAT = [SQLAnalyticsConnectorFileFormat_sanW7eyjNwI],
    REJECT_TYPE = VALUE,
    REJECT_VALUE = 0
    );


GO

