-- Making a join where columns are not duplicated
SELECT
 Res.Customer_Name,
 Food_Item,
 Category,
 Quantity,
 Price,
 Payment_Method,
 Location,
 Distance_covered,
 Order_ID,
 Res.Order_Time
 FROM restaurant_order_1 Res
JOIN delivery_details_1 Del
  ON Res.Order_Time = Del.Order_Time
  Order by Customer_Name;
  
  -- Named the join - Aj restaurant joined
  Select* from aj_restaurant_joined;
  
  -- collected data where distances were far and returns low
  Select* from aj_restaurant_joined
  Where Distance_covered > 4.0 and Price < 4.0
  Order by Customer_Name;
  
  -- Identified the most payment method customers used
  Select Payment_Method, count(Payment_Method) As Frequency
  From aj_restaurant_joined
  Group by Payment_Method
  Order by Frequency Desc;
  
  -- Ascertained the location with the highest patronage
  Select Location, count(Location) As Frequency,
  Max(Distance_Covered) As Farthest_Distance
  From aj_restaurant_joined
  group by Location
  Order by Frequency desc;
  
  -- Summed up sales across different locations and rounded
  -- up results in two decimal placs
  Select Round(Sum(price),2) As Sales,
  Location
  From aj_restaurant_joined
  group by Location
  Order by Sales desc;
  
  -- Being the location with the longest distant and also highest sales record
  -- payment method was sought
  Select Payment_Method, count(Location) As Marietta
  From aj_restaurant_joined
  Where Location = 'Marietta'
  Group by Payment_Method
  Order by Marietta Desc;
  
  -- Ascertained what food that was ordered the most
  Select Food_Item, count(Food_Item) As Total_Food_Item
  From aj_restaurant_joined
  Group by Food_Item
  Order by Total_Food_Item Desc;
  
  -- Determined what category of food most sought by customers
  Select Category,
  count(Category) as Demanded
  From aj_restaurant_joined
  Group by Category
  Order by Demanded Desc;
  
-- Summed sales accordding to months
  select
  date_format(Order_Time, '%M %Y') As Month_Year,
  round(sum(Price), 2) As Total_Sales,
  Count(*) As Total_Orders
  From aj_restaurant_joined
  Group by date_format(Order_Time, '%Y %m'), Month_Year
  Order by date_format(Order_Time, '%Y %m');
  
  -- Grouped Food Items
  Select Category, sum(Quantity) As Quantity,
  group_concat(distinct Food_Item order by Food_Item SEPARATOR ',') As Foods
    from aj_restaurant_joined
  group by Category;

-- crosschecked for Time and Price relationship for
-- selected Food Item
  Select
  hour(Order_Time) As Hour_Of_Day,
  round(AVG(Price), 2) As AVG_Price,
  Count(*) As Num_Sales
  From aj_restaurant_joined
  Where Food_Item = 'Pasta'
  group by Hour(Order_Time)
  Order by Hour_Of_Day;


 Select
  hour(Order_Time) As Hour_Of_Day,
  round(AVG(Price), 2) As AVG_Price,
  Count(*) As Num_Sales
  From aj_restaurant_joined
  Where Food_Item = 'Pizza'
  group by Hour(Order_Time)
  Order by Hour_Of_Day;

   Select
  hour(Order_Time) As Hour_Of_Day,
  round(AVG(Price), 2) As AVG_Price,
  Count(*) As Num_Sales
  From aj_restaurant_joined
  Where Food_Item = 'Ice cream'
  group by Hour(Order_Time)
  Order by Hour_Of_Day;

-- crosschecked for Price and quantity relationship
  Select Quantity,
 Round(AVG(Price), 2) As AVG_Price,
  count(*) As Num_Rows
 From aj_restaurant_joined
 Group by Quantity
  Order by Quantity;
  
  