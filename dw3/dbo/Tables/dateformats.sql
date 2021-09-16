CREATE TABLE [dbo].[dateformats] (
    [id]         INT           NULL,
    [createdate] VARCHAR (120) NULL
)
WITH (CLUSTERED COLUMNSTORE INDEX, DISTRIBUTION = ROUND_ROBIN);


GO



GO

