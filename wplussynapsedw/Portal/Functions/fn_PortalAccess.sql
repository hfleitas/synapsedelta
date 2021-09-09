CREATE FUNCTION [Portal].[fn_PortalAccess] (@FullName [sysname],@Relatives [sysname]) RETURNS TABLE
WITH SCHEMABINDING
AS
RETURN select	1 as PortalAccess 
		where	( @FullName = user_name() or @Relatives like '%'+user_name()+'%' )
		or		user_name() = 'Jim Lake Jr.'

GO

