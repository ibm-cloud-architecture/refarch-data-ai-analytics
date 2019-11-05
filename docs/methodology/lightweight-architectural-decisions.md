# Architectural Decisions Guidelines

*An architectural decisions guide for architectural model development specific to data science*

This is a companion document for the Lightweight IBM Cloud Garage Method for Data Science. It is meant for giving advice to architects and data scientists on architectural decisions which are extending the Lightweight Reference Architecture.

This document starts with Architectural Principles which are met when applying the Lightweight IBM Cloud Garage Method for Data Science. This way, while integrating this method in an existing enterprise architecture, this method only needs to be adjusted towards Architectural Principles which are not met by this method.

## Architectural Principles


|Name | Simplicity First 
--- | --- 
Statement | If a functionality or Technology Component is not needed in the current iteration, it shouldn't be part of the architecture. There must be a need for it in the current iteration.  
Rationale | Distraction is on of our worst enemies. Humans tend to get lost in the abundance of possibilities. By sticking to the Architectural Principle, clear focus on project delivery is ensured.
Implications| The majority of projects are over-engineered. This adds direct cost for additional unnecessary work and indirect maintenance cost due to architectural complexity. By enforcing the most simple architecture practitioners can focus on solving problems without getting distracted.


|Name | OpenSource First 
--- | --- 
Statement | If a functionality or Technology Component is available as Open Source, this should be given preference.
Rationale | Open Source software tends to be more stable, better documented and better understood which pushed TCO down 
Implications| When using Open Source vendor lock-in is reduced, experts are more abundant and standards are followed more tightly. In addition, independence from a vendor allows for development of extensions to address business needs which might not be available in timely manner from the vendor

|Name | Homogeneity First
--- | --- 
Statement | If a Technology Component is available from the same product suite it should be given preference.
Rationale | Although standards exist and a lot of products are compatible with each other, compatibility never reaches the level of products coming from the same product suite.  
Implications| If one relies on standards assuming compatibility between Technology Components during Architectural Development and those are broken whole Solution Architectures or Technology Architectures can become completely or partially invalid. Improving homogeneity mitigates that risk.

|Name | Never touch a running system
--- | --- 
Statement | If a Technical Component is needed, it should be provisioned from scratch without reusing existing systems.   
Rationale | When creating "Systems of Innovation" speed is on of the key drivers. Therefore, every interaction with existing system introduces complexity, delay and risk.
Implications| Especially in public, hybrid and private Cloud environments it is more effective to provision a Technical Component as a Service over adjusting an existing Technical Component. 

The [IBM Data and Analytics Reference Architecture](https://www.ibm.com/cloud/garage/architectures/dataAnalyticsArchitecture/reference-architecture) defines Application Components. A partial goal of an Architectural Development Method is defining a Technology Component for every necessary Application Component. The main document of the [“Lightweight IBM Cloud Garage Method for Data Science”](https://ibm-cloud-architecture.github.io/refarch-data-ai-analytics/methodology/lightweight/) describes the Lightweight Technology Reference Architecture which should be used as starting point and after every iteration Application Components can be added and mapped to Technology Components as necessary.

This way the method is highly iterative, so any findings during this process can result in changes to architectural decisions. However, there are never any wrong architectural decisions because the decisions take into account all the knowledge available at a certain point in time. Therefore, it’s important to document why a decision was made. The following figure shows the IBM Reference Architecture for Cloud Analytics, which is a Application Architecture containing and describing Technology Components.

![](../images/data-ai-ra-3.jpg)

The following sections provide guidelines on selecting Technology Components for each Application Component. So it is explained what Technology Component should be chosen based on given requirements and if the Application Component needs to be included at all.

## Application Component: Data Source

The data source is a private or public data source that includes relational databases; web pages; CSV, XML, JSON, or text files; and video and audio data.

### Technology Component mapping guidelines

With the data source, there is not much to decide because in most cases, the type and structure of a data source is already defined and controlled by other stakeholders. However, if there is some control over the process, the following Architectural Principles should be considered:


* **How does the delivery point look like?**

    Enterprise data mostly lies in relational databases serving OLTP systems. It’s typically a bad practice to access those systems directly, even in read-only mode because ETL processes are running SQL queries against those systems, which can hinder performance. One exception for example is IBM DB2 Workload Manager because it allows OLAP and ETL workloads to run in parallel with an OLTP workload without performance degradation of OLTP queries using intelligent scheduling and prioritizing mechanisms.

* **Does real-time data need to be considered?**

    Real-time data comes in various shapes and delivery methods. The most prominent include MQTT telemetry and sensor data (for example, data from the IBM Watson IoT Platform), an event stream, a simple REST HTTP endpoint that needs to be polled, or a TCP or UDP socket. If no downstream real-time processing is required, that data can be staged (for example, using Cloud Object Store). If downstream real-time processing is necessary, read the section on [Streaming analytics](#application-component-streaming-analytics) further down in this document.

## Application Component: Enterprise data

Cloud-based solutions tend to extend access of the enterprise data model. Therefore, it might be necessary to continuously transfer subsets of enterprise data to the cloud environment or access those in real time through a VPN API gateway.

### Technology Component mapping guidelines

Moving enterprise data to the cloud can be costly. Therefore, it should be considered only if necessary. For example, if user data is handled in the cloud is it sufficient to store an anonymized primary key. If transfer of enterprise data to the cloud is unavoidable, privacy concerns and regulations must be addressed. Then, there are multiple ways to access it:

* Batch sync from an enterprise data center to the cloud
* Real-time access to subsets of data using VPN and an API gateway
* Expose data via an event backbone

### Technology Mapping

#### Secure gateway

Secure gateway lets cloud applications access specified hosts and ports in a private data center though an outbound connection. Therefore, no external inbound access is required. You can go to the [Secure Gateway](https://cloud.ibm.com/catalog/services/secure-gateway)service on IBM Cloud for more information.

#### Lift

Lift allows you to migrate on-premises data to cloud databases in a very efficient manner. Read more about the IBM [Lift CLI](https://cloud.ibm.com/catalog/services/lift-cli).

#### Rocket Mainframe Data

The Rocket Mainframe Data service uses similar functions for batch-style data integration as Lift, but is dedicated to IBM Mainframes. You can [read more](https://cloud.ibm.com/catalog/services/rocket-mainframe-data) information about the service.

#### Apache Kafka

Apache Kafka, and IBM Event Streams expose data for other to consume with strong decoupling, and long term persistence. It can scale well for big data needs, and represent a well adopted platform to integrate microservices. See our deep dive into event driven solution [here](https://ibm-cloud-architecture.github.io/refarch-eda/kafka/readme/).

## Application Component: Streaming analytics

The current state-of-the-art is batch processing. But, sometimes the value of a data product can be increased tremendously by adding real-time analytics capabilities because most of world’s data loses value within seconds. Think of stock market data or the fact that a vehicle camera captures a pedestrian crossing a street. A streaming analytics system allows for real-time data processing. Think of it like running data against a continuous query instead of running a query against a finite data set.

### Technology Component mapping guidelines

There is a relatively limited set of technologies for real-time stream processing. The most important questions to be asked are:

* What throughput is required?
* What latency is accepted?
* Which data types must be supported?
* What type of algorithms run on the system? Only relational algebra or advanced modeling?
* What’s the variance of the workload and what are the elasticity requirements?
* What type of fault tolerance and delivery guarantees are necessary?

### Technology Mapping

On IBM Cloud, there are many service offerings for real-time data processing that I explain in the following sections along with guidelines for when to use them.

#### Apache Spark and Apache Spark Structured Streaming

Apache Spark is often the primary choice when it comes to cluster-grade data processing and machine learning. If you’re already using it for batch processing, [Apache Spark Structured Streaming](https://spark.apache.org/docs/latest/structured-streaming-programming-guide.html) should be the first thing to evaluate. This way, you can have technology homogeneity and batch and streaming jobs can be run together (for example, joining a stream of records against a reference table).

* What throughput is required? Apache Spark Structured Streaming supports the same throughput as in batch mode.

* What latency is accepted? In Apache Spark v2.3, the Continuous Processing mode has been introduced, bringing latency down to one millisecond.

* Which data types must be supported? Apache Spark is strong at structured and semi-structured data. Audio and video data can’t benefit from Apache Spark’s accelerators Tungsten and Catalyst.

* What type of algorithms run on the system? Only relational algebra or advanced modeling? Apache Spark Structured Streaming supports relational queries as well as machine learning, but machine learning is only supported on sliding and tumbling windows.

* What’s the variance of the workload and what are the elasticity requirements? Through their fault tolerant nature, Apache Spark clusters can be grown and shrunk dynamically.

* What type of fault tolerance and delivery guarantees are necessary? Apache Spark Structured Streaming supports exactly once delivery guarantees and depending on the type of data source, complete crash fault tolerance.

#### IBM Streams

IBM Streams is a fast streaming engine. Originally designed for low-latency, high throughput network monitoring applications, IBM Streams has its roots in cybersecurity.

* What throughput is required? IBM Streams can handle high data throughput rates, up to millions of events or messages per second.

* What latency is accepted? IBM Streams latency goes down to microseconds.

* Which data types must be supported? Through IBM Streams binary transfer mode, any type of data type can be supported.

* What type of algorithms run on the system? Only relational algebra or advanced modeling? IBM Streams in its core supports all relational algebra. Also, through toolkits, various machine learning algorithms can be used. Toolkits are an open system, and there are many third-party toolkits.

* What’s the variance of the workload and what are the elasticity requirements? Through its fault tolerant nature, IBM Streams clusters can be grown and shrunk dynamically.

* What type of fault tolerance and delivery guarantees are necessary? IBM Streams supports exactly once delivery guarantees and complete crash fault tolerance.

#### Node-RED

[Node-RED](https://nodered.org/) is a lightweight streaming engine. Implemented on top of Node.js in JavaScript, it can even run on a 64 MB memory footprint (for example, running on a Raspberry PI).


* What throughput is required? Node-RED’s throughput is bound to processing capabilities of a single CPU core, through Node.js’s event processing nature. For increased throughput, multiple instances of Node-RED have been used in parallel. Parallelization is not built in and needs to be provided by the application developer.

* What latency is accepted? Latency is also dependent on the CPU configuration and on the throughput because high throughput congests the event queue and increases latency.

* Which data types must be supported? Node-RED best supports JSON streams, although any data type can be nested into JSON.

* What type of algorithms run on the system? Only relational algebra or advanced modeling? Node-RED has one of the most extensive ecosystems of open source third-party modules. Although advanced machine learning is not supported natively, there are plans by IBM to add those.

* What’s the variance of the workload and what are the elasticity requirements? Because parallelization is a responsibility of the application developer, for independent computation a round-robin load balancing scheme supports linear scalability and full elasticity.

* What type of fault tolerance and delivery guarantees are necessary? NodeRED has no built-in fault tolerance and no delivery guarantees.

#### Apache Nifi

[Apache Nifi](https://nifi.apache.org/) is maintained by Hortonworks and is part of the IBM Analytics Engine Service.

* What throughput is required? Nifi can handle hundreds of MBs on a single node and can be configured to handle multiple GBs in cluster mode.

* What latency is accepted? Nifi’s latency is in seconds. Through message periodization, the tradeoff between throughput and latency can be tweaked.

* Which data types must be supported? Nifi best supports structured data streams, although any data type can be nested.

* What type of algorithms run on the system? Only relational algebra or advanced modeling? Nifi supports relational algebra out of the box, but custom processors can be built.

* What’s the variance of the workload and what are the elasticity requirements? Nifi can be easily scaled up without restarts, but scaling down requires stopping and starting the Nifi system.

* What type of fault tolerance and delivery guarantees are necessary? Nifi supports end-to-end guaranteed exactly once delivery.

Also, fault tolerance can be configured, but automatic recovery is not possible. Another important feature is backpressure and pressure release, which causes the upstream nodes to stop accepting new data and discarding unprocessed data if an age threshold is exceeded.

#### Apache Kafka


#### Others

There are also other technologies like Apache Samza, Apache Flink, Apache Storm, Total.js Flow, Eclipse Kura, and Flogo that might be worth looking at if the ones mentioned don’t meet all of your requirements.

## Application Component: Data Integration

In the data integration stage, data is cleansed, transformed, and if possible, downstream features are added

### Technology Component mapping guidelines

There are numerous technologies for batch data processing, which is the technology used for data integration. The most important questions to be asked are:

* What throughput is required?
* Which data types must be supported?
* What source systems must be supported?
* What skills are required?

### Technology Guidelines

IBM Cloud has many service offerings for data integration, and the following section explains them and gives guidelines on which one to use.

#### Apache Spark

Apache Spark is often the first choice when it comes to cluster-grade data processing and machine learning. Apache Spark is a flexible option that also supports writing integration processes in SQL. But it’s missing a user interface.

* What throughput is required? Apache Spark scales linearly, so throughput is just a function of the cluster size.

* Which data types must be supported? Apache Spark works best with structured data, but binary data is supported as well.

* What source systems must be supported? Apache Spark can access various SQL and NoSQL data as well as file sources. A common data source architecture allows adding capabilities, and it has third-party project functions as well.

* What skills are required? Advanced SQL skills are required and you should have some familiarity with either Java programming, Scala, or Python.

#### IBM Data Stage on Cloud

IBM Data Stage is a sophisticated ETL (Extract Transform Load) tool. Its closed source and supports visual editing.

* What throughput is required? Data Stage can be used in cluster mode, which supports scale-out.

* Which data types must be supported? Data Stage has its roots in traditional Data Warehouse ETL and concentrates on structured data.

* What source systems must be supported? Again, Data Stage concentrates on relational database systems, but files can also be read, even on Object Store. In addition, data sources can be added using plug-ins that are implemented in the Java language.

* What skills are required? Because Data Stage is a visual editing environment, the learning curve is low. No programming skills are required.


#### Others

It’s important to know that data integration is mostly done using ETL tools, plain SQL, or a combination of both. ETL tools are mature technology, and many ETL tools exist. On the other hand, if streaming analytics is part of the project, it’s a good idea to check whether one of those technologies fits your requirements because reuse of such a system reduces technology heterogeneity.

## Application Component: Data Repository

This is the persistent storage for your data.

### Technology Component mapping guidelines

There are lots of technologies for persisting data, and most of them are relational databases. The second largest group are NoSQL databases, with file systems (including Cloud Object Store) forming the last one. The most important questions to be asked are:

* What is the impact of storage cost?
* Which data types must be supported?
* How well must point queries (on fixed or dynamic dimensions) be supported?
* How well must range queries (on fixed or dynamic dimensions) be supported?
* How well must full table scans be supported?
* What skills are required?
* What’s the requirement for fault tolerance and backup?
* What are the constant and peak ingestion rates?
* What amount of storage is needed?
* What does the growth pattern look like?
* What are the retention policies?


### Technology Mapping

IBM cloud has numerous service offerings for SQL, NoSQL, and file storage. The following section explains them and provides guidelines on when to use which one.

#### Relational databases

Dash DB is the Db2 BLU on the Cloud offering from IBM that features column store, advanced compression, and execution on SIMD instructions sets (that is, vectorized processing). But there are other options in IBM Cloud such as Informix, PostgreSQL, and MySQL.

* What is the impact of storage cost? Relational databases (RDBMS) have the highest requirements on storage quality. Therefore, the cost of relational storage is always the highest.

* Which data types must be supported? Relational databases are meant for structured data. Although there are column data types for binary data that can be swapped for cheaper storage, this is just an add-on and not a core function of relational databases.

* How well must point queries (on fixed or dynamic dimensions) be supported? RDBMS are great for point queries because an index can be created on each column.

* How well must range queries (on fixed or dynamic dimensions) be supported? RDBMS are great for range queries because an index can be created on each column.

* How well must full table scans be supported? RDBMS are trying to avoid full table scans in their SQL query optimizers. Therefore, performance is not optimized for full table scans (for example, contaminating page caches).

* What skills are required? You should have SQL skills, and if a cloud offering isn’t chosen, you should also have database administrator (DBA) skills for the specific database.

* What’s the requirement for fault tolerance and backup? RDMBS support continuous backup and crash fault tolerance. For recovery, the system might need to go offline.

* What are the constant and peak ingestion rates? Inserts using SQL are relatively slow, especially if the target table contains many indexes that must be rebalanced and updated. Some RDBMS support bulk inserts from files by bypassing the SQL engine, but then the table usually needs to go offline for that period.

* What amount of storage is needed? RDMBS perform very well to around 1 TB of data. Going beyond that is complex and needs advanced cluster setups.

* What does the growth pattern look like? RDBMS support volume management, so continuous growth usually isn’t a problem, even at run time. For shrinking, the system might need to be taken offline.

* What are the retention policies? RDBMS usually support automated retention mechanisms to delete old data automatically.


#### NoSQL databases

The most prominent NoSQL databases like Apache CouchDB, MongoDB, Redis, RethinkDB, ScyllaDB (Cassandra), and InfluxCloud are supported.

* What is the impact of storage cost? NoSQL databases are usually storage fault-tolerant, by default. Therefore, quality requirements on storage are less, which brings down storage cost.

* Which data types must be supported? Although NoSQL databases are meant for structured data as well, they usually use JSON as a storage format, which can be enriched with binary data. Although, a lot of binary data attached to a JSON document can bring the performance down as well.

* How well must point queries (on fixed or dynamic dimensions) be supported? Some NoSQL databases support the creation of indexes, which improves point query performance.

* How well must range queries (on fixed or dynamic dimensions) be supported? Some NoSQL databases support the creation of indexes, which improves range query performance.

* How well must full table scans be supported? NoSQL databases perform very well at full table scans. The performance is only limited by the I/O bandwidth to storage.

* What skills are required? Typically, special query language skills are required for the application developer and if a cloud offering isn’t chosen, database administrator (DBA) skills are needed for the specific database.

* What’s the requirement for fault tolerance and backup? NoSQL databases support backups in different ways. But some aren’t supporting online backup. NoSQL databases are usually crash fault tolerant, but for recovery, the system might need to go offline.

* What are the constant and peak ingestion rates? Usually, no indexes need to be updated and data doesn’t need to be mapped to pages. Ingestion rates are usually only bound to I/O performance of the storage system.

* What amount of storage is needed? RDMBS perform well to approximately 10 – 100 TB of data. Cluster setups on NoSQL databases are much more straightforward than on RDBMS. Successful setups with >100 nodes and > 100.000 database reads and writes per second have been reported.

* What does the growth pattern look like? The growth of NoSQL databases is not a problem. Volumes can be added at run time. For shrinking, the system might need to be taken offline.

* What are the retention policies? NoSQL databases don’t support automated retention mechanisms to delete old data automatically. Therefore, this must be implemented manually, resulting in range queries on the data corpus.

#### Object storage

Cloud object storage makes it possible to store practically limitless amounts of data. It is commonly used for data archiving and backup, for web and mobile applications, and as scalable, persistent storage for analytics. So, let’s take a look.

* What is the impact of storage cost? Object storage is the cheapest option for storage.

* Which data types must be supported? Because object storage resembles a file system, any data type is supported.

* How well must point queries (on fixed or dynamic dimensions) be supported? Because object storage resembles a file system, external indices must be created. However, it’s possible to access specific storage locations through folder and file names and file offsets.

* How well must range queries (on fixed or dynamic dimensions) be supported? Because object storage resembles a file system, external indices must be created. However, it’s possible to access specific storage locations through folder and file names and file offsets. Therefore, range queries on a single defined column (for example, data) can be achieved through hierarchical folder structures.

* How well must full table scans be supported? Full table scans are bound only by the I/O bandwidth of the object storage.

* What skills are required? On a file level, working with object storage is much like working with any file system. Through Apache SparkSQL and IBM Cloud SQL Query, data in Object storage can be accessed with SQL. Because object storage is a cloud offering, no administrator skills are required. IBM Object Storage is available for on-premises as well using an appliance box.

* What’s the requirement for fault tolerance and backup? Fault tolerance and backup is completely handled by the cloud provider. Object storage supports intercontinental data center replication for high-availability out of the box.

* What are the constant and peak ingestion rates? Ingestion rates to object storage is bound by the uplink speed to the object storage system.

* What’s the amount of storage needed? Object storage scales to the petabyte range.

* What does the growth pattern look like? Growth and shrinking on object storage is fully elastic.

* What are the retention policies? Retention of data residing in object storage must be done manually. Hierarchical file and folder layout that is based on data and time helps here. Some object storage support automatic movement of infrequently accessed files to colder storage (colder means less cost, but also less performance, or even higher cost of accesses to files).

## Application Component: Discovery and exploration

This component allows for visualization and creation of metrics of data.

### Technology Component mapping guidelines

In various process models, data visualization and exploration is one of the first steps. Similar tasks are also applied in traditional data warehousing and business intelligence. So when choosing a technology, ask the following questions:

* What type of visualizations are needed?
* Are interactive visualizations needed?
* Are coding skills available or required?
* What metrics can be calculated on the data?
* Do metrics and visualization need to be shared with business stakeholders?

### Technology Mapping

IBM cloud has many service offerings for data exploration. Some of the offerings are open source, and some aren’t.

#### Jupyter, Python, pyspark, scikit-learn, pandas, Matplotlib, PixieDust

Jupyter, Python, pyspark, scikit-learn, pandas, Matplotlib, PixieDust are all open source and supported in IBM Cloud. Some of these components have overlapping features and some of them have complementary features. This can be determined by answering the architectural questions.

* What type of visualizations are needed? Matplotlib supports the widest range of possible visualizations including run chars, histograms, box-plots, and scatter plots. PixieDust (as of V1.1.11) supports tables, bar charts, line charts, scatter plots, pie charts, histograms, and maps.

* Are interactive visualizations needed? Matplotlib creates static plots and PixieDust supports interactive ones.

* Are coding skills available or required? Matplotlib requires coding skills, but PixieDust does not. For computing metrics, some code is necessary.

* What metrics can be calculated on the data? Using scikit-learn and pandas, all state-of-the-art metrics are supported.

* Do metrics and visualization need to be shared with business stakeholders? Watson Studio supports sharing of Jupyter Notebooks, also using a fine-grained user and access management system.

#### SPSS Modeler

SPSS Modeler is available in the cloud and also as stand-alone product.

* What type of visualizations are needed? SPSS Modeler supports the following visualizations out of the box:
    * Bar
    * Pie
    * 3D Bar
    * 3D Pie
    * Line
    * Area
    * 3D Area
    * Path
    * Ribbon
    * Surface
    * Scatter
    * Bubble
    * Histogram
    * Box
    * Map

    You can get more information in the [IBM Knowledge Center](https://www.ibm.com/support/knowledgecenter/en/SS3RA7_15.0.0/com.ibm.spss.modeler.help/graphboard_creating_types.htm).

* Are interactive visualizations needed? SPSS Modeler Visualizations are not interactive.

* Are coding skills available or required? SPSS Modeler doesn’t require any coding skills.

* What metrics can be calculated on the data? All state-of-the-art metrics are supported using the Data Audit node.

* Do metrics and visualization need to be shared with business stakeholders? Watson Studio supports sharing of SPSS Modeler Flows, also using a fine-grained user and access management system. However, those might not be suitable to stakeholders.

## Application Component: Actionable insights

This is where most of your work fits in. It’s where you create and evaluate your machine learning and deep learning models.

### Technology Component mapping guidelines

There are numerous technologies for creating and evaluating machine learning and deep learning models. Although different technologies differ in function and performance, those differences are usually miniscule. Therefore, the questions you should ask yourself are:

* What are the available skills regarding programming languages?
* What are the costs of skills regarding programming languages?
* What are the available skills regarding frameworks?
* What are the costs of skills regarding frameworks?
* Is model interchange required?
* Is parallel- or GPU-based training or scoring required?
* Do algorithms need to be tweaked or new algorithms be developed?

### Technology Mapping

Because there’s an abundance of open and closed source technologies, we are highlighting the most relevant ones in this article. Although it’s the same for the other sections as well, decisions made in this section are very prone to change due to the iterative nature of this process model. Therefore, changing or combining multiple technologies is no problem, although the decisions that led to those changes should be explained and documented.


#### SPSS Modeler

This article has already introduced SPSS Modeler.

* What are the available skills regarding programming languages? As a complete UI-based offering, SPSS doesn’t need programming skills, although it can be extended using R scripts.

* What are the costs of skills regarding programming languages? As a complete UI-based offering, SPSS doesn’t need programming skills, although it can be extended using R scripts.

* What are the available skills regarding frameworks? SPSS is an industry leader, so skills are generally available.

* What are the costs of skills regarding frameworks? Expert costs are usually lower in UI-based tools than in programming frameworks.

* Is model interchange required? SPSS Modeler supports PMML.

* Is parallel- or GPU-based training or scoring required? SPSS Modeler supports scaling through IBM Analytics Server or IBM Watson Studio using Apache Spark.

* Do algorithms need to be tweaked or new algorithms be developed? SPSS Modeler algorithms can’t be changed, but you can add algorithms or customizations using the R language.

#### R/R-Studio

R and R-Studio are standards for open source-based data science. They’re supported in IBM Cloud through IBM Watson Studio as well.

* What are the available skills regarding programming languages? R programming skills are usually widely available because it’s a standard programming language in many natural science-based university curriculums. It can be acquired rapidly because it is a procedural language with limited functional programming support.

* What are the costs of skills regarding programming languages? Costs of R programming are usually low.

* What are the available skills regarding frameworks? R is not only a programming language but also requires knowledge of tooling (R-Studio), and especially knowledge of the R library (CRAN) with 6000+ packages.

* What are the costs of skills regarding frameworks? Expert costs are correlated with knowledge of the CRAN library and years of experience and in the range of usual programmer costs.

* Is model interchange required? Some R libraries support exchange of models, but it is not standardized.

* Is parallel- or GPU-based training or scoring required? Some R libraries support scaling and GPU acceleration, but it is not standardized.

* Do algorithms need to be tweaked or new algorithms be developed? R needs algorithms to be implemented in C/C++ to run fast. So, tweaking and custom development usually involves C/C++ coding.

#### Python, pandas and scikit-learn

Although R and R-Studio have been the standard for open source-based data science for a while, Python, pandas, and scikit-learn are right behind them. Python is a much cleaner programming language than R and easier to learn. Pandas is the Python equivalent to R data frames, supporting relational access to data. Finally, scikit-learn nicely groups all necessary machine learning algorithms together. It’s supported in IBM Cloud through IBM Watson Studio as well.

* What are the available skills regarding programming languages? Python skills are very widely available because Python is a clean and easy to learn programming language.

* What are the costs of skills regarding programming languages? Because of Python’s properties mentioned above, the cost of Python programming skills is very low.

* What are the available skills regarding frameworks? Pandas and scikit-learn are very clean and easy-to-learn frameworks. Therefore, skills are widely available.

* What are the costs of skills regarding frameworks? Because of the properties mentioned above, the costs of skills are very low.

* Is model interchange required? All scikit-learn models can be (de)serialized. PMML is supported through third-party libraries.

* Is parallel- or GPU-based training or scoring required? Neither GPU nor scale-out is supported, although scale-up capabilities can be added individually to make use of multiple cores.

* Do algorithms need to be tweaked or new algorithms be developed? scikit-learn algorithms are very cleanly implemented. They all stick to the pipelines API, making reuse and interchange easy. Linear algebra is handled throughout with the numpy library. Therefore, tweaking and adding algorithms is straightforward.

#### Python, Apache Spark and SparkML

Although Python, pandas, and scikit-learn are more widely adopted, the Apache Spark ecosystem is catching up, especially because of its scaling capabilities. It’s supported in IBM Cloud through IBM Watson Studio as well.

* What are the available skills regarding programming languages? Apache Spark supports Python, Java programming, Scala, and R as programming languages.

* What are the costs of skills regarding programming languages? The costs depend on what programming language is used, with Python typically the cheapest.

* What are the available skills regarding frameworks? Apache Spark skills are in high demand and usually not available.

* What are the costs of skills regarding frameworks? Apache Spark skills are in high demand and are usually expensive.

* Is model interchange required? All SparkML models can be (de)serialized. PMML is supported through third-party libraries.

* Is parallel- or GPU-based training or scoring required? All Apache Spark jobs are inherently parallel. However, GPU’s are only supported through third-party libraries.

* Do algorithms need to be tweaked or new algorithms be developed? As in scikit-learn, algorithms are very cleanly implemented. They all stick to the pipelines API, making reuse and interchange easy. Linear algebra is handled throughout with built-in Apache Spark libraries. Therefore, tweaking and adding algorithms is straightforward.

#### Apache SystemML

When it comes to relational data processing, SQL is a leader, mainly because an optimizer takes care of optimal query executions. Think of SystemML as an optimizer for linear algebra that’s capable of creating optimal execution plans for jobs running on data parallel frameworks like Apache Spark.

* What are the available skills regarding programming languages? SystemML has two domain-specific languages (DSL) with R and Python syntax.

* What are the costs of skills regarding programming languages? Although the DSLs are like R and Python, there is a learning curve involved.

* What are the available skills regarding frameworks? SystemML skills are very rare.

* What are the costs of skills regarding frameworks? Due to the high learning curve and skill scarcity, costs might get high.

* Is model interchange required? SystemML models can be (de)serialized. PMML is not supported. SystemML can import and run Caffe2 and Keras models.

* Is parallel- or GPU-based training or scoring required? All Apache Spark jobs are inherently parallel. SystemML uses this property. In addition, GPU’s are supported as well.

* Do algorithms need to be tweaked or new algorithms be developed? Although SystemML comes with a large set of pre-implemented algorithms for machine learning and deep learning, its strengths are in tweaking existing algorithms or implementing new ones because the DSL allows for concentrating on the mathematical implementation of the algorithm. The rest is handled by the framework. This makes it an ideal choice for these kind of tasks.

#### Keras and TensorFlow

TensorFlow is one of the most widely used deep learning frameworks. At its core, it is a linear algebra library supporting automatic differentiation. TensorFlow’s Python-driven syntax is relatively complex. Therefore, Keras provides an abstraction layer on top of TensorFlow. Both frameworks are seamlessly supported in IBM Cloud through Watson Studio and Watson Machine Learning.

* What are the available skills regarding programming languages? Python is the core programming language for Keras and TensorFlow.


* What are the available skills regarding frameworks? Keras and TensorFlow skills are relatively rare.

* What are the costs of skills regarding frameworks? Due to the high learning curve and skill scarcity, costs might get high.

* Is model interchange required? Keras and TensorFlow have their own model exchange formats. There are converters from and to ONNX.

* Is parallel- or GPU-based training or sc oring required? Running TensorFlow on top of ApacheSpark is supported through TensorFrames and TensorSpark. Keras models can be run on ApacheSpark using DeepLearning4J and SystemML. Both of the latter frameworks also support GPUs. TensorFlow (and therefore, Keras) support GPU natively as well.

* Do algorithms need to be tweaked or new algorithms be developed? TensorFlow is a linear algebra execution engine. Therefore, it’s optimally suited for tweaking and creating new algorithms. Keras is a very flexible deep learning library that supports many neural network layouts.


## Application Component: Applications and Data Products

Models are fine, but their value rises when they can be consumed by the ordinary business user. Therefore, you must create a data product. Data products don’t necessarily need to stay on the cloud. They can be pushed to mobile or enterprise applications.

In contrast to machine learning and deep learning frameworks, the space of frameworks to create data product is tiny. This might reflect what the current state-of-the-art technology in data science concentrates on. Depending on the requirements, data products are relatively visualization-centric after a lot of user input data has been gathered. They also might involve asynchronous workflows as batch data integration and model training and scoring is performed within the workflow. 

Questions to ask about the technology are:

* What skills are present for developing a data product?
* What skills are necessary for developing a data product?
* Is instant feedback required or is batch processing accepted?
* What’s the degree of customization needed?
* What’s the target audience? Is cloud scale deployment for a public use base required?

### Technology Mapping

Currently, only a limited set of frameworks and technologies is available in different categories. In the following section, I’ve explained the most prominent examples.

#### R-Shiny

R-Shiny is a great framework for building data products. Closely tied to the R language, it enables data scientists to rapidly create a UI on top of existing R-scripts.

* What skills are present for developing a data product? R-Shiny requires R development skills. So, it best fits into an R development ecosystem.

* What skills are necessary for developing a data product? Although based on R, R-Shiny needs additional skills. For experienced R developers, the learning curve is steep and additional knowledge to acquire is minimal.

* Is instant feedback required or is batch processing accepted? The messaging model of R-Shiny supports instant UI feedback when server-side data structures are updated. Therefore, the response time is independent of the framework and should be considered and resolved programmatically on the server side.

* What’s the degree of customization needed? Although R-Shiny is an extensible framework, extending it requires a deep understanding of the framework and R-Technology. Out of the box, there is a large set of UI widgets end elements supported, allowing for very customizable applications. If requirements go beyond those capabilities, costly extensions are required.

* What’s the target audience? Is cloud scale deployment for a public use base required? R-Shiny applications look very professional, although quite distinguishable. Therefore, the target audience must accept the UI design limitations. R-Shiny is best dynamically scaled horizontally in a container environment like Kubernetes. Ideally, every user session runs in its own container because R and R-Shiny are very sensitive to main memory shortages

#### Node-RED

Although Node-RED is a no-code/low-code data flow/data integration environment, because of its modular nature it supports various extensions including the dash boarding extension. This extension allows for fast creation of user interfaces including advanced visualizations that are updated in real-time.

* What skills are present for developing a data product? Due to the completely graphical user interface-based software development approach, only basic programming skills are required to build data products with Node-RED.

* What skills are necessary for developing a data product? Any resource familiar with flow-based programming as used in many state-of-the-art ETL and data mining tools will have a fast start with Node-RED. Basic JavaScript knowledge is required for creating advanced flows and for extending the framework.

* Is instant feedback required or is batch processing accepted? The UI instantly reflects updates of the data model. Therefore, all considerations regarding feedback delay should be considered when developing the data integration flow or potentially involved calls to synchronous or asynchronous third-party services.

* What’s the degree of customization needed? Node-RED is a Node.js/JavaScript-based framework. Custom UI widgets require advanced Node.js development skills.

* What’s the target audience? Is cloud scale deployment for a public use base required? The Node-RED dashboard can be deployed for a pubic user base as long as the limitations regarding UI customization are acceptable. Because Node.js runs on a single threaded event loop, scaling must be done horizontally, preferably using a containerized environment. Note: The Internet of Things Starter kit in IBM Cloud supports horizontal scaling out of the box.

#### D3

When it comes to custom application development, D3 is one of the most prominent and most widely used visualization widget frameworks with a large open source ecosystem contributing a lot of widgets for every desirable use case. There’s a good chance that you can find a D3 widget to fit your use case.

* What skills are present for developing a data product? D3 fits best into an existing, preferably JavaScript-based developer ecosystem, although JavaScript is only required on the client side. Therefore, on the server side, any REST-based endpoints in any programming language are supported. One example is REST endpoints accessed by a D3 UI provided by Apache Livy that encapsulates Apache Spark jobs.

* What skills are necessary for developing a data product? D3 requires sophisticated D3 skills and at least client-side JavaScript skills. Skills in a JavaScript AJAX framework like AngularJS are highly recommended. On the server side, capabilities of providing REST endpoints to the D3 applications are required.

* Is instant feedback required or is batch processing accepted? The UI instantly reflects updates of the data model. Therefore, all considerations regarding feedback delay should be considered when developing the data integration flow or potentially involved calls to synchronous or asynchronous third-party services.

* What’s the degree of customization needed? D3 applications usually are implemented from scratch. Therefore, this solution provides the most flexibility to the end user.

* What’s the target audience? Is cloud scale deployment for a public use base required? As a cloud native application, a D3-based data product can provide all capabilities for horizontal and vertical scaling and full adoption to user requirements.


## Application Component: Security, information governance and systems management

This important step can be easily forgotten. It’s important to control who has access to which information for many compliance regulations. In addition, modern data science architectures involve many components that require operational aspects as well.

Data privacy is a major challenge in many data science projects. Questions that you should ask are:

* What granularity is required for managing user access to data assets?
* Are existing user registries required to be integrated?
* Who is taking care of operational aspects?
* What are the requirements for data retention?
* What level of security against attacks from hackers is required?

### Technology Mapping

Again, there’s a lot of software for this as well as ways to solve the requirements involved in this topic. We have chosen representative examples for this article.

Deploying a productive client-facing web application brings with it serious risks. IBM Cloud Internet Services provides global points of presence (PoPs). It includes domain name service (DNS), global load balancer (GLB), distributed denial of service (DDoS) protection, web application firewall (WAF), transport layer security (TLS), and caching.

* What level of security against attacks from hackers is required? Internet Services is using services from CloudFlare, the world leader in this space.

#### IBM App ID

Identity Management allows for cloud-based user and identity management for web and mobile applications, APIs, and back-end systems. Cloud users can sign up and sign in with App ID’s scalable user registry or social login with Google or Facebook. Enterprise users can be integrated using SAML 2.0 federation.

* What granularity is required for managing user access to data assets? IBM App ID supports user management but no group/roles. Therefore, fine-grained access must be managed within the application.

* Are existing user registries required to be integrated? IBM App ID supports registry integration using SAML 2.0 federation.

#### Object Storage

Object Storage is a standard when it comes to modern, cost-effective cloud storage.

* What granularity is required for managing user access to data assets? IBM Identity and Access Management (IAM) integration allows for granular access control at the bucket-level using role-based policies.

* What are the requirements for data retention? Object storage supports different storage classes for frequently accessed data, occasionally accessed data, and long-term data retention with standard, vault, and cold vault. The Flex class allows for dynamic data access and automates this process. Physical deletion of data still must be triggered externally.

* Who is taking care of operational aspects? Regional and cross-region resiliency options allow for increased data reliability.

* What level of security against attacks from hackers is required? All data is encrypted at rest and in flight by default. Keys are automatically managed by default, but optionally can be self-managed or managed using IBM Key Protect.

#### IBM Cloud PaaS/SaaS

IBM Cloud PaaS/SaaS eliminates operational aspects from data science projects because all components involved are managed by IBM.

* Who is taking care of operational aspects? In PaaS/SaaS, cloud operational aspects are being taken care of by the cloud provider.




