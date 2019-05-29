# Data - AI - Analytics Reference Architecture

In this reference architecture, we are focusing on defining architecture patterns and best practices to build data and AI intensive applications. We are addressing how to integrate data governance, machine learning practices and the full life cycle of a cloud native solution development under the same reference architecture to present a holistic point of view on how to do it.

When we consider development of  Data and AI intensive applications  or  *intelligent Application*  it is helpful to think of how the combination of three underlying architecture patterns

+ Cloud Native application architecture patterns
+ Data architecture patterns
+ AI architecture patterns

provides the right foundation to enable us to develop these *intelligent applications* in a highly agile cloud native way.


By considering the nature of joins between the architectures we can also understand how the different roles such as Software Engineer, Data Engineer, and Data Scientist relate and work together in the development of such solutions.

The following diagram illustrates the top-level view of a Data centric and AI reference architecture. There is no argument about it, AI without Data will not exist. The architecture illustrates the need for strong data management capabilities inside a 'data platform', on which AI capabilities are plugged in.

![](data-ai-ra.png)

The data layer or platform addresses the data collection and transformation to move data to local store. But it is necessary to avoid moving data when there is no need to do transformations or no impact to the data sources by adding readers, so a virtualization capability is necessary to open a view on remote data sources. On the AI side, data scientists need to perform data analysis, which includes making sense of the data using data visualization. To build a model they need to define features, and the AI layer supports feature engineering. Then to build the model, the development environment helps to select different algorithm and to tune the hyper parameters. The execution can be done on local cluster or can be executed, at the big data scale level, to machine learning cluster.

 <TBC>

 # Data is fundamental

 What makes managing data so challenging and complex is that, by itself, data doesn't do anything. Data is inert; it is not self-organizing or even self-understanding. In the DIKW pyramid, data is the base with the least amount of perceived usefulness. Information has higher value than data, knowledge has higher value than information, and wisdom has the highest perceived value of all. Data requires something else—a program, a machine, or even a person—to move up the value chain and become information.

 ![](data-dikw-ai.png)

 The IBM AI Ladder also begins with data. You get higher business value when you perform business-assisted functions such as analytics, machine learning, or artificial intelligence on top of the data.




## Data platform

### Principles

1. There is a spectrum from single source of the truth to data hyper personalisation . Fundamentally we need to embrace the fact that different roles need specialised data stores with redundancy and replication between them Exercise specialisation through connectivity
1. Different application patterns apply different data specialisation.
1. There is a clear dependency between AI and Data management, but for an intelligent application context there are a Data concern, a AI model management concern, a multi cloud deployment concerns.
1. As you constrain scalability and network connectivity you also constrain data store, data structure and data access.    
1. The value and way of storing and representing data may change with its age. Value also comes in the recognition of patterns in the time series.

# Patterns

## Intelligent application

## Business intelligence

## Stream analytics
