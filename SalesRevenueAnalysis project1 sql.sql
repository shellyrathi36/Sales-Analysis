create database Sales;
use Sales;
use queries;
Select * from sales_data;

-- getting the sales based on Product Code
select PRODUCTCODE,
       sum(SALES) as TotalSale
       from sales_data
       group by PRODUCTCODE
       order by TotalSale desc;
-- can conclude that 'S18_3232' product code has got '288245.4199999999' highest sales 

-- getting the sales based on year and month
select YEAR_ID,
MONTH_ID, sum(SALES) as TotalMonthlySale
from sales_data
group by YEAR_ID, MONTH_ID;

-- getting the Sales Based on the ProductLine
Select PRODUCTLINE, Sum(SALES) as TotalsalesofProduct
from sales_data
group by PRODUCTLINE
Order by TotalsalesofProduct desc;
-- can conclude that the most product sold is Classic Car type 
-- and the least sold is of train type

-- getting the Sales Based on the Country 
Select COUNTRY, Sum(SALES) as TotalSalesinCountry
from sales_data
group by COUNTRY
order by TotalSalesinCountry desc;
-- In USA the products are most sold

-- Th product type in a specific country
Select COUNTRY,PRODUCTLINE, Sum(SALES) as TotalSalesinCountry
from sales_data
group by COUNTRY, PRODUCTLINE
order by TotalSalesinCountry desc;
-- in usa and the most sold product is classic Cars

-- SET SQL_SAFE_UPDATES = 1;
-- Update sales_data set TERRITORY='Unknown'
-- where TERRITORY is  null;

-- getting the data for the total sales in a city for a specific product
Select CITY,PRODUCTLINE, Sum(SALES) as TotalSalesinCity
from sales_data
group by CITY, PRODUCTLINE
order by TotalSalesinCity desc;

-- getting the data for a country city and a specific product sales 
Select COUNTRY, CITY,PRODUCTLINE, Sum(SALES) as TotalSalesinCity
from sales_data
group by COUNTRY,CITY, PRODUCTLINE
order by TotalSalesinCity desc;
-- getting the result in spain in madrid the sales od Classsic Cars is the Highest

Select YEAR_ID, CITY,PRODUCTLINE, Sum(SALES) as TotalSalesinCity
from sales_data
group by YEAR_ID,CITY, PRODUCTLINE
order by TotalSalesinCity desc;
-- THE sales of the Classic Cars is again the highest in Madrid Itself

Select CITY,PRODUCTLINE, Sum(SALES) as TotalSalesinCity, AVG(SALES) as AverageSalesinCity
from sales_data
group by CITY, PRODUCTLINE
order by AverageSalesinCity desc;
-- the average sales of Classic Cars in Torino city is more.

Select * from sales_data;

-- getting the Data for whether the Products are sold or not
SELECT STATUS, count(*) as Statusofpdts
from sales_data
Group by STATUS;

SELECT COUNTRY, PRODUCTLINE, Count(*) as TotalCount
from sales_data
Group by COUNTRY, PRODUCTLINE
order by TotalCount desc;

-- getting the data of a particular customer totalspending
SELECT CUSTOMERNAME, Sum(SALES) as TotalSpending
From sales_data
Group by CUSTOMERNAME
Order by TotalSpending desc
LIMIT 5; -- this will the lomit the result to only 5 rows in the dataset

-- to transfer the data into a file 
Show Variables like 'secure_file_priv';

SELECT CUSTOMERNAME, Sum(SALES) as TotalSpending
into outfile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\SalesDataa.csv'
Fields terminated by','
Lines terminated by '\n'
From sales_data
Group by CUSTOMERNAME
Order by TotalSpending desc; 