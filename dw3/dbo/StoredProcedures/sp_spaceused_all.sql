CREATE PROC [sp_spaceused_all] @SourceDB [nvarchar](max) AS
set nocount on

declare @sql nvarchar(max)
    create table #tables(name varchar(128))
    
    select @sql = 'insert #tables select TABLE_NAME from ' + @SourceDB + '.INFORMATION_SCHEMA.TABLES where TABLE_TYPE = ''BASE TABLE'''
    exec (@sql)
    
    create table #SpaceUsed (name varchar(128), rows varchar(11), reserved varchar(18), data varchar(18), index_size varchar(18), unused varchar(18))
    declare @name varchar(128)
    select @name = ''
    while exists (select * from #tables where name > @name)
    begin
        select @name = min(name) from #tables where name > @name
        select @sql = N'exec ' + @SourceDB + N'..sp_executesql N''insert #SpaceUsed exec sp_spaceused ' + @name + ''''
        exec (@sql)
    end
    select * from #SpaceUsed
    drop table #tables
    drop table #SpaceUsed

GO

