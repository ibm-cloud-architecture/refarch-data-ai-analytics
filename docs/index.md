# Data and AI Reference Architecture

!!! abstract
  In this reference architecture,  we define the architecture patterns and best practices for developing Data and AI intensive applications or  *Intelligent applications*.  We consider how  data, data governance, analytics and machine learning practices join with the agile life cycle of cloud native application development to enable the development and delivery of *Intelligent Applications*.

When we consider the  Data and AI Reference Architecture in terms of developing *intelligent applications* it becomes apparent that we are looking at bringing together three architecture patterns:

+ Cloud Native application architecture patterns
+ Data architecture patterns
+ AI architecture patterns

We can think of the Data and AI reference architecture being the sum of these architecture patterns, plus the joins between them.  The joins are also key to understanding how  Software Engineers, Data Engineers, and Data Scientist, relate and work together in the development of such *Intelligent applications*.

As we look to methodology for Developing such solutions we need to consider a prescriptive approach  which brings  those project stakeholders together to be successful.  To do this we adopt a four layers approach:

* **[COLLECT](#collect-making-data-simple-and-accessible)** data to make them easier to consume and accessible
* **[ORGANIZE](#organize-trusted-governed-analytics)** data to create a trusted analytics foundation on data with business meaning
* **[ANALYZE](#analyze-insights-on-demand)** to scale business insight with AI everywhere
* **[INFUSE](#infuse-operationalize-ai-with-trust-and-transparency)** to operationalize AI with trust and transparency

The figure below represents how those layers are related to each other:

![](images/ladder-ai.png)

## IBM Data and AI Conceptual Architecture

Based on the above prescriptive approach, we cans see that a Data centric and AI reference architecture needs to implement the four layers as shown in the following diagram.

![](images/data-ai-ra.png)

This architecture diagram illustrates
1. strong data collection and management capabilities
1. inside a 'multi cloud data platform' (dark blue area)
1. on which AI capabilities are plugged in to support analyze done by data scientists (machine learning workbench and business analytics).

The data platform addresses the data **collection** and **transformation** tasks to move data to a (cloud)local highly scalable data **store**.

However we must also recognise that there are cases, where data movement can or must be avoided. For examples where:
* no transformations necessary (e.g. accessing an external data mart via SQL or API)
* no performance impact (e.g. materialized SQL views served by a parallel database backend)
* regulatory aspects (each reach access to a data source must be logged to an audit log)
* real-time aspects (data must be processed immediately, latency of storage too high)
* size (data movement too expensive from a network bandwith perspective, **compute** must move toward data source)
* privacy (data can't be copied, only aggregates as a result of **compute** can be moved)
* network partition (data source unreliable e.g. remote IoT Gateway)

In such cases the data platform provides a virtualization capability which can open a view on remote data sources without moving data.

In **Analyze** data scientists need to perform:
* **data analysis**, which includes making sense of the data using data **visualization**.
* **feature engineering** to define the features they need to build an ML model.

Then to **build the model**, the development environment provides the AI frameworks and helps the data scientist to select and combine the different algorithms and to tune the hyper parameters.
The execution can be done on local cluster or can be executed, at the big data scale level, to a machine learning cluster.

Once the model provides acceptable accuracy level, it can be published so that it can be consumed or *infused* within an application or as a service.

The model management capability supports the meta-data definition and the life cycle management of the model (data lineage).

Once the model is deployed, **monitoring** capabilities, ensures the model is still accurate and
not biased.

The **intelligent application**, is represented as a combination of capabilities at the top of the diagram, it can be an application we develop, a business process, an ERP or CRM application, etc.  running anywhere on cloud fog, or mist computing.

The intelligent application, accesses the deployed model, sing APIs, and may consumes pre-built models or Cognitive services, such as:  
* **speech to text and text to speech** services  
* **image recognition**, a **tone analyzer** services
* **NLU** Natural Language Understanding and chatbot services.

## Data and AI reference architecture capabilities

In this view of the reference architecture we have zoomed in a level to show the detail of how we realize the required capabilities.

![](images/data-ai-ra-3.jpg)

The boundary rectangles are color coded to map the higher level purposes: *collect, organize, analyze and infuse* with each icon representing a capability.

This diagram becomes the foundation of  the *data AI reference architecture*  an we will expend details for

* [Data preparation](preparation/gov-data-lake.md)
* [AI model development](model-dev/README.md)
* [Application runtime](runtimes/README.md)

environments in following notes.

### Mapping to products

The following diagrams illustrate the product mapping to realize the required capability.

![](images/data-ai-ra-products.png)

## Data platform

### Principles

1. There exists a spectrum ranging from single source of truth to data hyper personalisation. Fundamentally, we need to embrace the fact that different roles need specialised data stores with redundancy and replication between them, exercising specialisation through connectivity.
1. Different application patterns apply different data specialisation.
1. There is a clear dependency between AI and Data Management, but in an **Intelligent Application** context there is a Data concern, a AI model management concern, and multi cloud deployment concerns.
1. As you constrain scalability and network connectivity you also constrain data store, data structure and data access.    
1. The value and way of storing and representing data may change with its age. Value also comes in the recognition of patterns in the time series.

Today, our users may have access to terabytes, petabytes, or even exabytes of data. But if that data is not collected, organized, managed, controlled, enriched, governed, measured, and analyzed, that data is not just useless, it can become a liability.

#### Collect – Making Data Simple and Accessible

The first rung of the AI Ladder is *Collect* and is how an enterprise can formally incorporate data into any analytic process. Properties of data include:

* Structured, semi-structured, unstructured
* Proprietary or open
* In the cloud or on-premise
* Any combination above

#### Organize – Trusted, Governed Analytics

The second rung of the AI Ladder is *Organize* and is about how an enterprise can make data known, discoverable, usable, and reusable. The ability to organize is prerequisite to becoming data-centric. Additionally, data of inferior quality or data that can be misleading to a machine or end-user can be governed in such that any use can be adequately controlled. Ideally, the outcome of *Organize* is a body of data that is appropriately curated and offers the highest value to an enterprise.
Organize allows data to be:

* Discoverable
* Cataloged
* Profiled
* Categorized
* Classified
* Secured (e.g. through policy-based enforcement)
* A source of truth and utility

#### Analyze – Insights On-Demand

The third rung of the AI Ladder is *Analyze* and is about how an organization approaches becoming a data-driven enterprise. Analytics can be human-centered or machine-centered. In this regard the initials AI can be interpreted as Augmented Intelligence when used in a human-centered context and Artificial Intelligence when used in a machine-centered context. Analyze covers a span of techniques and capabilities from basic reporting and business intelligence to deep learning. Analyze, through data, allows to:

* Determine what has happened
* Determine what is happening
* Determine what might happen
* Compare against expectations
* Automate and optimize decisions

#### Infuse – Operationalize AI with Trust and Transparency

The fourth rung of the AI Ladder is *Infuse* and is about how an enterprise can use AI as a real-world capability. Operationalizing AI means that models can be adequately managed which means an inadequately performing model can be rapidly identified and replaced with another model or by some other means. Transparency infers that advanced analytics and AI are not in the realm of being a dark art and that all outcomes can be explained. Trust infers that all forms of fairness transcend the use of a model. *Infuse* allows data to be:

* Used for automation and optimization
* Part of a causal loop of action and feedback
* Exercised in a deployed model
* Used for developing insights and decision-making
* Beneficial to the data-driven organization
* Applied by the data-centric enterprise