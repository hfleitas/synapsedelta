CREATE TABLE [dbo].[ReportTarget] (
    [key]   VARCHAR (8000) NULL,
    [value] VARCHAR (8000) NULL
)
WITH (CLUSTERED COLUMNSTORE INDEX, DISTRIBUTION = HASH([key]));


GO



GO

