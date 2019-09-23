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


## Data is fundamental

Data is a fundamental element of every business and therefore fundamental to our architecture.   Data is our record of current state of the business, the history of what has happened, and is the base which enables us to predict what may happen in the future.

However, on its own data doesn't do anything and to realise value from data we have to do something with it, we have to understand it, and act on it, Typically this requires something other than the data such as a computer program, a query, or a user (machine or person).

Perhaps one of the biggest and most complex challenges comes with managing the data. Data is inert; it is not self-organizing or even self-understanding. So how do we manage the data , how do we organize an attach meaning so that the data can easily be used bu the business, or a computer program etc.




In the
[DIKW pyramid](https://en.wikipedia.org/wiki/DIKW_pyramid),

* Data is the base with the least amount of perceived usefulness.
* Information has higher value than data.
* Knowledge has higher value than information.
* Wisdom has the highest perceived value of all.

To move up the value chain  *data* requires something else such as a program, a machine, or even a person—to add to understanding to it so that it becomes *Information*.

By organizing and classifying *information*, the value chain expands from *data* and *information* to be regarded as *knowledge*.


The pinnacle of the data value chain is *Wisdom*. Wisdom results in a combination of inert data, which is the fundamental raw material in the modern digital age, combined with a series of progressive traits such as:
* perspective
* context
* understanding
* learning
* the ability to reason.

With the advent of Cognitive computing and artificial intelligence these traits can now be attributed to both a person and a machine.

 ![](images/data-dikw-ai.png)

 The IBM AI Ladder loosely parallels the DIKW pyramid in that the AI Ladder represents a progressive movement towards value creation within an enterprise.

 Increased value can be gained from completing activities at each step of the AI Ladder, with the potential to recognize higher levels of value, the higher the ladder is climbed.

The AI Ladder contains four discrete levels:
* Collect
* Organize
* Analyze
* Infuse.

The first rung is *Collect*, a primitive action that serves as the first element towards making data actionable and to help drive automation, insights, optimization, and decision-making. *Collect* is an ability to attach to a data source – whether transient or persistent, real or virtual, and while being agnostic as to its actual location or its originating (underlying) technology. In linking to the DIKW pyramid we could say that, data lies below the first rung, recognizing the inert nature of data.

The AI Ladder progresses through the rungs to *infuse*, a state of capability that means an enterprise has taken artificial intelligence beyond a science project. Infusion means that advanced analytical models have been interwoven into the essential fabric of an application or system whereby driving new or improved business capabilities.


### Data as a differentiator

Data needs to become treated as a corporate asset. Data has the power to transform any organization, add monetary value, and enable the workforce to accomplish extraordinary things. Data-driven cultures can realize higher business returns.

While a dog house can be built without much planning, you cannot build a modern skyscraper with the same approach. The scale of preserved data across a complex hybrid cloud or multi-cloud topology requires discipline, even for an organization that embraces agile and adaptive philosophies.

Data can and should be used to drive analytical insights. But what considerations and planning activities are required to enable the generation of insights, the ability to take action, and the courage to make decisions? Although the planning and implementation activities to maximize the usefulness of your data can require some deep thinking, organizations can become data-centric and data-driven in a short time.

More so than ever, businesses need to move rapidly. Organizations must respond to changing needs as quickly as possible or risk becoming irrelevant. This applies to both private or public organizations, irrespective of size.

Data and the related analytics are key to differentiation, but traditional approaches are often ad hoc, naive, complex, difficult, and brittle. This can result in delays, business challenges, lost opportunities, and the rise of [unauthorized projects](https://developer.ibm.com/articles/architectural-thinking-in-the-wild-west-of-data-science/).

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

## Towards Data-Centricity

Drivers for what causes change within a business can be regarded as being stochastic. Whether foreseen or randomly determined, each change is likely to require new data – data that an organization has not previously anticipated. Increased data volumes, increases in the number of data sources, increases to the rates of data ingestion, and increases in the variety of the types of data are nothing more than de facto a prioris.

While users are likely to have access to terabytes, petabytes, or even exabytes of data from data streams, IOT-sensors, transactional systems, and so on, if the data is not properly incorporated, managed, controlled, enriched, governed, measured, and deployed then the data may not only become useless, the data may become a liability.

The activities to properly handle data and to pursue the AI Ladder, can be shown in the three solution areas of IBM Data and AI offerings:

* [Hybrid Data Management](https://www.ibm.com/analytics/data-management)
    * Collect all types of data, structured and unstructured
    * Include all open sources of data
    * Single platform with a common application layer
    * Write once and deploy anywhere
* [Unified Governance and Integration](https://www.ibm.com/analytics/unified-governance-integration)
    * Satisfy all matters of finding, cataloging and masking data
    * Integrate fluid data sets
    * Deliver built-in compliance
    * Leverage advanced machine learning capabilities
* [Data Science](https://www.ibm.com/analytics/data-science) and [Business Analytics](https://www.ibm.com/analytics/business-analytics)
    * Deliver descriptive, prescriptive and predictive insights across all types of data
    * Enable advanced analytics and data science methods

## Making data enabled and active

There are five key tenets to making data enabled and active:

* Developing a data strategy
* Developing a data architecture
* Developing a data topology for analytics
* Developing an approach to unified governance
* Developing an approach to maximizing the accessibility of data consumption

If data is an enabler, then analytics can be considered one of the core capabilities that is being enabled.

Analytics can be a complex and involved discipline that encompasses a broad and diverse set of tools, methods, and techniques. One end of the IBM AI Ladder is enabled through data in a static format such as a pre-built report; the other end is enabled through deep-learning and advanced artificial intelligence. Between these two ends, the enablement methods include diagnostic analytics, machine learning, statistics, qualitative analysis, cognitive analysis, and more. A robot, a software interface, or a human may need to apply multiple techniques within a single task or across the role that they perform in driving insight, taking action, monitoring, and making decisions.
