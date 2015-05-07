# ml2015-ex1

## Machine Learning 1, Summer Term 2015, Problem Sheet 1

### Problem 1

[D]escribe three learning problems that have not been mentioned in the lecture, in particular addressing the following aspects:

- (a) What is the data? (What are the inputs; what are the labels?)
- (b) What is the goal? Are humans good at solving this task? Why, why not?


#### 1. Anomaly Detection in Aircraft Engines

This can possibly be applied to many other domains as well but let's look at aircraft engines for this example.

- (a) What is the data?
    - Inputs:
        - Heat generated
        - Vibration intensity
        - Sound level
        - ...
    - Labels:
        - Normal
        - Flawed
- (b) What is the goal? Are humans good at solving this task? Why, why not?
    - To spot flawed engines and fix them before anything bad happens.
    - Humans could do this task. It would only require a lot of time and effort to check every detail of every engine before take-off.
    - A machine would need way less time and could detect anomalies even during the flight. In this case the ground crew could be informed and the engine could be fixed right after landing. This would minimize downtime for the flight companies and maximize safety for passengers.


#### 2. Predicting Housing Prices

The idea is to predict housing prices based on certain attributes. This is rather a regression than a classification problem. 

- (a) What is the data? 
    - Inputs: size, number of bedrooms, number of floors, age of house, location ...
    - Labels: price
- (b) What is the goal? Are humans good at solving this task? Why, why not?
    - Probably very helpful for the real estate industry to find out how much they should pay for certain assets.
    - Humans could do that. It would just mean a lot of manual work.


#### 3. Recommender System: Predicting Movie Ratings

The idea is to predict movie ratings for a user based on other peoples movie ratings in order to suggest a yet unrated (and possibly unwatched) movie to that particular user. Much like what Amazon and Netfilx do with "People who bought this, also bought that."

- (a) What is the data?
    - Inputs: 1-to-5-star movie ratings of many users for many movies
    - Labels: category of the movie
- (b) What is the goal? Are humans good at solving this task? Why, why not?
    - As a movie rental service I want to (successfully) recommend movies to my users that they actually care about, so they rent them and I can make more profit. 
    - Humans would not be very good at this task. They would have to interview a lot of people to get this knowledge.


### Problem 2

The source code is either self-documenting or contains comments where necessary.

The following files are relevant for solving problem 2:

- `knn.m` (k-nearest neighbors)
- `cv.m` (leave-one-out cross-validation)
- `loadTrainingData.m` (well, loads the Kaggle training data `train.csv`)
- `label2double.m` (converts the labels to doubles, so they can be used in a matrix with the training data)
- `part1.m` (runs cv with the dimensionality-reduced training data)
- `part2.m` (runs cv with the different sample sizes of the actual training data)

Here are a few words for the parts of this problem sheet that asked for comments. 


##### (c) Visualize the t-SNE data set as a two-dimensional point cloud. What conclusions can you draw from this graph and how will these conclusions influence your approach to the problem?

![ scatterplot ](https://raw.githubusercontent.com/dschwertfeger/ml2015-ex1/master/scatterplot.png "scatterplot of t-SNE reduced data set")

The scatterplot shows that the product categories do not cluster very well. It even looks like there are at least two product categories that have very similar features, since these two classes sort of build there own cluster.


##### (f) [...] comment both on the suitability of the t-SNE dimensionality reduction algorithm, as well as the sample size chosen by us.

Comparing the results of the cross-validation error for the t-SNE sample with the cross-validation error for the whole data set shows that the dimensionality-reduced data still works pretty well. The accuracy of the t-SNE sample is about 60 % while the same sample size with all the 93 features only results in about 66 % accuracy.

However, this number increases with increasing sample sizes. When almost the whole training data is used, the accuracy is about 78 %. Better but still not great. 

Here's a sample output of the script `part2.m`:

```
Shuffeling data.
Running leave-one-out cross-validation on a sample size of 1000.
The average accuracy is 65.90 %.
Running leave-one-out cross-validation on a sample size of 5000.
The average accuracy is 71.70 %.
Running leave-one-out cross-validation on a sample size of 10000.
The average accuracy is 74.22 %.
Running leave-one-out cross-validation on a sample size of 20000.
The average accuracy is 75.83 %.
Running leave-one-out cross-validation on a sample size of 50000.
The average accuracy is 77.53 %.
Running leave-one-out cross-validation on a sample size of 61870.
The average accuracy is 77.95 %.
```


### tl;dr

1. The scripts assume that the training data files (`train_tsne_1000.csv` and `train.csv`) are in the same folder as the scripts itself.
2. Run `part1.m` for computing cv on dimensionality-redued training data (`train_tsne_1000.csv`).
3. Run `part2.m` for computing cv on differeent sample sizes of the actual Kaggle training data (`train.csv`).
