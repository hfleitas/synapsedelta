CREATE EXTERNAL TABLE [dbo].[extDevs] (
    [first] VARCHAR (50) NULL,
    [last] VARCHAR (50) NULL
)
    WITH (
    DATA_SOURCE = [wplushiramsynapsefs],
    LOCATION = N'devs.csv',
    FILE_FORMAT = [skipHeader_CSV],
    REJECT_TYPE = VALUE,
    REJECT_VALUE = 0
    );


GO

