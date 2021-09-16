CREATE EXTERNAL TABLE [SqlAnalyticsConnector].[aeCZa2DMdYZ_so3AH5TAYqF] (
    [key] NVARCHAR (4000) NULL,
    [time] BIGINT NULL,
    [newValue] NVARCHAR (4000) NULL,
    [deleted] BIT NULL
)
    WITH (
    DATA_SOURCE = [SQLAnalyticsConnectorDataSource_so3AH5TAYqF],
    LOCATION = N'SQLAnalyticsConnectorStaging/application_1630590379987_0001/aeCZa2DMdYZ_so3AH5TAYqF.tbl',
    FILE_FORMAT = [SQLAnalyticsConnectorFileFormat_so3AH5TAYqF],
    REJECT_TYPE = VALUE,
    REJECT_VALUE = 0
    );


GO

