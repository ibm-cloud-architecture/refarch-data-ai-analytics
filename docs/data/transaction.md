# Transaction in distributed system

Any application using data may consider some potential issues like:

* database software or server hardware failure
* network failure
* application crashes while writing to the database
* concurrent update at the same time, overwriting each others
* reading data while write operation happened

So making application reliable is quite a challenge and is a lot of work and testing. The way to simplify the coding of data centric application is to use transaction.

## When to use transaction

A transaction is a way for an application to group several reads and writes together into a logical unit. The read or write operations succeed (commit) or fail (abord and rollback to avoid side effect).

The majority of stateful business service, micro or monolytic, should use transaction. The aggreagte and data responsability define the scope of the transaction and microservice design. 

When higher availability and higher performance, application needs to run in parallel, and therefore some safety guards needs to be done whithout transaction.

The introduction of document oriented database, focused on a non relational data model, where relationship integrity is less important, while partitioning, replication are more important to address fault tolerance and scalability.

## ACID vs BASE

Atomicity, Consistency, Isolation and Durability are the key mechanisms for fault tolerance in databases.

Atomicity guarantees that write operations are all done in one unique operation or aborded in case of fault. 

Consistency assesses that the data invariants are always true. This is in the application scope, database can only verifies some constraints, like on null, key integrity, data type, length,...

Isolation protects the clients to read the same row at the same time or write in the same table at the same time. Transactions are isolated from each other.

Durability is to keep data without losing it overtime. It means saving to a durable disk, and avoid data corruption. The transaction could only be considered successful if the write operation on disk is done, or in case of cross node replication, when all the nodes have done their work.
