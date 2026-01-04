# Healthcare analytics (sql and power bi).
## **Connection**
- In the home tab click get data 
- Click more
- Select data
- Select postgresql database
- Click the connect button
- specify the server and database
- select ok
- Select the tables and click ok

## **Cleaning**
In Power Query(transform data): 
o Rename columns to readable names.

 - Double click the title to rename it in title case then click enter.
 
o Set correct data types: dates to Date, amounts to Decimal Number, IDs to Text. 

- Select the column
- In the home tab go to Data Type and specify the data type

o Trim/clean text, replace blanks with nulls where appropriate. 

- Select the column whose values you want replaced
- In the home tab select replace values and specify the value to be replaced with what it should be replaced with 
- Click ok

o Create (if needed) a Year, Month, and Year-Month text column for easy visuals. 

- Underthe add column tab
- Select custom column
- Specify the column name in the 'new column name' namebox.
- In the custom column formula;
```
Year = YEAR([AppointmentDate])
Month = MONTH([AppointmentDate])
MonthName = FORMAT([AppointmentDate], "MMMM")
YearMonth = [Year] & "-" & FORMAT([Month], "00")
```
o Close & Apply.

## **Modeling Choices**

- Create a date table by merging the appointments enrinched table and doctor monthly metrics table
- Create a relationship between the date table and appointments enriched table 
How to create a relationship between the tables

1. Go to the model view
2. Click the three dots on the top-right of the data table
3. Click manage relationships
4. Click new relationship
5. Under the from table, select date, select date column
6. Under the to table, select appointments enriched, select Appointment Date column
7. Cardinality: Many to many
8. Cross filter direction :Single
9. Click save the button


## **Dashboard Screenshots**

![Image description](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/zbndui5zlrs2eds0xm9d.PNG)
> _excecutive overview report_

![Image description](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/vs5yo3i2k449ndyiuqo6.PNG)
> _appointments analysis report_

![Image description](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/o57rx8xn4goddq506v4d.PNG)
> _financials report_
