# ml2015-ex1

## Machine Learning 1, Summer Term 2015, Problem Sheet 1

### Problem 2

The source code is either self-documenting or contains comments where necessary.

The following files are relevant for solving problem 2:

- `knn.m` (k-nearest neighbors)
- `cv.m` (leave-one-out cross-validation)
- `loadTrainingData.m` (well, loads the Kaggle training data `train.csv`)
- `label2double.m` (converts the labels to doubles, so they can be used in a matrix with the training data)
- `part1.m` (runs cv with the dimensionality-reduced training data)
- `part2.m` (runs cv with the different sample sizes of the actual training data)

### tl;dr

1. Run `part1.m` for computing cv on dimensionality-redued training data (`train_tsne_1000.csv`).
2. Run `part2.m` for computing cv on differeent sample sizes of the actual Kaggle training data (`train.csv`).
