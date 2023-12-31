# Custom Kafka Connect (strimzi) Image

This is a kafka connect docker image based on [strimzi](https://strimzi.io/). This image can be used with the kafka strimzi operator.

## Getting started

The following command will build a Kafka Connect custom iamges with different connectors and transforms.
For more details see [Dockerfile](Dockerfile) or [docker-compose.yaml](docker-compose.yaml)

```bash
docker compose up --build
```

Next you can access the following services:

- http://localhost:8081 (kafka ui)
- http://localhost:8082 (kafka connect ui)
- localhost:9092 (kafka broker)
- loclahost:5432 (postgres)

# Build your own Kafka Connect Plugins

How to build your own connect plugins see [kafka-connect-quickstart ](https://github.com/rueedlinger/kafka-connect-quickstart)
