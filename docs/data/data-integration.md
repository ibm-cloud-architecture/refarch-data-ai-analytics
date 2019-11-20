# Data integration

There is no universal database solution to address the variety of data requirements business applications need. And it is not wishable to have such monster product. So the need for data integration should come by considering the dataflows across a business process at stake or across an entire business organization and even sometime in a network of business partners (a blockchain network as an example). 

## Dataflows

When we need to separate the write and read model, like by adapting CQRS, we need to pay attention on where the data are create first, where they should be persisted, and which representations are derived from which sources. For each target reads, what are the expected formats, and data locations?

The classical approach to keep different systems data consistent, is to use two phase commit transaction, and the orchestrator to keep the write operation in expected sequence. Alternate model is to use event sourcing to keep write order in a log.

## Transaction

We do not want to write another book on transaction, but this is important to keep the following in mind when addressing application design and architecture:

* With ACID transaction, atomicity, isolation and durability are database characteristics. Consistency is application specifics and depends on what the code set in the transaction.
* ACID transaction is not about concurency (like it is in multithreading) but it is the ability to abort a transaction on error and have all writes from that transaction discarded.
* ACID consistency is aimed to keep business logic invariants on the data. Database can guaranty foreign key and constraints, but not business logic invariants.
* ACID isolation guarantees concurrently executing transactions are isolated from each other. They are serialized, which impact performance. So modern databases are using weaker algorithm for isolation.
* ACID durability is to keep the data forever, so for single node, it is to write to harddisc, while with distributed database, a database must wait until all writes or replications are complete before claiming a transaction is successful. 