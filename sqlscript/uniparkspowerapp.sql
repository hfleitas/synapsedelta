drop login uniparkspowerapp;
go
create login uniparkspowerapp with password = 'Uni2021Park$' --, default_database = [nbcuniparksdw]
go 
-- use nbcuniparksdw, hfpocsqlpool1
go 
drop user uniparkspowerapp
create user uniparkspowerapp for login uniparkspowerapp
-- alter role [db_owner] add memeber [uniparkspowerapp]

exec sp_addrolemember @rolename = 'db_owner', @membername = 'uniparkspowerapp';

--azure sql db - master
exec sp_addrolemember @rolename = 'dbmanager', @membername = 'uniparkspowerapp';
exec sp_droprolemember @rolename = 'dbmanager', @membername = 'uniparkspowerapp';
--
exec sp_addrolemember @rolename = 'db_owner', @membername = 'uniparkspowerapp';


Server=tcp:hfpocws1.sql.azuresynapse.net,1433;
Initial Catalog=hfpocsqlpool1;
Persist Security Info=False;
User ID=uniparkspowerapp;
Password=Uni2021Park$;
MultipleActiveResultSets=False;
Encrypt=True;
TrustServerCertificate=False;
Connection Timeout=30;

admin@CRM563881.onmicrosoft.com
https://make.preview.powerapps.com/e/Default-ddb72b0c-6ba3-4e40-8d34-ce9c6717bc94/canvas/?utm_source=office&utm_medium=app_launcher&utm_campaign=office_referrals&action=edit&app-id=%2Fproviders%2FMicrosoft.PowerApps%2Fapps%2F099a4cd3-0dad-475d-b5f2-7725b503724e
--fBcpKu134T