# Deployment

Model deployment comes in many shapes. The key to everything is that the business insights that result from the model are made available to stakeholders. This can happen in various ways. At the simplest level a PDF report is generated (e.g. using a jupyter notebook in Watson Studio) and handed over to business stakeholders. Alternatively, the model is encapsulated behind a REST API and made either available to be consumed by a microservice or a data integration component. Model are exposed via API (e.g. by using IBM Watson Machine Learning or Fabric for DeepLearning) or can be embbeded in agent consuming real time event as demonstrated in [this project](https://ibm-cloud-architecture.github.io/refarch-reefer-ml/build-run/#the-predictive-scoring-agent). 

Depending on your use case, please choose and implement an appropriate model deployment option and justify your decisions in the architecture decision document.
