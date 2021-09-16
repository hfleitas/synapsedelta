CREATE PROC [DeltaDropTarget] AS 
    if object_id('target') is not null
    begin
        drop table target
    end

GO

