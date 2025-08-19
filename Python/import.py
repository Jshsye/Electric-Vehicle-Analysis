# P1	Load and clean the data (handle nulls, date parsing)

import pandas as pd
import numpy as np
import matplotlib.pyplot as mlt

file= pd.read_csv('C:/Users/pavan/OneDrive/Desktop/EV_Db.csv')

pd.set_option('display.max_column', None)
# print(file.head(1))

print(file['EV_Sales_Quantity'].isnull().sum())

print(file.info())

print(file.describe())

print(file.isnull().sum())

file['Date']=pd.to_datetime(file['Date'], errors='coerce')
print(file['Date'])

print(file)
