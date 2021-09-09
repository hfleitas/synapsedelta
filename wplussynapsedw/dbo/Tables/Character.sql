CREATE TABLE [dbo].[Character] (
    [CharacterId] INT           NOT NULL,
    [FullName]    VARCHAR (50)  NOT NULL,
    [Affiliation] VARCHAR (60)  NULL,
    [Category]    VARCHAR (10)  NULL,
    [Aka]         VARCHAR (300) NULL,
    [Status]      VARCHAR (35)  NULL,
    [Race]        VARCHAR (50)  NULL,
    [Age]         INT           NULL,
    [Home]        VARCHAR (50)  NULL,
    [Relatives]   VARCHAR (300) NULL,
    [Weapons]     VARCHAR (100) NULL,
    [EyeColor]    VARCHAR (20)  NULL,
    [HairColor]   VARCHAR (50)  NULL,
    [Minions]     VARCHAR (100) NULL,
    [VoicedBy]    VARCHAR (50)  NULL
)
WITH (CLUSTERED COLUMNSTORE INDEX, DISTRIBUTION = ROUND_ROBIN);


GO



GO

