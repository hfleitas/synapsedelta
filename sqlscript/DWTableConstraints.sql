SELECT
  name,
  type,
  unique_index_id,
  is_system_named
  
FROM sys.key_constraints
WHERE type = 'PK';

ALTER TABLE FactInternetSales ADD CONSTRAINT PK_FactinternetSales 
PRIMARY KEY nonCLUSTERED (	SalesOrderNumber, SalesOrderLineNumber) NOT ENFORCED ;
-- errors.

select OrderDateKey,count(*)
from FactInternetSales
group by OrderDateKey
having count(*)>1

select SalesOrderNumber,count(*)
from FactInternetSales
group by SalesOrderNumber
having count(*)>1


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactInternetSales]
(
	[ProductKey] [int] NOT NULL,
	[OrderDateKey] [int] NOT NULL,
	[DueDateKey] [int] NOT NULL,
	[ShipDateKey] [int] NOT NULL,
	[CustomerKey] [int] NOT NULL,
	[PromotionKey] [int] NOT NULL,
	[CurrencyKey] [int] NOT NULL,
	[SalesTerritoryKey] [int] NOT NULL,
	[SalesOrderNumber] [nvarchar](20) NOT NULL,
	[SalesOrderLineNumber] [tinyint] NOT NULL,
	[RevisionNumber] [tinyint] NOT NULL,
	[OrderQuantity] [smallint] NOT NULL,
	[UnitPrice] [money] NOT NULL,
	[ExtendedAmount] [money] NOT NULL,
	[UnitPriceDiscountPct] [float] NOT NULL,
	[DiscountAmount] [float] NOT NULL,
	[ProductStandardCost] [money] NOT NULL,
	[TotalProductCost] [money] NOT NULL,
	[SalesAmount] [money] NOT NULL,
	[TaxAmt] [money] NOT NULL,
	[Freight] [money] NOT NULL,
	[CarrierTrackingNumber] [nvarchar](25) NULL,
	[CustomerPONumber] [nvarchar](25) NULL
)
WITH
(
	DISTRIBUTION = HASH ( [ProductKey] ),
	CLUSTERED COLUMNSTORE INDEX,
	PARTITION
	(
		[OrderDateKey] RANGE RIGHT FOR VALUES (20000101, 20010101, 20020101, 20030101, 20040101, 20050101, 20060101, 20070101, 20080101, 20090101, 20100101, 20110101, 20120101, 20130101, 20140101, 20150101, 20160101, 20170101, 20180101, 20190101, 20200101, 20210101, 20220101, 20230101, 20240101, 20250101, 20260101, 20270101, 20280101, 20290101)
	)
)
GO

ALTER TABLE FactInternetSales ADD CONSTRAINT PK_FactinternetSales PRIMARY KEY nonCLUSTERED (ProductKey, OrderDateKey) NOT ENFORCED ;
alter table FactInternetSales drop constraint PK_FactinternetSales
ALTER TABLE FactInternetSales ADD CONSTRAINT PK_FactinternetSales PRIMARY KEY CLUSTERED (ProductKey, OrderDateKey) NOT ENFORCED ;

-- https://docs.microsoft.com/en-us/azure/synapse-analytics/sql-data-warehouse/sql-data-warehouse-table-constraints

-- Create table t1
if object_id('t1') is not null drop table t1
go
CREATE TABLE t1 (a1 INT NOT NULL, b1 INT, c1 varchar(50)) WITH (DISTRIBUTION = ROUND_ROBIN)

-- Insert values to table t1 with duplicate values in column a1.
INSERT INTO t1 VALUES (1, 100, 'hiram')
INSERT INTO t1 VALUES (1, 1000, 'sam')
INSERT INTO t1 VALUES (2, 200, 'ernest')
INSERT INTO t1 VALUES (3, 300, 'mara')
INSERT INTO t1 VALUES (4, 400, 'neelie')

-- Run this query.  No primary key or unique constraint.  4 rows returned. Correct result.
SELECT a1, COUNT(*) AS total FROM t1 GROUP BY a1

SELECT * FROM t1 


/*
a1          total
----------- -----------
1           2
2           1
3           1
4           1

(4 rows affected)
*/

-- Add unique constraint
ALTER TABLE t1 ADD CONSTRAINT unique_t1_a1 unique (a1) NOT ENFORCED

-- Re-run this query.  5 rows returned.  Incorrect result.
SELECT a1, count(*) AS total FROM t1 GROUP BY a1

/*
a1          total
----------- -----------
2           1
4           1
1           1
3           1
1           1

(5 rows affected)
*/

-- Drop unique constraint.
ALTER TABLE t1 DROP CONSTRAINT unique_t1_a1

-- Add primary key constraint
ALTER TABLE t1 add CONSTRAINT PK_t1_a1 PRIMARY KEY CLUSTERED (a1) NOT ENFORCED

ALTER TABLE t1 add CONSTRAINT PK_t1_a1 PRIMARY KEY nonCLUSTERED (a1) 
delete from t1 where c1='sam'

ALTER TABLE t1 DROP CONSTRAINT PK_t1_a1

-- Re-run this query.  5 rows returned.  Incorrect result.
SELECT a1, COUNT(*) AS total FROM t1 GROUP BY a1

/*
a1          total
----------- -----------
2           1
4           1
1           1
3           1
1           1

(5 rows affected)
*/

-- Manually fix the duplicate values in a1
UPDATE t1 SET a1 = 0 WHERE b1 = 1000

-- Verify no duplicate values in column a1 
SELECT * FROM t1

/*
a1          b1
----------- -----------
2           200
3           300
4           400
0           1000
1           100

(5 rows affected)
*/

-- Add unique constraint
ALTER TABLE t1 add CONSTRAINT unique_t1_a1 UNIQUE (a1) NOT ENFORCED  

-- Re-run this query.  5 rows returned.  Correct result.
SELECT a1, COUNT(*) as total FROM t1 GROUP BY a1

/*
a1          total
----------- -----------
2           1
3           1
4           1
0           1
1           1

(5 rows affected)
*/

-- Drop unique constraint.
ALTER TABLE t1 DROP CONSTRAINT unique_t1_a1

-- Add primary key contraint
ALTER TABLE t1 ADD CONSTRAINT PK_t1_a1 PRIMARY KEY NONCLUSTERED (a1) NOT ENFORCED

-- Re-run this query.  5 rows returned.  Correct result.
SELECT a1, COUNT(*) AS total FROM t1 GROUP BY a1

/*
a1          total
----------- -----------
2           1
3           1
4           1
0           1
1           1

(5 rows affected)
*/

drop table if exists t1
CREATE TABLE t1 (a1 INT NOT NULL, b1 INT, c1 varchar(50))

	INSERT INTO t1 VALUES (1, 100, 'hiram')
	-- INSERT INTO t1 VALUES (1, 1000, 'sam')
	INSERT INTO t1 VALUES (2, 200, 'ernest')
	INSERT INTO t1 VALUES (3, 300, 'mara')
	INSERT INTO t1 VALUES (4, 400, 'neelie')
	INSERT INTO t1 VALUES (5, 1000, 'sam')

ALTER TABLE t1 ADD CONSTRAINT PK_t1_a1 PRIMARY KEY CLUSTERED (a1)

alter table t1 add VerCol rowversion

select * from dbo.t1
update t1 set b1=55 where a1=2
select * from t1


drop table if exists t1
CREATE TABLE t1 (
	a1 INT not null identity(1,1) primary key clustered, 
	b1 INT, 
	c1 varchar(50), 
	v1 rowversion
)

set identity_insert t1 on;
	INSERT INTO t1 (a1,b1,c1) VALUES (1, 100, 'hiram')
	-- INSERT INTO t1 VALUES (1, 1000, 'sam')
	INSERT INTO t1 (a1,b1,c1) VALUES (2, 200, 'ernest')
	INSERT INTO t1 (a1,b1,c1) VALUES (3, 300, 'mara')
	INSERT INTO t1 (a1,b1,c1) VALUES (4, 400, 'neelie')
	INSERT INTO t1 (a1,b1,c1) VALUES (5, 1000, 'sam')
set identity_insert t1 off;

-- ALTER TABLE t1 ADD CONSTRAINT PK_t1_a1 PRIMARY KEY CLUSTERED (a1)
alter table t1 add VerCol rowversion

select * from dbo.t1
update t1 set b1=2 where a1=3
select * from t1

