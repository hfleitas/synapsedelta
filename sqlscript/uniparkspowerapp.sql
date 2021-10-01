drop login uniparkspowerapp;
go
create login uniparkspowerapp with password = 'Uni2021Park$' --, default_database = [nbcuniparksdw]
go 
use nbcuniparksdw
go 
drop user uniparkspowerapp
create user uniparkspowerapp for login uniparkspowerapp
-- alter role [db_owner] add memeber [uniparkspowerapp]

exec sp_addrolemember @rolename = 'db_owner', @membername = 'uniparkspowerapp';

