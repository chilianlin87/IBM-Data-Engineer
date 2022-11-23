# -*- coding: utf-8 -*-
"""
Created on Thu Jul  8 14:22:41 2021

@author: H204095
"""

pip install pyspark
pip install findspark


df = itemmastercubesample.pivot(index='Sku', columns='PickType', values=['ItemType', 'CasePack', 'Length', 'Width', 'Height', 'Cubic', 'Weight', 'Misflag', 'Convey', 'RepackYN', 'Fragile']) #pivot table, map names
df.columns = list(map("_".join, df.columns)) #pivot table, map names


df1 = itemmastersample[['Sku']] #test two table's skus match, example from hobby lobby
df1['Sample'] = 1 #test two table's skus match, example from hobby lobby
df1.drop_duplicates(inplace = True) #test two table's skus match, example from hobby lobby
df2 = itemmastercubesample[['Sku']] #test two table's skus match, example from hobby lobby
df2['CubeSample'] = 1 #test two table's skus match, example from hobby lobby
df2.drop_duplicates(inplace = True) #test two table's skus match, example from hobby lobby
df3 = pd.merge(df1, df2, on = 'Sku', how = 'outer') #test two table's skus match, example from hobby lobby 
df3.groupby(['Sample', 'CubeSample'], dropna=False)['Sku'].count() #test two table's skus match, example from hobby lobby

print([item for item in dir() if not item.startswith("__")])



import subprocess as sp #clear console
tmp = sp.call('cls',shell=True) #clear console

#delete global variables in variable explorer
lst1 = []
for i in range(len(dir())):
    if dir()[i][0] != '_':
        lst1.append(dir()[i])
lst2 = ['Accidents', 'In', 'Out', 'exit', 'get_ipython', 'lst1', 'lst2', 'quit', 'population', 'taxreturn']

def Diff(li1, li2):
    return list(set(li1) - set(li2)) + list(set(li2) - set(li1))
for items in Diff(lst1, lst2):
    del globals()[items]



parcel_detail['Date'] = pd.to_datetime(parcel_detail['PickDate']).dt.date #change date format


one.FullCaseOrRepack.replace(r'^\s*$', np.nan, regex=True, inplace = True) #replace blank with nan


storagepicksql.groupby(['PickDate']).agg({'SKU': ['nunique'],'Pallets': ['sum'], 'QuantityCS': ['sum'],})
df.columns = df.columns.map('_'.join) #aggregate multiple columns
df.reset_index(inplace = True) #reset index
# for loop to do n by n merge


#use for loop to do the n by n merge
df = pd.DataFrame()
for stores in puttolight.StoreNumber.unique():
    df1 = puttolight[puttolight.StoreNumber == stores]
    df2 = putlocationmapping[putlocationmapping.StoreNumber == stores]
    if len(df2) == 0:
        df1['Zone'] = np.nan
        df1['Trunk'] = np.nan
    else:
        df3 = pd.concat([df2] * math.ceil(len(df1) / len(df2)))
        df3 = df3[:len(df1)]
        df1['Zone'] = [x for x in df3.Zone]
        df1['Trunk'] = [x for x in df3.Trunk]
    df = df.append(df1)

#test it
one = df[['StoreNumber', 'Zone', 'Trunk']]
one.drop_duplicates(inplace = True)
one['forloop'] = 1
two = putlocationmapping.copy()
two['original'] = 1
three = pd.merge(one, two, on = ['StoreNumber', 'Zone', 'Trunk'], how = 'outer')
three.to_csv('C:/Intelligrated/2021 Projects/Hobby Lobby MQ21-00062/Analysis/test.csv')
# the for loop n by n merge is right


puttolight['nthcarton'] = puttolight.groupby(['StoreNumber', 'OutboundCartonID']).ngroup() # nth group, each group give it a unique sequence seq number


putlocationmapping['outlines'] = putlocationmapping.groupby(['StoreNumber'])['OutbLine'].transform('count') # groupby agg then add back to the dataframe

putlocationmapping['nthoutline'] = putlocationmapping.groupby(['StoreNumber'])['OutbLine'].transform('cumcount') # each group, give each line a sequence seq number
bufferscans['barcodeseq'] = bufferscans.groupby(['Barcode'])['seconds'].transform('cumsum')


topskuorders['Skus'] = df.groupby(['OrderNo'])['Sku'].transform(lambda x: ','.join(x)) # combine all skus in an order, then split them to individual skus
df2 = pd.concat([pd.Series(row['Orders'], row['Skus'].split(',')) for _, row in df.iterrows()]).reset_index() # combine all skus in an order, then split them to individual skus

#function to do single multi

bufferscans['Date'] = bufferscans['eventtime'].dt.date #datetime to date, m8 ns to date
bufferscans['Time'] = bufferscans['eventtime'].dt.time #datetime to time, datetime to timestamp
bufferscans['Hour'] = bufferscans['eventtime'].dt.hour #datetime to hour
bufferscans['seconds'] = [x.total_seconds() for x in bufferscans.timedeltaseconds] #time delta to seconds total seconds
bufferscans.drop(['DateTime'], axis = 1, inplace = True) #pandas dataframe drop column by name, delete column by name
df.groupby('kind').agg(min_height=('height', 'min'), max_weight=('weight', 'max'))

df['column'] = df['column'].astype('str') #object column to str string
df['column'] = df['column'].astype('|S80') #where the max length is set at 80 bytes, object column to str string
df['column'] = df['column'].astype('|S') # which will by default set the length to the max len it encounters, object column to str string
bufferscans['timedeltaseconds'] = bufferscans[['eventtime']].diff() #difference between rows, row and above row
mask = bufferscans.Barcode != bufferscans.Barcode.shift(1) ; bufferscans['seconds'][mask] = 0 #find out the first for each group, the first row of each group
bufferscans['BarcodeNew'] = bufferscans['Barcode'] + '-' + bufferscans['barcodeseq'].astype('str') #concatenate columns combine columns to create new column str
