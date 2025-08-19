# P3	Line chart: Total EV sales per year

import pandas as pd
import matplotlib.pyplot as plt

file= pd.read_csv('C:/Users/pavan/OneDrive/Desktop/EV_Db.csv')

pd.set_option('display.max_column', None)
print(file.head(1))

sales_trend= file.groupby('Year')['EV_Sales_Quantity'].sum().sort_index()

plt.plot(sales_trend.index, sales_trend.values, marker='+', color='Red')
plt.xlabel('Year')
plt.ylabel('Sales_qty')
plt.title('Sales Trend')
plt.grid()
plt.tight_layout()
# plt.savefig("Sales Trends.png")
plt.show()