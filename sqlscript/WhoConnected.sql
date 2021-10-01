select 
    cast(s.login_time as date) as LoginDate, 
    s.login_name, 
    s.app_name, 
    s.status,
    c.client_id as ip_address
from sys.dm_pdw_exec_sessions s
inner join sys.dm_pdw_exec_connections c
    on s.session_id = c.session_id
where s.session_id <> session_id()
group by 
    cast(s.login_time as date),
    s.login_name, 
    s.app_name, 
    s.status,
    c.client_id 
order by LoginDate desc

-- https://docs.microsoft.com/en-us/sql/relational-databases/system-dynamic-management-views/sys-dm-pdw-exec-connections-transact-sql?view=aps-pdw-2016-au7