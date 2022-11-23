wget https://archive.apache.org/dist/kafka/2.8.0/kafka_2.12-2.8.0.tgz #download kafka
tar -xzf kafka_2.12-2.8.0.tgz #extract kafka
cd kafka_2.12-2.8.0 #enter kafka folder
bin/zookeeper-server-start.sh config/zookeeper.properties #zookeeper is required for kafka, start the zookeeper server
bin/kafka-server-start.sh config/server.properties #start kafka message broker
bin/kafka-topics.sh --create --topic news --bootstrap-server localhost:9092 #new terminal create a kafka topic
bin/kafka-console-producer.sh --topic news --bootstrap-server localhost:9092 #start a producer to send messages to kafka
bin/kafka-console-consumer.sh --topic news --from-beginning --bootstrap-server localhost:9092 #start consumer to listen to messages in kafka topic
