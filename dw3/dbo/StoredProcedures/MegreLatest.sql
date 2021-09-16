CREATE PROC [dbo].[MegreLatest] AS 

    merge into [ReportTarget] as t
    using (select * from [lastchanges]) as lc ([key], [time], [newvalue], [deleted])
    on lc.[key] = t.[key]
    when matched and lc.[deleted] = 1 
        then delete
    when matched
        then update set t.[key] = lc.[key], t.[value] = lc.[newValue]
    when not matched and lc.[deleted] = 0 
        then insert ([key], [value]) values(lc.[key], lc.[newValue]);

GO

