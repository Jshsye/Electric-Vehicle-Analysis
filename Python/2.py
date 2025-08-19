# P4	Bar plot: Top 10 states by total EV sales

import pandas as pd
import matplotlib.pyplot as plt

file= pd.read_csv('C:/Users/pavan/OneDrive/Desktop/EV_Db.csv')
pd.set_option('display.max_column', None)

sales_state= file.groupby('State')['EV_Sales_Quantity'].sum().sort_values(ascending=False).head(10)

plt.bar(sales_state.index, sales_state.values, color= 'blue')
plt.xlabel('Top-10 States')
plt.ylabel('Total Sales')
plt.title('Top-10 States')
plt.grid()
plt.tight_layout()
plt.savefig('Top 10 States.png')
plt.show()
