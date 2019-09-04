# Data Preparation
 
The purpose of the Data Preparation stage is to get the data into the best format for machine learning, this includes three stages: Data Cleansing, Data Transformation, and Feature Engineering. Quality data is more important than using complicated algorithms so this is an incredibly important stage and should not be skipped.
 
## Data Cleansing

During the Data Understanding activities, you explored your data and detected uncomplete or incorrect values. This stage is where you address those issues, activities include:

* Dealing with missing values
* Dealing with outliers
* Correcting typos
* Grouping sparse classes
* Dropping duplicates
 
### Key considerations
 
#### Missing Values

Most machine learning models require all features to be complete, therefore, missing values must be dealt with. The simplest solution is to remove all rows that have a missing value but important information could be lost or bias introduced. During the data exploration phase, you should have explored possible reasons for this missing data to help guide whether or not it is acceptable to drop these data points. Alternatively, you can impute the value; provide an appropriate substitute for the missing data. Common imputations are using the mean, median, or mode. For categorical data, a new category (e.g. “Unknown”) could be created. More complicated solutions include using K-Nearest Neighbors (KNN) or Multivariate Imputation by Chained Equation (MICE). 
 
#### Outliers
If your outlier investigation during Data Exploration only finds low-frequency outliers that are likely to be erroneous, these can be treated like missing data be either removed or replaced. However, if you believe important information will be lost by removing or changing them, you may wish to keep them and use a machine learning algorithm and optimization metric robust to outliers. The process of removing outliers from your data set is referred to as trimming or truncation. Outliers can be replaced by techniques similar to missing data, e.g. with mean, mode or median. More complicated techniques include Winsorizing – replacing extreme values with minimum and maximum percentiles – and discretization (binning) – dividing the continuous variable into discrete groups.
 
#### Grouping Sparse Classes
Categorical features can often have a large number of distinct values, some of which have a low frequency. This can be particularly common when the data has been input as free text and prone to typos. In the Data Transformation stage, we will discuss how categorical data is converted to a format a machine learning model can read. However, this often involves creating a new feature for each distinct value in that category; if each categorical feature has a lot of distinct values, this transformation results in a lot of additional features. Many machine learning algorithms can struggle with too many features, this is referred to as the curse of dimensionality. Consequently, you may wish to group qualitatively similar values. This is likely to be a manual effort working with a subject matter expert. Though for typos, or inconsistencies in capitalizations, pattern or fuzzy matching tools can be used.

## Data Transformations
It is rare to have collected data solely to make predictions. Consequently, the data you have available may not be in the right format or may require transformations to make it more useful. Data Transformation activities and techniques include:

* Categorical encoding
*      Dealing with skewed data
*     Bias mitigation
*      Scaling
*      Rank transformation
*      Power functions


### Key Considerations:
 
#### Categorical Encoding

Label encoding converts categorical variables to numerical representation, something that is machine-readable. The first thing to understand is whether or not your categories are ordinal, e.g. level of education has an order with master’s degree being higher ranked than bachelor’s degree. To keep this relationship, you will want to rank them based on their associated magnitude and use their ranking as an input to your model. If the categories are not ordinal, you can one-hot-encode your categories; this will create a new column for each unique value in the column. For neural networks, or working with text data, you may wish to use embeddings.
 
#### Dealing with Skewed Data

Normality is often assumed with statistical techniques. If you’re using regression algorithms such as linear regression or neural networks, you are likely to see large improvements if you transform variables with skewed distributions. To approximate a more symmetric distribution, you can use roots (i.e. square-root, cube root), logarithms (i.e. base e, or base 10), reciprocals (i.e. positive or negative), or Box-Cox transformation.
 
#### Scaling

Scaling is a method of transforming data into a particular range. Regression algorithms and algorithms using Euclidean distances (e.g. KNN, or K-Means) are sensitive to the variation in magnitude and range across features. The goal of scaling is to change the values of each numerical feature in the data set to a common scale. By doing so, changes in different features become more comparable. Scaling can be done with normalization (or min-max scaling) or z-score standardization.
 
#### Bias Mitigation

If you’ve discovered that there is bias in your data, you can mitigate this with various preprocessing techniques. These often replace the current values, or labels, with those that will result in a fairer model. Examples of pre-processing bias mitigation algorithms are Reweighing, Optimized preprocessing, Learning fair representations and Disparate impact remover.

## Feature Engineering

Feature engineering is the process of creating new features based upon knowledge about current features and the required task. It is important to have a clear understanding of the data to do this step, this may require you working with a subject matter expert. This activity may also require you to find new data sources. Two key activities are:

* Feature extraction, and
* Capturing Feature Relationships
 
### Feature Extraction

You may find that columns in your data are not useful as they are, possibly because they are too granular. For example, a timestamp is unlikely to be useful whilst the time of day, or day of the week might be. In text analytics, feature extraction is creating vectors from the raw text strings. This could simply be creating a new column that indicates if particular phrases are mentioned, or columns could be created for each word (Bag-of-Words) and their value is a representation of their frequency (TF, or TF-IDF).
 
### Capturing Feature Relationships

Rather than expect the model to find relationships between two features, they can be explicitly called out. You are then helping your algorithm focus on what you, or the subject matter expert you’re working with, know is important. This could be the sum, the difference, the product or the quotient. For example, a machine learning model may not easily find the connection between the longitude and latitude values of two address but by providing the distance between the two, you better enable it to derive patterns.
