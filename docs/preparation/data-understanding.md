# Data Understanding

Quality data is fundamental to any data science engagement. To gain actionable insights, the appropriate data must be sourced and cleansed. There are two key stages of Data Understanding: a [Data Assessment](#data-assessment) and [Data Exploration](#data-exploration).

## Data Assessment

The first step in data understanding is Data Assessment. This should be undertaken before the kick-off of a project as it is an important step to validate its feasibility. This task evaluates what data is available and how it aligns to the business problem. It should answer the following questions:

* What data is available?
* How much data is available?
* Do you have access to the ground truth, the values you’re trying to predict?
* What format will the data be in?
* Where does it reside?
* How can the data be accessed?
* Which fields are most important?
* How do the multiple data sources get joined?
* What important metrics are reported using this data?
* If applicable, how does the data map to the current method of completing the task today?

### Key Considerations
 
#### Collecting Ground Truth Data

If you wish to make predictions using machine learning, you require a labeled data set. For each of your examples, you need the correct value, or appropriate category, that the machine learning model should predict; this is called the Ground Truth. This may already be available to you as it’s an action or event (e.g. a value indicated whether or not the customer churned) or it might be something you need to collect (e.g. the topic of an email). If this is something that needs to be collected or manually labeled, a plan should be made to understand how this would be achieved and the time it will take to complete. This task could be time-consuming and costly, making the project unfeasible.
 
#### Data Relevance 

Write down all the different data points that will be made available and evaluate if it intuitively makes sense that a machine learning model could predict with this data. Is there proven evidence that there is a connection between these data points and what you wish to achieve? If you add unrelated features to a machine learning model, you’re adding noise, making the algorithm look for connections that aren’t there. This can result in decreased performance. Conversely, if a human is undertaking this task today, explore what they use to make the decision. Is that data available to be used in the model? When building a model, it is good to start simple – use only the obvious features first and see how this performs before adding those you’re less sure about. This allows you to evaluate if the additional features add value.
 
#### Quantity of Data

If you’re trying to build a machine learning model, there must be sufficient data. There is no formula to calculate how much should be collected but as an example, if you’re using traditional machine learning approaches (random forests, logistic regression) to classify your data you want hundreds of examples (ideally more) of each classification. When using deep learning techniques, the number of examples needed significantly increases. Also, you want lots of variation in the features; for example, if you are predicting house prices and one of your inputs is neighborhood, you want to make sure you have good coverage of all neighborhoods so the model can learn how this impacts the price. Another rule of thumb is that you need ten times as degrees of freedom (or parameters/weights) your model has. In the case of linear regression for example, the number of degrees of freedom equals the number of features. In deep learning, every neuron adds and exponential growth to the degrees of freedom.
 
#### Ethics

It is important at the beginning of a project to consider potential harms from your tool. These harms can be caused by designing for too narrow user groups, having an insufficient representation of a sub-population, or human labelers favoring a privileged group. Machine learning discovers and generalizes patterns in the data and could, therefore, replicate bias. Similarly, if a group is under-represented, the machine learning model has fewer examples to learn from, resulting in reduced accuracy for those individuals in this group. When implementing these models at scale, it can result in a large number of biased decisions, harming a large number of people. Ensure you have evaluated risks and have techniques in place to mitigate them.
 
## Data Exploration

Once you have access to data, you can start Data Exploration. This is a phase for creating meaningful summaries of your data, this is particularly important if you are unfamiliar with the data. This is also the time you should test your assumptions. The types of activities and possible questions to ask are:

* Count the number of records – is this what you expected?
* What are the datatypes – will you need to change these for a machine learning model?
* Look for missing values – how should you deal with these?
* Verify the distribution of each column – are they matching the distribution you expect (e.g. normally distributed)?
* Search for outliers – are there anomalies in your data? Are all values valid (e.g. no ages less than 0)?
* Validated if your data is balanced – are different groups represented in your data? Are there enough examples of each class you wish to predict?
* Is there bias in your data – are subgroups in your data treated more favorable than others?
 
### Key Considerations
 
#### Missing Values

An ideal dataset would be complete, with valid values for every observation. However, in reality, you will come across many “NULL” or “NaN” values. The simplest way to deal with missing data is to remove all rows that have a missing value but valuable information can be lost or you could introduce bias. Consequently, it is important to try to understand if there is a reason or pattern for the missing values. For example, particular groups of people may not respond to certain questions in a survey; removing them will prevent learning trends within these groups.  An alternative to removing data is imputing values; replacing missing values with an appropriate substitute. For continuous variables, the mean, median, mode or an interpolation are often used. Whilst, for categorical data it is frequently the mode or a new category (e.g. "NA"). If columns have a high proportion of values missing, you may wish to remove them entirely. 

#### Outliers

An outlier is a data point that is significantly different from other observations. Once you identify outliers, you should also investigate what may have caused them. They could indicate bad data: data that was incorrectly collected. If this is the case, you may wish to remove these data points or replace them (similar to how you impute values for missing data). Alternatively, these values could be interesting and useful for your machine learning model. Some machine learning algorithms, such as linear regression, can be sensitive to outliers. Consequently, you may wish to use only algorithms more robust to outliers, such as random forest or gradient boosted trees.

#### Un-balanced Data

A dataset is unbalanced if the number of data points available for each class is not similar. This is common with classification problems such as fraud detection; the majority of transactions are normal, whilst a small proportion is fraudulent. Machine learning algorithms learn from examples; the more examples it has, the more confident it can be in the patterns it has discovered. Conversely, if you only provide the machine learning algorithm a few examples, it will, at best, learn only weak trends. If your data is unbalanced, as in the fraud detection model, it may not be able to identify what patterns indicate fraud. In addition, algorithms are incentivized by performance metrics such as accuracy: if 99.9% of transactions are not-fraud, a model can be 99.9% accurate by simply labeling all transactions as “non-fraud” with no need to search for further patterns. Features may also be unbalanced, preventing the algorithm from learning how these categories impact the output. 


[Stacey Ronaghan](https://www.linkedin.com/in/staceyronaghan/)