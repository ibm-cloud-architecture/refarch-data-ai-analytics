
## Requirements

We want to support the following requirements:

* Keep a RDBMS database like DB2 on the mainframe where transactions are supported
* Add cloud native applications in a Kubernetes environment, with a need to read data coming from the legacy DB, without impacting the DB server performance with additional queries
* Address a writing model, where cloud native apps have to write back changes to the legacy DB
* Replicate data in real time to data lake or cloud based data store.
* Replicated data for multiple consumers

There are a lot of products which are addressing those requirements, but here we address the integration with Kafka for a pub/sub and event store need.

The previous diagram may illustrate what we want to build.
