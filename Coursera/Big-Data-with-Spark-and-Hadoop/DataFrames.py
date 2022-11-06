# -*- coding: utf-8 -*-
"""
Created on Wed Sep 14 13:23:36 2022

@author: H204095
"""

import findspark
findspark.init()

import pandas as pd
from pyspark import SparkContext, SparkConf
from pyspark.sql import SparkSession

#exercise 1 spark session
#task 1 creating the spark session and context

sc = SparkContext()
spark = SparkSession.builder.appName("Python Spark DataFrames basic example").config("spark.some.config.option", "some-value").getOrCreate()

#task2 initilize spark session
spark

#exercise 2 load the data and Spark DataFrame

#task 1 load data into pandas dataframe
# Read the file using `read_csv` function in pandas
mtcars = pd.read_csv('https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-BD0225EN-SkillsNetwork/labs/data/mtcars.csv')

mtcars.head()
#task 2 loading data into spark dataframe

sdf = spark.createDataFrame(mtcars)
sdf.printSchema()

#exercise 3 basic data analysis and manipulation
#task 1 displays the content of the dataframe
sdf.show(5)
sdf.select('mpg').show(5)

#task 2 filtering and columnar operations
sdf.filter(sdf['mpg'] < 18).show(5)
sdf.withColumn('wtTon', sdf['wt'] * 0.45).show(5)
sdf.groupby(['cyl']).agg({"wt": "AVG"}).show(5)
sdf.groupby(['cyl']).agg({'wt': 'count'}).sort('count(wt)', ascending = False).show(5)

#question1
sdf.filter(sdf['cyl'] >= 5).show(5)

#question 2
sdf.printSchema()
sdf.withColumn('wtTon', sdf['wt'] * 0.45).agg({'wtTon': 'avg'}).show()
sdf.withColumn('kmpl', sdf['mpg'] * 0.425).sort('kmpl', ascending = False).show(5)









