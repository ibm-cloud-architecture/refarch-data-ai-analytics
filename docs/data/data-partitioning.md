# Data partitioning

The goal of data partitioning is to spread the data and query load evenly across multiple machines, avoiding nodes with disproportionately load: it helps to scale. Partitions are placed in different nodes in a shared nothing cluster. Query in one partition scale well, and can address load evenly accross nodes. Partition is combined with replication techniques for fault tolerance, so copies of each parition are stored on multiple nodes. Using the **leader-follower** approach, one node could be leader on one partition and follower for others. This is how Kafka does partition replication. 

Partitioning algorithm needs to take care of data assignment by avoiding one partition to get all the load. One approach is to use key-value data model and use the key to assign to partition. Sequential keys are assigned into the same partition until reaching a specific boundary. Those boundaries are adapted to the data and keys. The partitioning by key hashing code is the choice for a lot of document oriented databases. The hash function needs to be language agnostic, for example Object.hashCode() of java could not be used. Partition assignement is then based on a range of hashes.

Still this technique may not work for highly used key: for example a very famous twitter account, will have millions of reads on the same partition. The application may manage the key assignment and may append small random number to the key string.

Keys are good for partitioning, but persisted data need to be easily searchable. So secondary index are needed. Index can be managed locally to each partition or globally cross partitions. With local indexing, write operations are efficient as they work on a unique partition but a read / search goes accross all partitions to aggregate the results which takes more time. This is the **scatter / gather** approach.

With global indexing, the secondary indexes are partitionned and the query operation may be more efficient as it will reach a unique partition. But the write operation will be costly. In RDBMS the index write operation will be transactional. In distributed system it will be asynchronous, and so a query done immediately after a write may not see the consistent data.

## Rebalancing partitions

A lot of things happen in distributed system: more data are added forcing to add more nodes, node fails, query throughput increases... Data partition needs to be reallocated to different nodes. This is the **partition rebalancing** process. It needs to ensure data is kept fairly distributed over the cluster after done. It needs to be active and serves new read and write operations, and it needs to move the minimum of data to get good performance.

The approaches include using fixed number of partitions, more than current number of nodes and then reallocate a full parition when new node is added, or use dynamic partitioning where the rebalancing occurs when the size of the first partition reach a certain threshold.
With dynamic partitioning, the number of partitions is proportional to the size of the dataset, since the splitting and merging processes keep the size of each partition between some fixed minimum and maximum numbers.
Another approach is to have a fixed number of partition per node. When a new node joins the cluster, it randomly chooses a fixed number of existing partitions to split, and then takes ownership of one half of each of those splitted partitions while leaving the other half of each partition in place. For example, Cassandra uses 256 partitions per node.

Rebalancing is an expensive operation, because it requires rerouting requests and moving a large amount of data from one node to another. So some implementation is expecting to have human configuring and triggering the rebalancing according the observed state of the partitioning.

## Request routing or service discovery

How a client find data in partition and node? Again, there are different approaches:

* client can contact any node, and if a node getting the request does not have the data, it forwards to another node that may respond to it, so the first node passes the reply to the client.
* client sends the request to a routing agent, which determines which node to reach. It is a partition aware load balancer.
* client is aware of the partition to node assignment. so it can contact the node directly.

On each case, partition rebalancing impacts the routing. There are some complex protocol to achieve consensus. Zookeeper is a coordination system to keep track of the cluster metadata. Another approach is to use a gossip protocol to dissimate changes of the cluster state between nodes.

## Parallel queries

In analytics we need to perform complex queries combining filtering, joins, grouping by and aggregates. Massively parallel processing is used to split the query into stages and partitions to be executed in parallel. 