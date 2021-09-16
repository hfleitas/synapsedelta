CREATE VIEW [Humans]
AS select	FullName, [Status], Age, Home, Relatives, EyeColor, HairColor
	from	[Character]
	where	( FullName = user_name() or Relatives like '%'+user_name()+'%' )
	or		user_name()='Jim Lake Jr.';

GO

