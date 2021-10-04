select * from t1

update t1 set b1=100 where a1=3
-- Parse error at line: 1, column: 8: Incorrect syntax near 'top'.
go

create schema powerautomate
go 
if object_id('prowerautomate.updatet1') is not null drop proc powerautomate.updatet1;
go 

create proc powerautomate.updatet1 (
    @a1 int,
    @b1 int,
    @c1 varchar(50)
)
as 
    update t1 set b1=@b1, c1=@c1 where a1=@a1
go    

select * from t1 where a1=3


/*
refrences:
https://us.flow.microsoft.com/manage/environments/Default-800d472c-8288-4f27-8978-f726a7a3d1f0/flows/95be371d-9384-4fe6-a4f7-8210bc933df8?backUrl=%2Fflows%2F95be371d-9384-4fe6-a4f7-8210bc933df8%2Fdetails
https://learntoilluminate.com/2021/06/writeback-to-synapse-using-powerapps-workaround/#comment-30
https://ms.portal.azure.com/#@microsoft.onmicrosoft.com/resource/subscriptions/e4e06275-58d1-4081-8f1b-be12462eb701/resourceGroups/oneclicksynapse/providers/Microsoft.Synapse/workspaces/hfpocws1/sqlPools/hfpocsqlpool1/overview
https://docs.microsoft.com/en-us/connectors/sqldw/#execute-a-sql-query-(v2)
https://powerusers.microsoft.com/t5/Using-Flows/Unable-to-get-result-of-Execute-a-SQL-query-v2/td-p/437352?lightbox-message-images-437352=108322i10A8CAC94557D420
https://docs.microsoft.com/en-us/powerapps/maker/canvas-apps/functions/function-filter-lookup
https://nextstepcreations.com.au/running-sql-queries-in-powerapps/
https://dc7669.wordpress.com/2020/08/10/power-automate-get-rowsv2-connector-filter-query-date-fields-how-to/
https://powerusers.microsoft.com/t5/Webinars-and-Video-Gallery/Using-the-When-an-Item-is-modified-trigger-with-Azure-SQL-DB/td-p/306455
*/