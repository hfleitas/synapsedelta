CREATE SECURITY POLICY [dbo].[PortalPolicy]
    ADD FILTER PREDICATE [Portal].[fn_PortalAccess]([FullName], [Relatives]) ON [dbo].[Character]
    WITH (STATE = ON);


GO

