create login sam with password = 'SuperSecret52&&';

create user sam for login sam

exec sp_addrolemember 'db_owner', 'sam'

-- load sample data using ADS import wizard.


update NPSampleData set LST_SCAN_TYPE=99 where shp_trk_nbr=551317309357