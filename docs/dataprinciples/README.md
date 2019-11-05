# Data and AI Architecture Principles

As we look to the Data and AI reference architecture it becomes essential that we have deep understanding of the range of uses, how value is realized from data, the dependencies between data AI and applications, and the constraints which we may face in multi-cloud environments with compute power, data storage and network connectivity/latency.

Through consideration of these aspects we have pulled out the following *Guiding Principles* which help to guide both the architecture patterns and our thinking or methodology for how to approach developing **Intelligent applications**:

1. There exists a spectrum of concerns ranging from single source of truth to data hyper personalisation.  
1. Different roles require specialised data stores with redundancy and replication between them
1. Different application patterns apply different data specialisations.
1. There is a dependency between AI and Data Management.
1. With an **Intelligent Application** there is
    
    * a Data concern,
    * an AI model management concern,
    * a Multi cloud deployment concern.

1. As you constrain scalability and network connectivity you also constrain data storage, data structure and data access.    
1. The value and way of storing and representing data may change with its age.
1. Value also comes in the recognition of patterns in a time series.

Looking ahead with the modern digital business we will increasingly see our users have access to terabytes, petabytes, or even exabytes of data. If this data is not *collected, organized, managed, controlled, enriched, governed, measured, and analyzed*, the data is not just useless, it becomes a liability.

Embracing this challenge by putting in the right systems, built on a well defined data an AI architecture and following proven methodologies for developing new [Intelligent Applications](intelligent-app.md) will become an essential step for all enterprises.

We propose to detail the characteristics and concerns to address for designing an data intensive and intelligent application in [this note.](intelligent-app.md)