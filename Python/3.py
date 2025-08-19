# P6	Pie chart: Distribution of EV vehicle types

import pandas as pd
import matplotlib.pyplot as plt

file= pd.read_csv('C:/Users/pavan/OneDrive/Desktop/EV_Db.csv')
pd.set_option('display.max_column', None)
print(file.head(1))

vehicle_type_sales= file.groupby('Vehicle_Type')['EV_Sales_Quantity'].sum().sort_values(ascending=False).head(5)

plt.pie(vehicle_type_sales.values, labels=vehicle_type_sales.index, autopct='%1.1f%%')
plt.title('Vehicle type sales')
plt.legend()
plt.tight_layout()
plt.savefig('Pie Charts.png')
plt.show()