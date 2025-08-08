CREATE TABLE ev(
			Year DATE,
			Month_Name CHAR(5),
			Date DATE,
			State VARCHAR(30),
			Vehicle_Class VARCHAR(40),
			Vehicle_Category VARCHAR(40) ,
			Vehicle_Type VARCHAR(40),
			EV_Sales_Quantity NUMERIC
				);


ALTER TABLE ev
ALTER COLUMN Year TYPE NUMERIC
USING extract(Year from Year)

ALTER TABLE ev
ALTER COLUMN Vehicle_class TYPE VARCHAR(70)

COPY ev(Year,	Month_Name,	Date,	State,	Vehicle_Class,	Vehicle_Category,	Vehicle_Type,	EV_Sales_Quantity)
FROM 'E:/New folder/EV_Db.CSV'
DELIMITER','
CSV HEADER;


-- 1] Total EV sales in India
SELECT State, SUM(EV_Sales_Quantity)AS Total_sales_qty
FROM ev
GROUP BY State;


-- S2	EV sales year-wise (group by year)

SELECT Year, SUM(EV_Sales_Quantity)AS Tota_sales_qty
FROM ev
GROUP BY Year;

-- answer:
		
		"year"	"tota_sales_qty"
		2024	163312
		2021	436191
		2022	1123449
		2019	340420
		2018	301648
		2023	1622889
		2016	189775
		2014	123827
		2015	141433
		2017	258593
		2020	269645


-- S3	Top 5 states with highest total EV sales

SELECT State, SUM(EV_Sales_Quantity)AS Total_sales_qty
FROM ev
GROUP BY State
ORDER BY Total_sales_qty DESC LIMIT 5;

-- Answer:
		
		"state"				"total_sales_qty"
		"Uttar Pradesh"		794018
		"Maharashtra"		470787
		"Karnataka"			378215
		"Rajasthan"			292809
		"Delhi"				289445


-- S4	Vehicle type contributing highest sales in 2023

SELECT  Year, Vehicle_Type, SUM(EV_Sales_Quantity) AS total_sales_qty
FROM ev
WHERE Year = 2023
GROUP BY Year, Vehicle_Type
ORDER BY total_sales_qty DESC;

-- Answer:
			
			"year"	"vehicle_type"			"total_sales_qty"
			2023	"2W_Personal"			860481
			2023	"3W_Shared_LowSpeed"	473866
			2023	"Others"				72833
			2023	"4W_Personal"			71796
			2023	"3W_Shared"				49948
			2023	"3W_Goods_LowSpeed"		35253
			2023	"3W_Goods"				25632
			2023	"4W_Shared"				12755
			2023	"Bus"					12032
			2023	"2W_Shared"				4300
			2023	"Institution Bus"		3164
			2023	"3W_Personal"			829


-- S5	EV sales for each state in the year 2022

SELECT Year, State, SUM(EV_Sales_Quantity)AS Total_sales_qty
FROM ev
WHERE Year= 2022
GROUP BY State, YEAR;


-- ANSWER:
				
				"year"	"state"				"total_sales_qty"
				2022	"Uttarakhand"			18582
				2022	"Jharkhand"				16435
				2022	"Rajasthan"				82672
				2022	"Maharashtra"			140407
				2022	"Bihar"					58023
				2022	"Gujarat"				73299
				2022	"Punjab"				16524
				2022	"Puducherry"			3176
				2022	"Himachal Pradesh"		4067
				2022	"Nagaland"				1995
				2022	"Karnataka"				100385
				2022	"Kerala"				43882
				2022	"Delhi"					63273
				2022	"Assam"					44200
				2022	"West Bengal"			15711
				2022	"Mizoram"				1954
				2022	"Andhra Pradesh"		32571
				2022	"Haryana"				29689
				2022	"Madhya Pradesh"		40561
				2022	"Tripura"				5909
				2022	"Tamil Nadu"			70438
				2022	"Sikkim"				1795
				2022	"Chhattisgarh"			25793
				2022	"Jammu and Kashmir"		7570
				2022	"DNH and DD"			2274
				2022	"Chandigarh"			3938
				2022	"Andaman & Nicobar Island"	1403
				2022	"Goa"					7957
				2022	"Odisha"				32548
				2022	"Meghalaya"				2429
				2022	"Uttar Pradesh"			167003
				2022	"Ladakh"				1982
				2022	"Manipur"				2191
				2022	"Arunachal Pradesh"		2813



-- S6	Monthly trend of EV sales for Karnataka

SELECT Month_name, State, SUM (EV_Sales_Quantity)AS Total_sales_qty
FROM ev
WHERE State= 'Karnataka'
GROUP BY Month_name, State

-- answer:
		
		"month_name"	"state"			"total_sales_qty"
		"oct  "			"Karnataka"			29879
		"apr  "			"Karnataka"			30113
		"jul  "			"Karnataka"			30050
		"may  "			"Karnataka"			30700
		"nov  "			"Karnataka"			33112
		"jan  "			"Karnataka"			43297
		"dec  "			"Karnataka"			28038
		"aug  "			"Karnataka"			32023
		"jun  "			"Karnataka"			23328
		"mar  "			"Karnataka"			33155
		"sep  "			"Karnataka"			31138
		"feb  "			"Karnataka"			33382


-- S7	EV category-wise sales contribution across all years

SELECT  Year, Vehicle_category, SUM(EV_Sales_Quantity)AS Total_sales_qty
FROM ev
GROUP BY  Vehicle_category, Year
ORDER BY Year, Vehicle_category;


-- S8	Compare EV sales for "Ambulance" vs "Bus" across years

SELECT Year, Vehicle_class, SUM(EV_Sales_Quantity) AS Total_sales_qty
FROM Ev
WHERE Vehicle_class   LIKE 'AMBULANCE' OR Vehicle_class  LIKE 'BUS'
GROUP BY Year, Vehicle_class;

-- answer:
		
		"year"	"vehicle_class"	"total_sales_qty"
		2018	"AMBULANCE"			6284
		2016	"AMBULANCE"			5492
		2020	"AMBULANCE"			5490
		2024	"AMBULANCE"			957
		2017	"AMBULANCE"			6285
		2020	"BUS"				5838
		2015	"BUS"				6046
		2017	"BUS"				7507
		2024	"BUS"				1149
		2016	"BUS"				6403
		2014	"AMBULANCE"			4706
		2021	"BUS"				5357
		2019	"BUS"				7714
		2018	"BUS"				7397
		2022	"BUS"				5751
		2019	"AMBULANCE"			6388
		2022	"AMBULANCE"			4915
		2023	"AMBULANCE"			4817
		2014	"BUS"				5439
		2015	"AMBULANCE"			5081
		2021	"AMBULANCE"			4835	
		2023	"BUS"				6669





-- S9	List of states where EV sales were zero in any month

SELECT Month_name, State, EV_sales_quantity
FROM ev
WHERE EV_sales_quantity = 0;


-- S10	Highest EV sales quantity ever recorded and its details

SELECT Year, Month_Name, Date, State, Vehicle_class, Vehicle_category, Vehicle_Type, SUM(EV_sales_Quantity)AS total_salesqty
FROM ev
GROUP BY Year, Month_name, Date, State, Vehicle_class, Vehicle_category, Vehicle_type
ORDER BY total_salesqty DESC 