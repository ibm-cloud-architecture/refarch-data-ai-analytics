# Methodology

## Data Sciences Introduction

The goals for data science is to infer from data, actionable insights for the business execution improvement. The main stakeholders are business users, upper managers, who want to get improvement to some important metrics and indicators to control their business goals and objectives. Data scientists have to work closely with business users and be able to explain and represent findings clearly and with good visualization, pertinent for the business users.

Data science falls into these three categories:

### Descriptive analytics

This is likely the most common type of analytics leveraged to create dashboards and reports. They describe and summarize events that have already occurred. For example, think of a grocery store owner who wants to know how items of each product were sold in all store within a region in the last five years.

### Predictive analytics

This is all about using mathematical and statistical methods to forecast future outcomes. The grocery store owner wants to understand how many products could potentially be sold in the next couple of months so that he can make a decision on inventory levels.

### Prescriptive analytics

Prescriptive analytics is used to optimize business decisions by simulating scenarios based on a set of constraints. The grocery store owner  wants to creating a staffing schedule for his employees, but to do so he will have to account for factors like availability, vacation time, number of hours of work, potential emergencies and so on (constraints) and create a schedule that works for everyone while ensuring that his business is able to function on a day to day basis.

### Concepts

* **Supervised learning**: learn a model from labeled training data that allows us to make predictions about unseen or future data. We give to the algorithm a dataset with a right answers (y), during the training, and we validate the model accuracy with a test data set with right answers. So a data set needs to be split in training and test sets.
* **Unsupervised learning**: giving a dataset, try to find tendency in the data, by using techniques like clustering.
* **Classification** problem is when we are trying to predict one of a small number of discrete-valued outputs
* **Regression** classification problem when the goal is to predict continuous value output
* **A feature** is an attribute to use for classifying

### Algorithm selection

The application from [https://samrose3.github.io/algorithm-explorer](https://samrose3.github.io/algorithm-explorer/) will guide you on how to select what algorithm may help to address a specific problem.

## Challenges

There are a set of standard challenges while developing an IT solution which integrates results from analytics model. We are listing some that we want to address, document and support as requirements.
* Are we considering a scoring service or a classification one?
* Is it a batch processing to update static records or real time processing on data stream or transactional data
* How to control resource allocation for Machine Learning job.
* How to manage consistency between model and data and code: version management
* How to assess the features needed for the training and test sets.
* How to leverage real time cognitive / deep learning classification inside scoring service

# The Garage Method for Cloud with DataFirst

Every department within your organization has different needs for data and analytics. How can you start your data-driven journey? The [Garage Method for Cloud with DataFirst](https://www.ibm.com/analytics/datafirst)provides strategy and expertise to help you gain the most value from your data. This method starts with your business outcomes that leverage data and analytics, not technology. Defining focus in a collaborative manner is key to deriving early results. Your roadmap and action plan are continuously updated based on lessons learned. This is an iterative and agile approach to help you define, design, and prove a solution for your specific business problem.

## Personas

Our architecture and mothodology discussions need to clearly address the major personas touching any elements of the architecture:

* Developer
* Architect
* Business analysts
* Data scientist

### Differences between analysts and data scientists

The MITSloan did a review of the major differences between data scientists and business analysts by considering a set of common dimensions. The table below presents the results.

|     | Analysts | Data Scientists |
| --- | --- | --- |
| Types of adta | Structured mostly numeric data | All types, including unstructured data | 
| Preferred tools| Statistical and modeling tools using data repository | Programming language with strong statistical library, machine learning, deep learning. Use ML cluster servers| 
| Nature of work | | | 
| Typical educationl background | | | 
| Mindset | | | 
| --- | --- | --- |
