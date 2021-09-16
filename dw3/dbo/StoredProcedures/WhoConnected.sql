CREATE PROC [WhoConnected] AS
    select 
        min(cast(login_time as date)) as MinLoginDate, 
        max(cast(login_time as date)) as MaxLoginDate
    from sys.dm_pdw_exec_sessions 
    where session_id <> session_id()

    select 
        cast(login_time as date) as LoginDate, 
        login_name, 
        client_id, 
        app_name, 
        status
    from sys.dm_pdw_exec_sessions 
    where session_id <> session_id()
    group by 
        cast(login_time as date),
        login_name, 
        client_id, 
        app_name, 
        status
    order by LoginDate desc

GO

