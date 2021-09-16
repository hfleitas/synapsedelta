create schema staging
go 

/*auto-created in pipeline*/
create table staging.autocreatedtablexyz(
    col0 varchar(100),
    col1 varchar(100),
    col2 varchar(100)
) -- this will default to round robin dist. with a cci idx.
go

/*inserted by pipeline*/
insert staging.autocreatedtablexyz values('1','hiram','fleitas')
insert staging.autocreatedtablexyz values('2','joe','doe')
insert staging.autocreatedtablexyz values('3','jane','doe')
go

/*k now the procs*/
If object_id('staging.NewTableDefCTISmethod') is not null Drop proc staging.NewTableDefCTISmethod;
go 

Create proc staging.NewTableDefCTISmethod 
as 
    If object_id('dbo.newtable') is not null Drop table dbo.newtable;

    Create table newtable (
        Id int,
        Firstname varchar(100),
        Lastname varchar(100)
    ) -- again defaults to round robin dist. with a cci idx.
    Insert into newtable
    Select * from staging.autocreatedtablexyz;

    If object_id('staging.autocreatedtablexyz') is not null Drop table staging.autocreatedtablexyz;
go


--note Alter proc is supported, I just do this to avoid rewriting create, when I highlight to rerun same scripts...

If object_id('staging.NewTableDefCTASmethod') is not null Drop proc staging.NewTableDefCTASmethod;
go

Create proc staging.NewTableDefCTASmethod
As 
    If object_id('dbo.newtable') is not null Drop table dbo.newtable;

    Create table newtable 
    with (
        distribution = round_robin,
        clustered columnstore index
    )
    As 
    Select 
        cast(col0 as int) as ID,
        col1 as Firstname,
        col2 as Lastname 
    from staging.autocreatedtablexyz;

If object_id('staging.autocreatedtablexyz') is not null Drop table staging.autocreatedtablexyz;
go 


--orc sample
-- https://github.com/Teradata/kylo/tree/master/samples/sample-data/orc
/*
userdata[1-5]_orc: These are sample files containing data in ORC format.

-> Number of rows in each file: 1000
-> Column details:
column#		column_name		hive_datatype
=====================================================
1		registration_dttm 	timestamp
2		id 			int
3		first_name 		string
4		last_name 		string
5		email 			string
6		gender 			string
7		ip_address 		string
8		cc 			string
9		country 		string
10		birthdate 		string
11		salary 			double
12		title 			string
13		comments 		string
*/

if object_id('staging.orcsample') is not null drop table staging.orcsample; 
go 
create table staging.orcsample (
    registration_dttm datetime,
    id int,
    first_name nvarchar(256),
    last_name nvarchar(256),
    email nvarchar(256),
    gender nvarchar(256),
    ip_address nvarchar(256),
    cc nvarchar(256),
    country nvarchar(256),
    birthdate nvarchar(256),
    salary float,
    title nvarchar(256),
    comments nvarchar(256)
)

select count(*) from staging.orcsample 