CREATE TABLE [dbo].[Table] (
    [col1] INT NOT NULL
)
WITH (CLUSTERED COLUMNSTORE INDEX, DISTRIBUTION = HASH([col1]));


GO



GO

