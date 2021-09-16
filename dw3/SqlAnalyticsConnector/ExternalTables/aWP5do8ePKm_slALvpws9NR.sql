CREATE EXTERNAL TABLE [SqlAnalyticsConnector].[aWP5do8ePKm_slALvpws9NR] (
    [key] NVARCHAR (4000) NULL,
    [time] BIGINT NULL,
    [newValue] NVARCHAR (4000) NULL,
    [deleted] BIT NULL
)
    WITH (
    DATA_SOURCE = [SQLAnalyticsConnectorDataSource_slALvpws9NR],
    LOCATION = N'SQLAnalyticsConnectorStaging/application_1631378015730_0001/aWP5do8ePKm_slALvpws9NR.tbl',
    FILE_FORMAT = [SQLAnalyticsConnectorFileFormat_slALvpws9NR],
    REJECT_TYPE = VALUE,
    REJECT_VALUE = 0
    );


GO

