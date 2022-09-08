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

