# Data integration

There is no universal database solution to address the variety of data requirements business applications need. And it is not wishable to have such monster product. So the need for data integration should come by considering the dataflows across a business process at stake or across an entire business organization and even sometime in a network of business partners (a blockchain network as an example). 

## Dataflows

When we need to separate the write and read model, like by adapting CQRS, we need to pay attention on where the data are create first, where they should be persisted, and which representations are derived from which sources. For each target reads, what are the expected formats, and data locations?

The classical approach to keep different systems data consistent, is to use two phase commit transaction, and the orchestrator to keep the write operation in expected sequence. Alternate model is to use event sourcing to keep write order in a log.
