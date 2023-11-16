
ARG STRIMZI_VERSION=0.38.0
ARG KAFKA_VERSION=3.6.0
FROM quay.io/strimzi/kafka:${STRIMZI_VERSION}-kafka-${KAFKA_VERSION}

WORKDIR /tmp


USER root:root
RUN mkdir /opt/kafka/plugins/

# confluent-hub-client
RUN curl -LO https://client.hub.confluent.io/confluent-hub-client-latest.tar.gz
RUN tar -xvzf confluent-hub-client-latest.tar.gz --directory /usr/local/

# aiven transforms-for-apache-kafka-connect
RUN curl -LO https://github.com/Aiven-Open/transforms-for-apache-kafka-connect/releases/download/v1.5.0/transforms-for-apache-kafka-connect-1.5.0.tar
RUN tar -xvf transforms-for-apache-kafka-connect-1.5.0.tar
RUN cp -r transforms-for-apache-kafka-connect-1.5.0 /opt/kafka/plugin

# confluent JDBC connector
RUN confluent-hub install confluentinc/kafka-connect-jdbc:10.7.4  --component-dir /opt/kafka/plugins/  --worker-configs /opt/kafka/config/connect-distributed.properties --no-prompt

# jcustenborder kafka-connect-json-schema transforms
RUN confluent-hub install jcustenborder/kafka-connect-json-schema:latest --component-dir /opt/kafka/plugins/  --worker-configs /opt/kafka/config/connect-distributed.properties --no-prompt

# jcustenborder kafka-connect-transform-common transforms
RUN confluent-hub install jcustenborder/kafka-connect-transform-common:latest --component-dir /opt/kafka/plugins/  --worker-configs /opt/kafka/config/connect-distributed.properties --no-prompt

# other connectors
# https://camel.apache.org/camel-kafka-connector/3.20.x/reference/index.html
# https://debezium.io/documentation/reference/stable/connectors/index.html
# https://docs.aiven.io/docs/products/kafka/kafka-connect/concepts/list-of-connector-plugins

# cleanup
RUN rm -rf *

WORKDIR /opt/kafka
USER 1001
