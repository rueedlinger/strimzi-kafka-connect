# strimzi-kafka-connect

## Getting started

The following command will build a Kafka Connect custom iamges with different connectors and transforms.
For more details see [Dockerfile](Dockfile) or [docker-compose.yaml](docker-compose.yaml)

```bash
docker compose up --build
```

Netx you can access the following services:

- http://localhost:8081 (kafka ui)
- http://localhost:8082 (kafka connect ui)
- localhost:9092 (kafka broker)
- loclahost:5432 (postgres)