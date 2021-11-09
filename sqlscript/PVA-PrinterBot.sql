create table Printer (
    PrinterID int not null identity primary key clustered,
    SN varchar(256),
    Email varchar(150)
)

insert Printer (SN,Email) values 
('1111-2222-3333-4444', 'hiram@hotmail.com'),
('2222-3333-4444-5555', 'skylar@msn.com'),
('3333-4444-5555-6666', 'chris@live.com')

select * from printer