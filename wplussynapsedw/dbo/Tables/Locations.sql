CREATE TABLE [dbo].[Locations] (
    [LocationId]   INT          NOT NULL,
    [LocationName] VARCHAR (50) NULL,
    [CharacterId]  INT          NULL
)
WITH (CLUSTERED COLUMNSTORE INDEX, DISTRIBUTION = ROUND_ROBIN);


GO



GO

