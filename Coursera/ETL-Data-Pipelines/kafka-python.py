# -*- coding: utf-8 -*-
"""
Created on Thu Nov 17 22:31:14 2022

@author: H204095
"""

#pip install kafka-python
from kafka import KafkaAdminClient

admin_client = KafkaAdminClient(bootstrap_servers="localhost:9092", client_id='test')
topic_list = []
new_topic = NewTopic(name="bankbranch", num_partitions= 2, replication_factor=1)
topic_list.append(new_topic)
admin_client.create_topics(new_topics=topic_list)

"kafka-topics.sh --bootstrap-server localhost:9092 --create --topic bankbranch  --partitions 2 --replication_factor 1"

configs = admin_client.describe_configs(config_resources=[ConfigResource(ConfigResourceType.TOPIC, "bankbranch")])
kafka-topics.sh --bootstrap-server localhost:9092 --describe --topic bankbranch

producer = KafkaProducer(value_serializer=lambda v: json.dumps(v).encode('utf-8'))

producer.send("bankbranch", {'atmid':1, 'transid':100})
producer.send("bankbranch", {'atmid':2, 'transid':101})
kafka-console-producer.sh --bootstrap-server localhost:9092 --topic bankbranch
consumer = KafkaConsumer('bankbranch')
for msg in consumer:
    print(msg.value.decode("utf-8"))
kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic bankbranch
