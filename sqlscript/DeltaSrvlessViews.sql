create credential [https://wplushiramsynapseadlsv2.dfs.core.windows.net/wplushiramsynapsefs] 
with 
    identity = 'SHARED ACCESS SIGNATURE', 
    secret = 'mySASkey';
go 

select * from sys.credentials;
go

drop view if exists vDeltaTarget;
go
create view vDeltaTarget
as
SELECT [key], [value]
FROM OPENROWSET(
    BULK 'abfss://wplushiramsynapsefs@wplushiramsynapseadlsv2.dfs.core.windows.net/synapse/workspaces/wplushiramsynapse/warehouse/target',
    FORMAT = 'delta') as rows
go

drop view if exists vDeltaLastChanges;
go
create view vDeltaLastChanges
as
SELECT [key], [time], [newvalue], [deleted]
FROM OPENROWSET(
    BULK 'abfss://wplushiramsynapsefs@wplushiramsynapseadlsv2.dfs.core.windows.net/synapse/workspaces/wplushiramsynapse/warehouse/lastchanges',
    FORMAT = 'delta') as rows 
go

select * from vDeltaTarget
select * from vDeltaLastChanges

/*
{
    "errorCode": "2200",
    "message": "Failure happened on 'Source' side. ErrorCode=SqlOperationFailed,
    'Type=Microsoft.DataTransfer.Common.Shared.HybridDeliveryException,
    Message=A database operation failed with the following error: 'Invalid column name 'value'.',
    Source=,''Type=System.Data.SqlClient.SqlException,Message=Invalid column name 'value'.,
    Source=.Net SqlClient Data Provider,SqlErrorNumber=207,Class=16,ErrorCode=-2146232060,State=1,Errors=[{Class=16,Number=207,State=1,Message=Invalid column name 'value'.,},],'",
    "failureType": "UserError",
    "target": "LastChanges",
    "details": []
}

{
    "errorCode": "2200",
    "message": "Failure happened on 'Source' side. ErrorCode=SqlOperationFailed,
    'Type=Microsoft.DataTransfer.Common.Shared.HybridDeliveryException,
    Message=A database operation failed with the following error: 'Invalid column name 'value'.',
    Source=,''Type=System.Data.SqlClient.SqlException,Message=Invalid column name 'value'.,
    Source=.Net SqlClient Data Provider,SqlErrorNumber=207,Class=16,ErrorCode=-2146232060,State=1,
    Errors=[{Class=16,Number=207,State=1,Message=Invalid column name 'value'.,},],'",
    "failureType": "UserError",
    "target": "LastChanges",
    "details": []
}
*/
