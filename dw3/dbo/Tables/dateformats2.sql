CREATE TABLE [dbo].[dateformats2] (
    [id]         INT      NOT NULL,
    [createdate] DATETIME NOT NULL
)
WITH (CLUSTERED COLUMNSTORE INDEX, DISTRIBUTION = ROUND_ROBIN);


GO



GO

