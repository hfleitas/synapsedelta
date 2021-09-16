CREATE PROC [ShakeNBake] AS 
    -- rename object target2hash TO ReportTarget;
    
    --ctas to merge
    if object_id('target2hash') is not null drop table [target2hash];
    create table [target2hash]
    with (
        distribution = hash([key]),
        clustered columnstore index
    ) as select * from [target];

    --merge
    merge into [target2hash] as t
    using (select * from [lastchanges]) as lc ([key], [time], [newvalue], [deleted])
    on lc.[key] = t.[key]
    when matched and lc.[deleted] = 1 
        then delete
    when matched
        then update set t.[key] = lc.[key], t.[value] = lc.[newValue]
    when not matched and lc.[deleted] = 0 
        then insert ([key], [value]) values(lc.[key], lc.[newValue]);

    --rename
    if object_id('ReportTarget') is not null drop table [ReportTarget];
    rename object target2hash TO ReportTarget;

GO

