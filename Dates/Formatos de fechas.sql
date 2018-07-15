' -----------------------------------------------------------------------------
'                                       DTT 1.2.1.3  (c)2013 FSL - FreeSoftLand
'  Title: Formatos de fechas
'
'  Date : 11/12/2013
'  By   : Type here your name or nickname.
' -----------------------------------------------------------------------------

Execute the following Microsoft SQL Server T-SQL example scripts in Management Studio Query Editor to demonstrate the formatting of money values/columns into currency (USD - U.S. Dollar - $) with thousands separators and English text (currency in words) formats.
-- Leading asterisks fill USD currency with thousands separators - QUICK SYNTAX
SELECT '$'+STUFF(convert(varchar,convert(money,12345),1), 1, 0,
           REPLICATE('*', 12 - LEN(convert(varchar,convert(money,12345),1))))
-- $***12,345.00

-- SQL format money with commas - thousand separators - transact sql format currency
-- SQL Server currency formatting and rounding - sql server convert formats
DECLARE @Amount MONEY = 28699654.7766      -- SQL Server 2008 t-sql syntax
SELECT DollarAmount=CONVERT(VARCHAR,@Amount,1)    -- 28,699,654.78
SELECT DollarAmount=CONVERT(VARCHAR,@Amount)      -- 28699654.78
SELECT DollarAmount=CONVERT(VARCHAR,@Amount, 0)   -- 28699654.78

-- String to money conversion
DECLARE @money1 varchar(64) = '-222,111,333.88',
        @money2 varchar(64) = '$123,456.93'
SELECT Money1 = CONVERT(money, @money1), Money2 = CONVERT(money, @money2)
-- -222111333.88  123456.93
------------
-- $ Prefix money / currency, & insert commas / pad with zeros - sql money formats
SELECT DollarAmount='$'+CONVERT(VARCHAR,@Amount,1)       -- $28,699,654.78
SELECT [USD Amount]=CHAR(36)+CONVERT(VARCHAR,@Amount,1)  -- $28,699,654.78
SELECT '$'+RIGHT('0000000000000000'+CONVERT(VARCHAR,@Amount),16) -- $0000028699654.78

-- SQL format currency in SELECT statement - sql format money - sql format currency
SELECT TOP (2) SalesOrderID, Total='$'+CONVERT(VARCHAR, TotalDue,1)
FROM AdventureWorks2008.Sales.SalesOrderHeader
/*          SalesOrderID      Total
            43659             $27,231.55
            43660             $1,716.18  */

-- Displaying calculated money values in currency format in t sql - sql currency formats
SELECT TOP (3) SalesOrderDetailID, '$'+
CONVERT(varchar, OrderQty * (1-UnitPriceDiscount)* UnitPrice,1) AS DetailTotal
FROM AdventureWorks2008.Sales.SalesOrderDetail ORDER BY NEWID()
/*    SalesOrderDetailID      DetailTotal
      40284                   $4,033.76
      34991                   $3,239.97
      10055                   $5.19    */
-- SQL currency formatting aligned right - sql server format currency
SELECT   TOP (3)  ProductName=Name,
                  Price=  '$' + CONVERT(char(8), ListPrice, 1)
FROM Production.Product
WHERE ListPrice > 0.0 ORDER BY Newid()
/* ProductName                            Price
Road-250 Black, 52                        $2,443.35
LL Mountain Seat/Saddle                   $   27.12
LL Touring Frame - Blue, 50               $  333.42  */
-- SQL currency without decimals - currency decimal places - convert currency sql
DECLARE @MoneyValue money = 2391590
SELECT CurrencyNoDecimals = '$'+ LEFT( CONVERT(varchar, @MoneyValue,1),
   LEN (CONVERT(varchar, @MoneyValue,1)) - 3)
-- $2,391,590

-- SQL convert string currency format to money - convert string to money sql
SELECT CONVERT(MONEY,'$123,456.34')
SELECT CONVERT(MONEY,'123,456.34')
-- 123456.34
-- USD currency format without cents
SELECT PARSENAME('$'+ Convert(varchar,Convert(money,5550000.45),1),2)
-- $5,550,000
------------
Technical Job Search: CLICK HERE FOR HIGH PAID JOBS!/* The column type has to be monetary data type (money or smallmoney)
for currency formatting. If not, it has to be converted to money type first.
Money data type can store values in the range from -922,337,203,685,477.5808
through +922,337,203,685,477.5807 (8 bytes); Smallmoney data type range is
from -214,748.3648 through 214,748.3647 (4 bytes). */
-- T-SQL currency formatting function - scalar-valued, user-defined
CREATE FUNCTION fnFormatCurrency
               (@MoneyAmount MONEY)
RETURNS VARCHAR(24)
AS
  BEGIN
    RETURN ('$' + convert(VARCHAR,@MoneyAmount,1))
  END
GO

-- Test / call currency formatting function with money type monetary input
SELECT TOP ( 3 ) SalesYTD,
                 CurrencyFormat = dbo.fnFormatCurrency(SalesYTD)
FROM     Sales.SalesPerson
ORDER BY NEWID()
GO
/*    SalesYTD          CurrencyFormat
      1764938.9859      $1,764,938.99
      3018725.4858      $3,018,725.49
      3189356.2465      $3,189,356.25
*/
------------
-- T-SQL double convert: convert decimal to money --> convert to varchar currency format
-- SQL Server 2008 T-SQL syntax - display money values in currency format
DECLARE @AccountBalance decimal(12,2) = 453789345.34
SELECT CONVERT(varchar(16),CONVERT(money, FLOOR(2 * @AccountBalance)),1)
-- 907,578,690.00

-- T-SQL basic currency formatting - format money/decimal
use AdventureWorks2008
declare @Amount money = 987654321.2355
select      Currency=convert(varchar, @Amount, 1),
            TwoDecimals=cast(@Amount as decimal(12,2))
/*
Currency          TwoDecimals
987,654,321.24    987654321.24
*/

-- SQL money formatting
-- SQL format 2 money type columns to currency - convert datetime to date
SELECT   TOP 5 SalesOrderID,
               [Order Date] = CONVERT(DATE,OrderDate),
               SubTotal = '$' + CONVERT(VARCHAR,SubTotal,1),
               [Total Due] = '$' + CONVERT(VARCHAR,TotalDue,1)
FROM     AdventureWorks2008.Sales.SalesOrderHeader
ORDER BY NEWID()
/*
SalesOrderID      Order Date  SubTotal    Total Due
44427             2001-10-20  $3,578.27   $3,953.99
67093             2004-03-29  $27.77      $30.69
72730             2004-06-12  $2,419.06   $2,673.06
54657             2003-09-20  $2,443.35   $2,699.90
45318             2002-02-01  $36,073.76  $39,861.50
*/
-- SQL varchar currency formatting options with parameter 0, 1, 2
SELECT CONVERT(varchar, CONVERT(money, 453757395.549535), 0 ) -- 453757395.55
SELECT CONVERT(varchar, CONVERT(money, 453757395.549535), 1 ) -- 453,757,395.55
SELECT CONVERT(varchar, CONVERT(money, 453757395.549535), 2 ) -- 453757395.5495
------------

-- T-SQL money data type has 4 digits after the decimal point
-- Microsoft T-SQL money & smallmoney data types are accurate to a ten-thousandth
-- MSSQL text / string numeric literal value rounded to money format
-- SQL cast money - cast currency
SELECT CAST(999.123456789 AS money)
-- 999.1235
------------
USE AdventureWorks;
-- SQL currency format - sql convert money to string - right justify string
-- SQL format currency - format numeric output - sql string formatting
-- SQL money format - transact sql money conversion
-- MSSQL format money - right align output - right adjust string
SELECT   TOP ( 7 )
    SubTotal,
    CurrencyFormat = Convert(VARCHAR(12),SubTotal,1),
    MoneyFormat = '$' + Convert(VARCHAR(12),SubTotal,1),
    RightJustified=
      REPLICATE(' ', 15 - len ('$' + Convert(VARCHAR(12),SubTotal,1) )) +
                '$' + Convert(VARCHAR(12),SubTotal,1)
FROM     Sales.SalesOrderHeader
ORDER BY Newid()
GO
/*
SubTotal    CurrencyFormat    MoneyFormat   RightJustified
2369.96     2,369.96          $2,369.96         $2,369.96
4450.7456   4,450.75          $4,450.75         $4,450.75
17476.3368  17,476.34         $17,476.34       $17,476.34
69.99       69.99             $69.99               $69.99
1288.31     1,288.31          $1,288.31         $1,288.31
2448.04     2,448.04          $2,448.04         $2,448.04
42.97       42.97             $42.97               $42.97
*/
------------
-- SQL check printing - format dollar amount with left asterisk padding
-- SQL currency formatting - transact sql format currency
-- MSSQL money formatting
DECLARE  @Amount MONEY
SET @Amount = '2534.40'
SELECT DollarFormat =  '$' +
                        Replicate('*',12 - Len(Convert(VARCHAR,@Amount,1))) +
                        Convert(VARCHAR,@Amount,1)
-- SQL equivalent currency formatting with asterisk-fill
SELECT DollarFormat = '$' + REPLACE(Convert(char(12),@Amount,1),' ','*')
GO
-- Result: $****2,534.40

------------
-- SQL convert currency in string format back to money or decimal
-- SQL convert currency formatted string to numeric
DECLARE @Currency varchar(64)
SET @Currency = '$5,399.23'
SELECT StringCurrency = @Currency,
MoneyFormat=CAST (REPLACE(REPLACE(@Currency, '$',''),',','') AS MONEY)
GO
/* Results

StringCurrency    MoneyFormat
$5,399.23         5399.23
*/
------------
-- SQL format money dollars only - format money without cents
-- SQL format money no cents - format amount whole number only
-- MSSQL format currency without decimals
SELECT TOP (5) ProductName = Name,
      ListPrice = LEFT('$' + CONVERT(VARCHAR, CAST(ListPrice AS MONEY), 1),
                   LEN('$' + CONVERT(VARCHAR, CAST(ListPrice AS MONEY), 1)) - 3)
FROM AdventureWorks.Production.Product
WHERE ListPrice > 0.0
ORDER BY newid()
/*
ProductName                         ListPrice
ML Road Rear Wheel                  $275
HL Road Seat/Saddle                 $52
Road-250 Black, 48                  $2,443
HL Mountain Frame - Black, 44       $1,349
LL Road Frame - Black, 60           $337
*/
------------
------------
-- Decimal to Currency converter
------------
-- SQL convert decimal to currency UDF - insert commas / thousand separators
-- T-SQL string scalar-valued user-defined function - convert varchar to money
CREATE FUNCTION fnDecimalToCurrency
              (@Amount DECIMAL(38,2))
RETURNS VARCHAR(64)
AS
  BEGIN
    DECLARE  @Result VARCHAR(64),
             @Buffer VARCHAR(64),
             @Comma  CHAR(1)
    SET @Result = ''
    SET @Comma = ''
    SET @Buffer = convert(VARCHAR(64),@Amount)
    SET @Result = right(@Buffer,3)
    SET @Buffer = left(@Buffer,len(@Buffer) - 3)
    WHILE (len(@Buffer) > 0)
      BEGIN
        SET @Result = left(convert(VARCHAR,convert(MONEY,reverse(
                                  left(reverse(@Buffer),12))),
                                   1),len(convert(VARCHAR,convert(MONEY,
                                   reverse(left(reverse(@Buffer),12))),
                                            1)) - 3) + @Comma + @Result
        SET @Buffer = CASE
                        WHEN len(@Buffer) > 12
                          THEN left(@Buffer,len(@Buffer) - 12)
                        ELSE ''
                      END
        SET @Comma = ','
      END
    RETURN REPLACE(@Result,' ','')
  END
GO

-- Test / call user-defined function
SELECT dbo.fnDecimalToCurrency(123456789012345678901234567890.12)
-- 123,456,789,012,345,678,901,234,567,890.12
SELECT dbo.fnDecimalToCurrency(5123.1244)     -- 5,123.12
SELECT dbo.fnDecimalToCurrency(67364676.126)  -- 67,364,676.13
Technical Job Search: CLICK HERE FOR HIGH PAID JOBS!------------
-- SQL convert dollar amount into words for check printing - Dollars and cents format
------------
-- Convert numbers to words - SQL amount into words - Currency to words
-- SQL money format to English - Translate money to text
-- Translate dollar amount to words - Convert numbers into English words
/*******
* Special thanks to Hunchback and Gert-Jan Strik of MSDN T-SQL forum for the nest level solution
*******/
USE AdventureWorks2008;
GO
-- Convert numbers to text - Scalar-valued user-defined function - UDF
CREATE FUNCTION fnMoneyToEnglishNL(@Money AS money, @nl int)
    RETURNS VARCHAR(1024)
AS
BEGIN
      DECLARE @Number as BIGINT
      SET @Number = FLOOR(@Money)
      DECLARE @Below20 TABLE (ID int identity(0,1), Word varchar(32))
      DECLARE @Below100 TABLE (ID int identity(2,1), Word varchar(32))

      INSERT @Below20 (Word) VALUES
                        ( 'Zero'), ('One'),( 'Two' ), ( 'Three'),
                        ( 'Four' ), ( 'Five' ), ( 'Six' ), ( 'Seven' ),
                        ( 'Eight'), ( 'Nine'), ( 'Ten'), ( 'Eleven' ),
                        ( 'Twelve' ), ( 'Thirteen' ), ( 'Fourteen'),
                        ( 'Fifteen' ), ('Sixteen' ), ( 'Seventeen'),
                        ('Eighteen' ), ( 'Nineteen' )
       INSERT @Below100 VALUES ('Twenty'), ('Thirty'),('Forty'), ('Fifty'),
                               ('Sixty'), ('Seventy'), ('Eighty'), ('Ninety')

DECLARE @English varchar(1024) =
(
  SELECT Case
    WHEN @Number = 0 THEN  ''
    WHEN @Number BETWEEN 1 AND 19
      THEN (SELECT Word FROM @Below20 WHERE ID=@Number)
   WHEN @Number BETWEEN 20 AND 99
-- SQL Server recursive function
     THEN  (SELECT Word FROM @Below100 WHERE ID=@Number/10)+ '-' +
           dbo.fnMoneyToEnglishNL( @Number % 10, @nl)
   WHEN @Number BETWEEN 100 AND 999
     THEN  (dbo.fnMoneyToEnglishNL( @Number / 100, @nl))+' Hundred '+
         dbo.fnMoneyToEnglishNL( @Number % 100, @nl)
   WHEN @Number BETWEEN 1000 AND 999999
     THEN  (dbo.fnMoneyToEnglishNL( @Number / 1000, @nl))+' Thousand '+
         dbo.fnMoneyToEnglishNL( @Number % 1000, @nl)
   WHEN @Number BETWEEN 1000000 AND 999999999
     THEN  (dbo.fnMoneyToEnglishNL( @Number / 1000000, @nl))+' Million '+
         dbo.fnMoneyToEnglishNL( @Number % 1000000, @nl)
   ELSE ' INVALID INPUT' END
)
SELECT @English = RTRIM(@English)
SELECT @English = RTRIM(LEFT(@English,len(@English)-1))
                 WHERE RIGHT(@English,1)='-'
IF (@@NestLevel - @nl) = 1
BEGIN
      SELECT @English = @English+' Dollars and '
      SELECT @English = @English+
      convert(varchar,convert(int,100*(@Money - @Number))) +' Cents'
END
RETURN (@English)
END
GO
------------
CREATE FUNCTION fnMoneyToEnglish(@Money AS money)
    RETURNS VARCHAR(1024)
AS
BEGIN
  RETURN (dbo.fnMoneyToEnglishNL(@Money, @@NESTLEVEL))
END
------------
-- Test number to English dollar and cents translation function
-- SQL convert number to text
SELECT NumberInEnglish=dbo.fnMoneyToEnglish ( 67)
-- Sixty-Seven Dollars and 0 Cents
SELECT NumberInEnglish=dbo.fnMoneyToEnglish ( 947.54)
-- Nine Hundred Forty-Seven Dollars and 54 Cents
SELECT NumberInEnglish=dbo.fnMoneyToEnglish ( 1266.04)
-- One Thousand Two Hundred Sixty-Six Dollars and 4 Cents
SELECT NumberInEnglish=dbo.fnMoneyToEnglish ( 4261.25)
-- Four Thousand Two Hundred Sixty-One Dollars and 25 Cents
SELECT NumberInEnglish=dbo.fnMoneyToEnglish ( 921456321.88)
/* Nine Hundred Twenty-One Million Four Hundred Fifty-Six Thousand
Three Hundred Twenty-One Dollars and 88 Cents */
GO
------------
-- SQL crosstab query with pivot and currency formatting
USE AdventureWorks;
-- SQL format money - money values in currency format
-- SQL money format - format purchase amount
-- SQL currency format - dollar format
WITH ctePurchaseSummary(OrderYear,PurchasingAgent,SubTotal)
     AS (SELECT Year(OrderDate),
                FirstName + ' ' + LastName,
                SubTotal
         FROM   Purchasing.PurchaseOrderHeader pod
                JOIN HumanResources.Employee e
                  ON pod.EmployeeID = e.EmployeeID
                JOIN Person.Contact c
                  ON e.ContactID = c.ContactID
         WHERE  pod.EmployeeID IS NOT NULL)
-- !! USE commented out query below to establish PIVOT list
-- SELECT DISTINCT OrderYear FROM ctePurchaseSummary
SELECT PurchasingAgent,
       '$' + Convert(VARCHAR,Isnull(pvt.[2001],0),1) AS [2001],
       '$' + Convert(VARCHAR,Isnull(pvt.[2002],0),1) AS [2002],
       '$' + Convert(VARCHAR,Isnull(pvt.[2003],0),1) AS [2003],
       '$' + Convert(VARCHAR,Isnull(pvt.[2004],0),1) AS [2004]
FROM   ctePurchaseSummary
       PIVOT
       (Sum(SubTotal)
        FOR OrderYear IN ( [2001],[2002],[2003],[2004] ) ) AS pvt
GO
/* Partial results

PurchasingAgent         2001        2002              2003                    2004
Annette Hill            $0.00       $413,492.82       $1,524,567.78     $3,300,836.09
Arvind Rao              $0.00       $213,779.08       $644,905.37       $1,836,735.27
Ben Miller              $0.00       $419,330.79       $1,314,197.33     $2,959,713.61
Eric Kurjan             $8,847.30   $274,629.19       $1,422,375.48     $4,577,239.22
Erin Hagens             $201.04     $227,578.27       $1,417,972.59     $3,384,343.91
Frank Pellow            $693.38     $389,803.98       $1,513,463.28     $4,026,137.08
*/
------------
------------
-- SQL right align numeric data
------------
-- SQL align numeric output - format money with thousand separators
-- SQL format money - align column right - format money with commas - right adjust
DECLARE @Width tinyint = 20;
SELECT   TOP ( 5 ) ProductName = Name,
                   [Price Aligned Right] =
    REPLICATE(' ',@Width - 1 - LEN(CONVERT(VARCHAR,ListPrice,1))) +
             '$' + CONVERT(VARCHAR,ListPrice,1)
FROM     AdventureWorks2008.Production.Product
WHERE    ListPrice > 0.0
ORDER BY NEWID()
GO
/* Results

ProductName                         Price Aligned Right
LL Fork                                         $148.22
Chain                                            $20.24
HL Touring Seat/Saddle                           $52.64
Road-450 Red, 44                              $1,457.99
LL Touring Frame - Yellow, 44                   $333.42
*/
------------
Related articles:

