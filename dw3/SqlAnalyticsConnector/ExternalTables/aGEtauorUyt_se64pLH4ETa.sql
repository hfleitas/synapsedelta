CREATE EXTERNAL TABLE [SqlAnalyticsConnector].[aGEtauorUyt_se64pLH4ETa] (
    [key] NVARCHAR (4000) NULL,
    [time] BIGINT NULL,
    [newValue] NVARCHAR (4000) NULL,
    [deleted] BIT NULL
)
    WITH (
    DATA_SOURCE = [SQLAnalyticsConnectorDataSource_se64pLH4ETa],
    LOCATION = N'SQLAnalyticsConnectorStaging/application_1631378015730_0001/aGEtauorUyt_se64pLH4ETa.tbl',
    FILE_FORMAT = [SQLAnalyticsConnectorFileFormat_se64pLH4ETa],
    REJECT_TYPE = VALUE,
    REJECT_VALUE = 0
    );


GO

