CREATE TABLE [dbo].[lastchanges] (
    [key]      VARCHAR (8000) NULL,
    [time]     BIGINT         NULL,
    [newValue] VARCHAR (8000) NULL,
    [deleted]  BIT            NULL
)
WITH (CLUSTERED COLUMNSTORE INDEX, DISTRIBUTION = ROUND_ROBIN);


GO



GO

