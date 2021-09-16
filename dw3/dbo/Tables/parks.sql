CREATE TABLE [dbo].[parks] (
    [id]         INT           NULL,
    [createdate] VARCHAR (120) NULL
)
WITH (CLUSTERED COLUMNSTORE INDEX, DISTRIBUTION = ROUND_ROBIN);


GO



GO

