CREATE PROC [DeltaDropLastChanges] AS 
    if object_id('LastChanges') is not null
    begin
        drop table LastChanges
    end

GO

