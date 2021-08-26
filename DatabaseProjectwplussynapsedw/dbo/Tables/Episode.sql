CREATE TABLE [dbo].[Episode] (
    [CharacterId] INT           NOT NULL,
    [FullName]    NVARCHAR (64) NOT NULL,
    [VoicedBy]    NVARCHAR (64) NOT NULL,
    [BirthYear]   INT           NOT NULL,
    [Category]    NVARCHAR (64) NOT NULL,
    [Status]      NVARCHAR (64) NOT NULL,
    [Age]         INT           NOT NULL
)
WITH (CLUSTERED COLUMNSTORE INDEX, DISTRIBUTION = ROUND_ROBIN);


GO



GO

