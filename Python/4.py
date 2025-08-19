# P7	Groupby analysis: Vehicle type sales per year

import pandas as pd

file= pd.read_csv('C:/Users/pavan/OneDrive/Desktop/EV_Db.csv')
pd.set_option('display.max_column', None)


vehicle_sales_Year= file.groupby(['Year', 'Vehicle_Type'])['EV_Sales_Quantity'].sum()

vehicle_sales_index= vehicle_sales_Year.reset_index()

print(vehicle_sales_index)


#     Year       Vehicle_Type  EV_Sales_Quantity
# 0    2014        2W_Personal              12868
# 1    2014          2W_Shared               1134
# 2    2014           3W_Goods               4296
# 3    2014  3W_Goods_LowSpeed                 57
# 4    2014        3W_Personal               1687
# ..    ...                ...                ...
# 127  2024        4W_Personal               6713
# 128  2024          4W_Shared               2014
# 129  2024                Bus               2288
# 130  2024    Institution Bus                627
# 131  2024             Others              15029

# [132 rows x 3 columns]