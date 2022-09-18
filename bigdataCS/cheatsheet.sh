Download hadoop-3.2.3.tar.gz to your theia environment by running the following command.
curl https://dlcdn.apache.org/hadoop/common/hadoop-3.2.3/hadoop-3.2.3.tar.gz --output hadoop-3.2.3.tar.gz
Extract the tar file in the currently directory.
tar -xvf hadoop-3.2.3.tar.gz
Navigate to the hadoop-3.2.3 directory.
cd hadoop-3.2.3
Check the hadoop command to see if it is setup. This will display the usage documentation for the hadoop script.
bin/hadoop
Run the following command to download data.txt to your current directory.
curl https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-BD0225EN-SkillsNetwork/labs/data/data.txt --output data.txt
Run the Map reduce application for wordcount on data.txt and store the output in /user/root/output
bin/hadoop jar share/hadoop/mapreduce/hadoop-mapreduce-examples-3.2.3.jar wordcount data.txt output
This may take some time.

Once the word count runs successfully, you can run the following command to see the output file it has generated.
ls output
You should see part-r-00000 with _SUCCESS indicating that the wordcount has been done.

While it is still processing, you may only see '_temporary' listed in the output directory. Wait for a couple of minutes and run the command again till you see output as shown above.

Run the following command to see the word count output.
cat  output/part-r-00000

BigData 2
Hadoop  1
IBM 1
MapReduce   2

Clone the repository to your theia environment.
git clone https://github.com/ibm-developer-skills-network/ooxwv-docker_hadoop.git
Navigate to the docker-hadoop directory to build it.
cd ooxwv-docker_hadoop
Compose the docker application.
docker-compose up -d
Compose is a tool for defining and running multi-container Docker applications. It uses the YAML file to configure the serives and enables us to create and start all the services from just one configurtation file.

You will see that all the five containers are created and started.
Run the namenode as a mounted drive on bash.
docker exec -it namenode /bin/bash
You will observe that the prompt changes as shown below.

Explore the hadoop environment
As you have learnt in the videos and reading thus far in the course, a Hadoop environment is configured by editing a set of configuration files:

hadoop-env.sh Serves as a master file to configure YARN, HDFS, MapReduce, and Hadoop-related project settings.

core-site.xml Defines HDFS and Hadoop core properties

hdfs-site.xml Governs the location for storing node metadata, fsimage file and log file.

mapred-site-xml Lists the parameters for MapReduce configuration.

yarn-site.xml Defines settings relevant to YARN. It contains configurations for the Node Manager, Resource Manager, Containers, and Application Master.

For the docker image, these xml files have been configured already. You can see these in the directory /opt/hadoop-3.2.1/etc/hadoop/ by running

ls /opt/hadoop-3.2.1/etc/hadoop/*.xml
Create a file in the HDFS
In the HDFS, create a directory structure named user/root/input.
hdfs dfs -mkdir -p /user/root/input
Copy all the hadoop configuration xml files into the input directory.
hdfs dfs -put $HADOOP_HOME/etc/hadoop/*.xml /user/root/input
Create a data.txt file in the current directory.
curl https://raw.githubusercontent.com/ibm-developer-skills-network/ooxwv-docker_hadoop/master/SampleMapReduce.txt --output data.txt 
Copy the data.txt file into /user/root.
hdfs dfs -put data.txt /user/root/
Check if the file has been copied into the HDFS by viewing its content.
hdfs dfs -cat /user/root/data.txt

docker network ls #docker container ip
docker network inspect -f '{{json .Containers}}' 2569dd7bfb98 | jq '.[] | .Name + ":" + .IPv4Address' #docker container ip, 2569dd7bfb98 is the network id (driver is bridge)

http://localhost:9870/ #view hdfs files in browser, 9870 is namenode port number

docker start [container id] #start docker container, docker container start
docker start [container name] #
docker stop [container name]

week 3 lab, getting started with spark using python
Setup
For this lab, we are going to be using Python and Spark (PySpark). These libraries should be installed in your lab environment or in SN Labs.

# Installing required packages
!pip install pyspark
!pip install findspark
import findspark
findspark.init()
# PySpark is the Spark API for Python. In this lab, we use PySpark to initialize the spark context. 
from pyspark import SparkContext, SparkConf
from pyspark.sql import SparkSession
Task 1: Creating the spark session and context
# Creating a spark context class
sc = SparkContext()
​
# Creating a spark session
spark = SparkSession \
    .builder \
    .appName("Python Spark DataFrames basic example") \
    .config("spark.some.config.option", "some-value") \
    .getOrCreate()
Task 2: Initialize Spark session
To work with dataframes we just need to verify that the spark session instance has been created.

spark
Task 1: Create an RDD.
For demonstration purposes, we create an RDD here by calling sc.parallelize()
We create an RDD which has integers from 1 to 30.

data = range(1,30)
# print first element of iterator
print(data[0])
len(data)
xrangeRDD = sc.parallelize(data, 4)
​
# this will let us know that we created an RDD
xrangeRDD
subRDD = xrangeRDD.map(lambda x: x-1)
filteredRDD = subRDD.filter(lambda x : x<10)
Task 3: Actions
A transformation returns a result to the driver. We now apply the collect() action to get the output from the transformation.

​
print(filteredRDD.collect())
filteredRDD.count()
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

# Download the data first into a local `people.json` file
!curl https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-BD0225EN-SkillsNetwork/labs/data/people.json >> people.json
# Read the dataset into a spark dataframe using the `read.json()` function
df = spark.read.json("people.json").cache()
# Print the dataframe as well as the data schema
df.show()
df.printSchema()
# Register the DataFrame as a SQL temporary view
df.createTempView("people")
df.select("name").show()
df.select(df["name"]).show()
spark.sql("SELECT name FROM people").show()
# Perform basic filtering

df.filter(df["age"] > 21).show()
spark.sql("SELECT age, name FROM people WHERE age > 21").show()
# Perfom basic aggregation of data

df.groupBy("age").count().show()
spark.sql("SELECT age, COUNT(age) as count FROM people GROUP BY age").show()

Setup
For this lab, we are going to be using Python and Spark (PySpark). These libraries should be installed in your lab environment or in SN Labs.

Pandas is a popular data science package for Python. In this lab, we use Pandas to load a CSV file from disc to a pandas dataframe in memory. PySpark is the Spark API for Python. In this lab, we use PySpark to initialize the spark context.

# Installing required packages
!pip install pyspark
!pip install findspark
!pip install pandas
import findspark
findspark.init()
import pandas as pd
from pyspark import SparkContext, SparkConf
from pyspark.sql import SparkSession
Exercise 1 - Spark session
In this exercise, you will create and initialize the Spark session needed to load the dataframes and operate on it

Task 1: Creating the spark session and context
# Creating a spark context class
sc = SparkContext()
​
# Creating a spark session
spark = SparkSession \
    .builder \
    .appName("Python Spark DataFrames basic example") \
    .config("spark.some.config.option", "some-value") \
    .getOrCreate()
Task 2: Initialize Spark session
To work with dataframes we just need to verify that the spark session instance has been created.

spark
Task 1: Loading data into a Pandas DataFrame
# Read the file using `read_csv` function in pandas
mtcars = pd.read_csv('https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-BD0225EN-SkillsNetwork/labs/data/mtcars.csv')
# Preview a few records
mtcars.head()
Task 2: Loading data into a Spark DataFrame
# We use the `createDataFrame` function to load the data into a spark dataframe
sdf = spark.createDataFrame(mtcars) 
# Let us look at the schema of the loaded spark dataframe
sdf.printSchema()
sdf.select('mpg').show(5)
sdf.filter(sdf['mpg'] < 18).show(5)
sdf.withColumn('wtTon', sdf['wt'] * 0.45).show(5)
sdf.groupby(['cyl'])\
.agg({"wt": "AVG"})\
.show(5)
car_counts = sdf.groupby(['cyl'])\
.agg({"wt": "count"})\
.sort("count(wt)", ascending=False)\
.show(5)
Setup
For this lab, we are going to be using Python and Spark (PySpark). These libraries should be installed in your lab environment or in SN Labs. Pandas is a popular data science package for Python. In this lab, we use Pandas to load a CSV file from disc to a pandas dataframe in memory. PySpark is the Spark API for Python. In this lab, we use PySpark to initialize the spark context.

# Installing required packages
!pip install pyspark
!pip install findspark
!pip install pyarrow==1.0.0
!pip install pandas
!pip install numpy==1.19.5
import findspark
findspark.init()
import pandas as pd
from pyspark import SparkContext, SparkConf
from pyspark.sql import SparkSession
Exercise 1 - Spark session
Create and initialize the Spark session needed to load the data frames and operate on it

Task 1: Creating the spark session and context
# Creating a spark context class
sc = SparkContext()
​
# Creating a spark session
spark = SparkSession \
    .builder \
    .appName("Python Spark DataFrames basic example") \
    .config("spark.some.config.option", "some-value") \
    .getOrCreate()
Task 2: Initialize Spark session
To work with dataframes we just need to verify that the spark session instance has been created.

spark
spark
Task 1: Load data into a Pandas DataFrame.
Pandas has a convenient function to load CSV data from a URL directly into a pandas dataframe.

# Read the file using `read_csv` function in pandas
mtcars = pd.read_csv('https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-BD0225EN-SkillsNetwork/labs/data/mtcars.csv')
# Preview a few records
mtcars.head()
mtcars.rename( columns={'Unnamed: 0':'name'}, inplace=True )
Task 2: Loading data into a Spark DataFrame
We use the createDataFrame function to load the data into a spark dataframe

 = spark.createDataFrame(mtcars) 
sdf = spark.createDataFrame(mtcars) 
Let us look at the schema of the loaded spark dataframe

sdf.printSchema()
sdf.createTempView("cars")
# Showing the whole table
spark.sql("SELECT * FROM cars").show()
# Showing a specific column
spark.sql("SELECT mpg FROM cars").show(5)
# Basic filtering query to determine cars that have a high mileage and low cylinder count
spark.sql("SELECT * FROM cars where mpg>20 AND cyl < 6").show(5)
# Aggregating data and grouping by cylinders
spark.sql("SELECT count(*), cyl from cars GROUP BY cyl").show()
Task 1: Importing libraries and registering a UDF
# import the Pandas UDF function 
from pyspark.sql.functions import pandas_udf, PandasUDFType
@pandas_udf("float")
def convert_wt(s: pd.Series) -> pd.Series:
    # The formula for converting from imperial to metric tons
    return s * 0.45
​
spark.udf.register("convert_weight", convert_wt)
spark.sql("SELECT *, wt AS weight_imperial, convert_weight(wt) as weight_metric FROM cars").show()


#week 5
pip3 install pyspark
python3 -m pip install pyspark
git clone https://github.com/big-data-europe/docker-spark.git
cd docker-spark
docker-compose up
submit.py
spark-submit.py
from pyspark import SparkContext, SparkConf
from pyspark.sql import SparkSession
from pyspark.sql.types import StructField, StructType, IntegerType, StringType

sc = SparkContext.getOrCreate(SparkConf().setMaster('spark://localhost:7077'))
sc.setLogLevel("INFO")

spark = SparkSession.builder.getOrCreate()


spark = SparkSession.builder.getOrCreate()
df = spark.createDataFrame(
    [
        (1, "foo"),
        (2, "bar"),
    ],
    StructType(
        [
            StructField("id", IntegerType(), False),
            StructField("txt", StringType(), False),
        ]
    ),
)
print(df.dtypes)
df.show()
python3 submit.py

#install kind-kubernetes in docker
git clone https://github.com/ibm-developer-skills-network/fgskh-new_horizons.git
cd fgskh-new_horizons
cd kind
./install_kind.sh
./create_kind_cluster.sh
alias k='kubectl'
k apply -f ../spark/pod_spark.yaml -n default
k apply -f rbac.yaml -n default
k get po -n default
k get po -n default
k delete po spark -n default
k apply -f ../spark/pod_spark.yaml -n default
k get po -n default
k exec  -n default -it spark -c spark  -- /bin/bash
./bin/spark-submit \
--master k8s://http://127.0.0.1:8001 \
--deploy-mode cluster \
--name spark-pi \
--class org.apache.spark.examples.SparkPi \
--conf spark.executor.instances=3 \
--conf spark.kubernetes.container.image=romeokienzler/spark-py:3.1.2 \
--conf spark.kubernetes.executor.limit.cores=1 \
local:///opt/spark/examples/jars/spark-examples_2.12-3.1.2.jar \
10
kubectl get po -n default
kubectl logs -n default spark-pi-6f62d17a800beb3e-driver |grep "Job 0 finished:"
Job 0 finished: reduce at SparkPi.scala:38, took 8.446024 s
kubectl logs -n default spark-pi-6f62d17a800beb3e-driver |grep "Pi is roughly "

#week 6 debug
wget https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-BD0225EN-SkillsNetwork/labs/data/cars.csv
for i in `docker ps | awk '{print $1}' | grep -v CONTAINER`; do docker kill $i; done
docker rm spark-master spark-worker-1 spark-worker-2
docker run \
    --name spark-master \
    -h spark-master \
    -e ENABLE_INIT_DAEMON=false \
    -p 4040:4040 \
    -p 8080:8080 \
    -v `pwd`:/home/root \
    -d bde2020/spark-master:3.1.1-hadoop3.2
docker run \
    --name spark-worker-1 \
    --link spark-master:spark-master \
    -e ENABLE_INIT_DAEMON=false \
    -p 8081:8081 \
    -v `pwd`:/home/root \
    -d bde2020/spark-worker:3.1.1-hadoop3.2
docker exec \
    -it `docker ps | grep spark-master | awk '{print $1}'` \
    /spark/bin/pyspark \
    --master spark://spark-master:7077
df = spark.read.csv("/home/root/cars.csv", header=True, inferSchema=True) \
    .repartition(32) \
    .cache()
df.show()
from pyspark.sql.functions import udf
import time

@udf("string")
def engine(cylinders):
    time.sleep(0.2)  # Intentionally delay task
    eng = {6: "V6", 8: "V8"}
    return eng[cylinders]
df = df.withColumn("engine", engine("cylinders"))
dfg = df.groupby("cylinders")
dfa = dfg.agg({"mpg": "avg", "engine": "first"})
dfa.show()
@udf("string")
def engine(cylinders):
    time.sleep(0.2)  # Intentionally delay task
    eng = {4: "inline-four", 6: "V6", 8: "V8"}
    return eng.get(cylinders, "other")
df = df.withColumn("engine", engine("cylinders"))
dfg = df.groupby("cylinders")
dfa = dfg.agg({"mpg": "avg", "engine": "first"})
dfa.show()
  docker run \
    --name spark-worker-2 \
    --link spark-master:spark-master \
    -e ENABLE_INIT_DAEMON=false \
    -p 8082:8082 \
    -d bde2020/spark-worker:3.1.1-hadoop3.2
theia@theiadocker-user:/home/project$ docker run \
>     --name spark-worker-2 \
>     --link spark-master:spark-master \
>     -e ENABLE_INIT_DAEMON=false \
>     -p 8082:8082 \
>     -d bde2020/spark-worker:3.1.1-hadoop3.2
1935a71827668ae3476e6a16f0bebcd4c2a342a21271dc22be487aa1b1731708
theia@theiadocker-user:/home/project$
dfa.show()



















Basic HDFS DFS Commands
Below are basic hdfs dfs or hadoop fs Commands.

COMMAND	DESCRIPTION
-ls	List files with permissions and other details
-mkdir	Creates a directory named path in HDFS
-rm	To Remove File or a Directory
-rmr	Removes the file that identified by path / Folder and subfolders
-rmdir	Delete a directory
-put	Upload a file / Folder from the local disk to HDFS
-cat	Display the contents for a file
-du	Shows the size of the file on hdfs.
-dus	Directory/file of total size
-get	Store file / Folder from HDFS to local file
-getmerge	Merge Multiple Files in an HDFS
-count	Count number of directory, number of files and file size
-setrep	Changes the replication factor of a file
-mv	HDFS Command to move files from source to destination
-moveFromLocal	Move file / Folder from local disk to HDFS
-moveToLocal	Move a File to HDFS from Local
-cp	Copy files from source to destination
-tail	Displays last kilobyte of the file
-touch	create, change and modify timestamps of a file
-touchz	Create a new file on HDFS with size 0 bytes
-appendToFile	Appends the content to the file which is present on HDF
-copyFromLocal	Copy file from local file system
-copyToLocal	Copy files from HDFS to local file system
-usage	Return the Help for Individual Command
-checksum	Returns the checksum information of a file
-chgrp	Change group association of files/change the group of a file or a path
-chmod	Change the permissions of a file
-chown	change the owner and group of a file
-df	Displays free space
-head	Displays first kilobyte of the file
-Create Snapshots	Create a snapshot of a snapshottable directory
-Delete Snapshots	Delete a snapshot of from a snapshottable directory
-Rename Snapshots	Rename a snapshot
-expunge	create new checkpoint
-Stat	Print statistics about the file/directory
-truncate	Truncate all files that match the specified file pattern to the specified length
-find	Find File Size in HDFS
HDFS Basic Commands
ls – List Files and Folder
HDFS ls command is used to display the list of Files and Directories in HDFS, This ls command shows the files with permissions, user, group, and other details. For more information follow ls- List Files and Folder


$hadoop fs -ls
or
$hdfs dfs -ls
mkdir – Make Directory
HDFS mkdir command is used to create a directory in HDFS. By default, this directory would be owned by the user who is creating it. By specifying “/” at the beginning it creates a folder at root directory.



$hadoop fs -mkdir /directory-name
or
$hdfs dfs -mkdir /directory-name 
rm – Remove File or Directory
HDFS rm command deletes a file and a directory from HDFS recursively.


$hadoop fs -rm /file-name
or
$hdfs dfs -rm /file-name
rmr – Remove Directory Recursively
Rmr command is used to deletes a file from Directory recursively, it is a very useful command when you want to delete a non-empty directory.


$hadoop fs -rmr /directory-name
or
$hdfs dfs -rmr /directory-name
rmdir – Delete a Directory
Rmdir command is used to removing directories only if they are empty.


$hadoop fs -rmdir /directory-name
or
$hdfs dfs -rmdir /directory-name
put – Upload a File to HDFS from Local
Copy file/folder from local disk to HDFS. On put command specifies the local-file-path where you wanted to copy from and then hdfs-file-path where you wanted to copy to on hdfs.


$ hadoop fs -put /local-file-path /hdfs-file-path
or
$ hdfs dfs -put /local-file-path /hdfs-file-path
cat – Displays the Content of the File
The cat command reads the specified file from HDFS and displays the content of the file on console or stdout.


$ hadoop fs -cat /hdfs-file-path
or 
$ hdfs dfs -cat /hdfs-file-path
du – File Occupied in Disk
Du command is used to How much file Occupied in the disk. The field is the base size of the file or directory before replication.


$ hadoop fs -du  /hdfs-file-path
or
$ hdfs dfs -du  /hdfs-file-path
dus – Directory/file of the total size
Dus command is used to will give the total size of directory/file.


$ hadoop fs -dus  /hdfs-directory 
or
$ hdfs dfs -dus  /hdfs-directory 
get – Copy the File from HDFS to Local
Get command is used to store filess from HDFS to the local file. HDFS file gets the local machine.


$ hadoop fs -get /local-file-path /hdfs-file-path
or
$ hdfs dfs -get /local-file-path /hdfs-file-path
getmerge – Merge Multiple Files in an HDFS
If you have multiple files in an HDFS, use -getmerge option command. All these multiple files merged into one single file and downloads to local file system.


$ hadoop fs -getmerge [-nl] /source /local-destination
or
$ hdfs dfs -getmerge [-nl] /source /local-destination
count – Number of Directory
The count command is used to count a number of directories, a number of files, and file size on HDFS.


$ hadoop fs -count /hdfs-file-path
or
$ hdfs dfs -count /hdfs-file-path
mv – Moves Files from Source to Destination
MV (move) command is used to move files from one location to another location in HDFS. Move command allows multiple sources as well in which case the destination needs to be a director.


$ hadoop fs -mv /local-file-path /hdfs-file-path
or
$ hdfs dfs -mv /local-file-path /hdfs-file-path
moveFromLocal – Move file / Folder from Local disk to HDFS
Similar to the put command, moveFromLocal moves the file or source from the local file path to the destination in the HDFS file path. After this command, you will not find the file on the local file system.


$ hadoop fs -moveFromLocal /local-file-path /hdfs-file-path
or
$ hdfs dfs -moveFromLocal /local-file-path /hdfs-file-path
moveToLocal – Move a File to HDFS from Local
Similar to the get command, moveToLocal moves the file or source from the HDFS file path to the destination in the local file path.


$ hadoop fs -moveToLocal /hdfs-file-path /local-file-path 
or
$ hdfs dfs -moveToLocal /hdfs-file-path /local-file-path 
Cp – Copy Files from Source to Destination
Copy File-one location to another location in HDFS. Copy files from source to destination, Copy command allows multiple sources as well in which case the destination must be a directory.


$ hadoop fs -cp /local-file-path /hdfs-file-path
or
$ hdfs dfs -cp /local-file-path /hdfs-file-path
setrep – Changes the Replication Factor of a File
This HDFS command is used to change the replication factor of a file. If the path is a directory then the command recursively changes the replication factor of all files under the directory tree rooted at the path.


$ hadoop fs -setrep /number /file-name 
or
$ hdfs dfs -setrep /number /file-name 
tail – Displays Last Kilobyte of the File
Tail command is used to Display last kilobyte of the file to stdout.


$ hadoop fs -tail /hdfs-file-path
or
$ hdfs dfs -tail /hdfs-file-path
touch – Create and Modify Timestamps of a File
It is used to create a file without any content. The file created using the touch command is empty. updates the access and modification times of the file specified by the URI to the current time, the file does not exist then a zero-length file is created at URI with the current time as the timestamp of that URI.


$ hadoop fs -touch /hdfs-file-path
or
$ hdfs dfs -touch /hdfs-file-path
touchz – Create a File of zero Length
Create a new file on HDFS with size 0 bytes. create a file of zero length, an error is returned if the file exists with non-zero length.


$ hadoop fs -touchz /hdfs-file-path
or
$ hdfs dfs -touchz /hdfs-file-path
appendToFile – Appends the Content to the File
Appends the content to the file which is present on HDFS. Append single source. or multiple sources from the local file system to the destination file system. this command appends the contents of all the given local files to the provided destination file on the HDFS filesystem.


$ hadoop fs -appendToFile /hdfs-file-path
or
$ hdfs dfs -appendToFile /hdfs-file-path
copyFromLocal – Copy File from Local file System
Copying file from a local file to HDFS file system. Similar to the fs -put command and copyFromLocal command both are Store files from local disk to HDFS. Except that the source is restricted to a local file reference.


$ hadoop fs -copyToLocal /hdfs-file-path /local-file-path
or
$ hdfs dfs -copyToLocal  /hdfs-file-path /local-file-path
copyToLocal – Copy Files from HDFS to Local file System
Copying files from HDFS file to local file system. Similar to the fs -get command and copyToLocal command both are Store files from hdfs to local files. Except that the destination is restricted to a local file reference.


$ hadoop fs -copyToLocal /hdfs-file-path /local-file-path
or
$ hdfs dfs -copyToLocal  /hdfs-file-path /local-file-path
usage – Return the Help for Individual Command
Usage command is used to Provide you help for indidual commands.


$ hadoop fs -usage mkdir 
or
$ hdfs dfs -usage mkdir
checksum -Returns the Checksum Information of a File
The checksum command is used to Returns the Checksum Information of a File. Returns the checksum information of a file.


$ hadoop fs -checksum [-v] URI
or
$ hdfs dfs -checksum [-v] URI
chgrp – Change Group Association of Files
chgrg command is used to change the group of a file or a path. The user must be the owner of files, or else a super-user.


$ hadoop fs -chgrp [-R] groupname
or
$ hdfs dfs -chgrp [-R] groupname
chmod – Change the Permissions of a File
This command is used to change the permissions of a file. With -R Used to modify the files recursively and it is the only option that is being supported currently.


$ hadoop fs -chmod [-R] hdfs-file-path 
or
$ hdfs dfs -chmod [-R] hdfs-file-path
chown – Change the Owner and Group of a File
Chown command is used to change the owner and group of a file. This command is similar to the shell’s chown command with a few exceptions.


$ hadoop fs -chown [-R] [owner][:[group]] hdfs-file-path
or
$ hdfs dfs -chown [-R] [owner][:[group]] hdfs-file-path
df – Displays free Space
Df is the Displays free space. This command is used to show the capacity, free and used space available on the HDFS filesystem. Used to format the sizes of the files in a human-readable manner rather than the number of bytes.


$ hadoop fs -df /user/hadoop/dir1
or
$ hdfs dfs -df /user/hadoop/dir1
head – Displays first Kilobyte of the File
Head command is use to Displays first kilobyte of the file to stdout.


$ hadoop fs -head /hdfs-file-path
or
$ hdfs dfs -head /hdfs-file-path
createSnapshots – Create Snapshottable Directory
This operation requires owner privilege of the snapshot table directory. The path of the snapshot table directory, snapshot name is The snapshot name a default name is generated using a timestamp.


$ hadoop fs -createSnapshot /path /snapshotName
or
$ hdfs dfs -createSnapshot /path /snapshotName
deleteSnapshots – Delect Snapshottable Directory
This operation requires owner privilege of the snapshot table directory. The path of the snapshot table directory, snapshot name is The snapshot name.


$ hadoop fs -deleteSnapshot /path /snapshotName
or
$ hdfs dfs -deleteSnapshot /path /snapshotName
renameSnapshots – Rename a Snapshot
This operation requires owner privilege of the snapshottable directory.


$ hadoop fs -renameSnapshot /path /oldName /newName
or
$ hdfs dfs  -renameSnapshot /path /oldName /newName
expunge – Create New Checkpoint
This command is used to empty the trash available in an HDFS system. Permanently delete files in checkpoints older than the retention threshold from the trash directory.


$ hadoop fs –expunge -immediate -fs  /hdfs-file-path
or
$ hdfs dfs –expunge -immediate -fs  /hdfs-file-path
Stat – File/Directory Print Statistics
This command is used to print the statistics about the file/directory in the specified format. Print statistics about the file/directory at in the specified format.


$ hadoop fs -stat /format
or
$ hdfs dfs -stat /format
Truncate – Specified File Pattern and Length
Truncate all files that match the specified file pattern to the specified length.


$ hadoop fs -truncate [-w] /length /hdfs-file-path
or
$ hdfs dfs -truncate [-w] /length /hdfs-file-path
Find – Find File Size in HDFS
In Hadoop, hdfs dfs -find or hadoop fs -find commands are used to get the size of a single file or size for all files specified in an expression or in a directory. By default, it points to the current directory when the path is not specified.


$hadoop fs -find / -name test -print
or
$hdfs dfs -find / -name test -print
  
