# -*- coding: utf-8 -*-
"""
Created on Wed Sep 14 15:13:44 2022

@author: H204095
"""
!pip install pyarrow

import findspark
findspark.init()

import pandas as pd
import numpy as np
from pyspark import SparkContext, SparkConf
from pyspark.sql import SparkSession

#exercise 1 -spark session
#task 1 creating the spark session and context

sc = SparkContext()
spark = SparkSession.builder.appName("python spark dataframes basic example").config("spark.some.config.option", "some-value").getOrCreate()

spark

mtcars = pd.read_csv('https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-BD0225EN-SkillsNetwork/labs/data/mtcars.csv')
mtcars.head()

mtcars.rename( columns={'Unnamed: 0':'name'}, inplace=True )

sdf = spark.createDataFrame(mtcars)
sdf.printSchema()

sdf.createTempView("cars")

spark.sql("select * from cars").show()
spark.sql("select mpg from cars").show(5)
spark.sql("select * from cars where mpg > 20 and cyl < 6").show()
spark.sql("select * from cars where mpg > 20 and cyl >= 6").show()

from pyspark.sql.functions import pandas_udf, PandasUDFType
@pandas_udf("float")
def convert_wt(s: pd.Series) -> pd.Series:
    return s * 0.45
spark.udf.register("convert_weight", convert_wt)

spark.sql("select *, wt as weight_imperial, convert_weight(wt) as weight_metirc from cars").show()

@pandas_udf("string")
def convert_cyl(s: pd.Series) -> pd.Series:
    return pd.Series(np.where(s <= 4, 'Sedan', np.where(s <=6, 'Mid SUV', 'Full SUV')))
spark.udf.register("convert_cyl", convert_cyl)
spark.sql("select *, cyl as cylnumeirc, convert_cyl(cyl) as cyl_string from cars").show()

spark.sql("select *, cyl as cylnumeirc, max(drat, wt, qsec) as cyl_string from cars").show()

#cuft
@pandas_udf("float")
def cuft(s1: pd.Series, s2: pd.Series, s3: pd.Series) -> pd.Series:
    v = s1 * s2 * s3 / 1728
    return v

spark.udf.register("cuft", cuft)
spark.sql("select *, cyl as cylnumeirc, cuft(drat, wt, qsec) as cuft from cars").show()

spark.sql("select *, cyl as cylnumeirc, max(drat, wt, qsec) as cyl_string from cars").show()
#max dim, min dmi, mid dim
@pandas_udf("float")
def maxdim(s1: pd.Series, s2: pd.Series, s3: pd.Series) -> pd.Series:
    return pd.Series(np.where((s1 >= s2) & (s1 >= s3), s1, np.where((s2 >= s1) & (s2 >= s3), s2, s3)))
spark.udf.register("maxdim", maxdim)
@pandas_udf("float")
def mindim(s1: pd.Series, s2: pd.Series, s3: pd.Series) -> pd.Series:
    return pd.Series(np.where((s1 <= s2) & (s1 <= s3), s1, np.where((s2 <= s1) & (s2 <= s3), s2, s3)))
spark.udf.register("mindim", mindim)
@pandas_udf("float")
def middim(s1: pd.Series, s2: pd.Series, s3: pd.Series) -> pd.Series:
    return pd.Series(np.where(((s2 <= s1) and (s1 <= s3)) or ((s3 <= s1) and (s1 <= s2)), s1, np.where(((s1 <= s2) and (s2 <= s3)) or ((s3 <= s2) and (s2 <= s1)), s2, s3)))
spark.udf.register("middim", middim)

spark.sql("select *, cyl as cylnumeirc, middim(drat, wt, qsec) as length from cars").show()


spark.sql("select *, cyl as cylnumeirc, maxdim(drat, wt, qsec) as length, middim(drat, wt, qsec) as weidth, mindim(drat, wt, qsec) as height from cars").show()
#single multi

#question 1
spark.sql("select * from cars where substring(name, 0, 4) = 'Merc'").show()
spark.sql("select * from cars where name like 'Merc%'").show()

#question 2
@pandas_udf("float")
def convert_mileage(s: pd.Series) -> pd.Series:
    # The formula for converting from imperial to metric tons
    return s * 0.425

spark.udf.register("convert_mileage", convert_mileage)

spark.sql("SELECT *, mpg AS mpg, convert_weight(mpg) as kmpl FROM cars").show()



