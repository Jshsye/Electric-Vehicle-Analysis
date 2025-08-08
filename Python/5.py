# P8	Time-series: EV sales in Maharashtra over years
import pandas as pd

file= pd.read_csv('C:/Users/pavan/OneDrive/Desktop/EV_Db.csv')
pd.set_option('display.max_column', None)


maharstra= file[file['State']== 'Maharashtra']

sales_year= maharstra.groupby('Year')['EV_Sales_Quantity'].sum().reset_index()


import matplotlib.pyplot as plt

plt.plot(sales_year['Year'], sales_year['EV_Sales_Quantity'], color= 'red', marker='*')
plt.title('Sales in Maharastra Over Years')
plt.xlabel('Year')
plt.ylabel('Sales')
plt.grid()
plt.tight_layout()
plt.savefig('Sales_trend.png')
plt.show()