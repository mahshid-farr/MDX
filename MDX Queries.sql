
select [Measures].[Internet_Sales Amount] on columns,
       [Dim Product].[Products] on rows
from [Adventure Works DW2017]


select
{
(
 [Measures].[Internet_Sales Amount]
)
,
(
[Measures].[Reseller_Sales Amount]
)
} on columns,
[Dim Product].[Products]on rows
from [Adventure Works DW2017]


with member measures.[Total Sales] as 

([Measures].[Internet_Sales Amount] + [Measures].[Reseller_Sales Amount])

select measures.[Total Sales] on columns,

[Dim Product].[Products] on rows

from [Adventure Works DW2017]


select [Measures].[Reseller_Sales Amount] on columns,
order
(
[Dim Reseller].[Business Types].[Business Type]
,[Measures].[Reseller_Sales Amount]
,desc
)on rows
from [Adventure Works DW2017]


with member measures.[Reseller Totals] as
[Measures].[Reseller_Sales Amount], FORMAT_STRING = "$#,##.00;($#,##.00);$#,##.00;$0.00"
Select measures.[Reseller Totals] on columns,
order
(
[Dim Reseller].[Business Types].[Business Type]
,measures.[Reseller Totals]
,desc
)on rows
from [Adventure Works DW2017]

/*with member [Measures].[NonEmpty reseller] AS
COALESCEEMPTY( [Measures].[Reseller_Sales Amount], '$0.00')
select [Measures].[NonEmpty reseller] on columns,
order
(
[Dim Reseller].[Business Types].[Business Type]
,[Measures].[Reseller_Sales Amount]
,desc
)on rows
from [Adventure Works DW2017]*/

/*WITH MEMBER [Measures].[NonEmpty reseller] AS 
  IIF(
     ISEMPTY([Measures].[Reseller_Sales Amount])
     ,"$0.00"
     , [Measures].[Reseller_Sales Amount]
  )
select [Measures].[NonEmpty reseller]on columns,
order
(
[Dim Reseller].[Business Types].[Business Type]
,[Measures].[Reseller_Sales Amount]
,desc
)on rows
from [Adventure Works DW2017]*/


select 
[Measures].[Reseller_Sales Amount] on columns,
topcount ([Dim Reseller].[Business Types].[Reseller Name].members, 5, [Measures].[Reseller_Sales Amount]) on rows
from [Adventure Works DW2017]


with member measures.[Total Sales] as 

([Measures].[Internet_Sales Amount] + [Measures].[Reseller_Sales Amount])

select measures.[Total Sales] on columns,

topcount ([Dim Product].[Products].[English Product Name], 10, measures.[Total Sales]) on rows

from [Adventure Works DW2017]
