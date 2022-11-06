# -*- coding: utf-8 -*-
"""
Created on Tue Sep 13 09:09:01 2022

@author: H204095
"""

!pip install pyspark
!pip install findspark

import os
os.chdir("C:\\Users\\h204095\\Desktop\\IBM-Data-Engineering\\Coursera\\Big-Data-with-Spark-and-Hadoop\\data\\")
import findspark
findspark.init()

from pyspark import SparkContext, SparkConf #PySpark is the Spark API for python
from pyspark.sql import SparkSession

#task 1 creating the spark session and context
#creating a spark context class
sc = SparkContext()

#creating a spark session
spark = SparkSession \
        .builder \
        .appName("Python Spark DataFrames Basic Example") \
        .config("spark.some.config.option", "some-value") \
        .getOrCreate()

#task 2 initialize Spark Session

spark


#Exercise 2: RDDs
#task 1: create an RDD

data = range(1, 30)
print(list(data))
len(data)
xrangeRDD = sc.parallelize(data, 4)
xrangeRDD

#task 2: transformations

subRDD = xrangeRDD.map(lambda x: x-1)
filteredRDD = subRDD.filter(lambda x: x<10)

#task 3: actions
print(filteredRDD.collect())
filteredRDD.count()


#task 4: caching data

import time

test = sc.parallelize(range(1, 50000), 4)
test.cache()

t1 = time.time()
#first count will trigger evaluation of count *and* cache
count1 = test.count()
dt1 = time.time() - t1
print("dt1", dt1)

t2 = time.time()
#second count operates on cached data only
count2 = test.count()
dt2 = time.time() - t2
print("dt2", dt2)
#test.count()

import time

test = sc.parallelize(range(1,50000),4)
test.cache()

t1 = time.time()
# first count will trigger evaluation of count *and* cache
count1 = test.count()
dt1 = time.time() - t1
print("dt1: ", dt1)


t2 = time.time()
# second count operates on cached data only
count2 = test.count()
dt2 = time.time() - t2
print("dt2: ", dt2)

#test.count()

#Exercise 3: DataFrames and SparkSQL

spark

#task 1, create your first DataFrame

!curl https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-BD0225EN-SkillsNetwork/labs/data/people.json > people.json

df = spark.read.json("C:\\Users\\h204095\\Desktop\\IBM-Data-Engineering\\Coursera\\Big-Data-with-Spark-and-Hadoop\\data\\people.json").cache()

#df.unpersist()
df.show()
df.printSchema()

#register the DataFrame as a SQL temporary view
df.createTempView("people")

#task 2: explore the data using DataFrame functions and SparkSQL
#select and show basic data columns

df.select("name").show()
df.select(df["name"]).show()
spark.sql("SELECT name FROM people").show()

#perform basic filtering

df.filter(df["age"] > 21).show()
spark.sql("SELECT age, name FROM people WHERE age > 21").show()

#perform basic aggregation of data

df.groupby("age").count().show()
spark.sql("select age, count(name) as count from people group by age").show()

#question 1
data = range(1, 50)
print(list(data))
len(data)
xrangeRDD = sc.parallelize(data, 4)
xrangeRDD


subRDD = xrangeRDD.map(lambda x: x*2)

print(subRDD.collect())
subRDD.count()

#question 2
!curl https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-BD0225EN-SkillsNetwork/labs/people2.json >> people2.json

df2 = spark.read.json("C:\\Users\\h204095\\Desktop\\IBM-Data-Engineering\\Coursera\\Big-Data-with-Spark-and-Hadoop\\data\\people2.json").cache()

df.show()
df.printSchema()

df.createTempView("people2")

df.select("name").show()
df.select(df["name"]).show()
spark.sql("SELECT name FROM people2").show()

spark.sql("SELECT avg(age) FROM people2").show()

#question 3
spark.stop()
