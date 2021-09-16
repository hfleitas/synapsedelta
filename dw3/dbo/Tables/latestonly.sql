CREATE TABLE [dbo].[latestonly] (
    [key]      NVARCHAR (4000) NULL,
    [time]     BIGINT          NULL,
    [newValue] NVARCHAR (4000) NULL,
    [deleted]  BIT             NULL
)
WITH (CLUSTERED COLUMNSTORE INDEX, DISTRIBUTION = ROUND_ROBIN);


GO



GO

