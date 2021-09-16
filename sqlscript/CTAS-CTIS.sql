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
