function [ prediction ] = knn( x, train )
%KNN k-nearest neighbor
%   This function classifies x by finding its k nearest neighbors in the
%   training set (train).
  
    % Initialize variables
    K = 5;
    columns = size(train, 2);
    DISTANCE = 'euclidean';

    X = train(:, 1:columns - 1);
    Y = train(:, columns);

    % Find the K nearest neighbors and store the distances (D) and index of
    % the nearest neighbors in the training set (I)
    [D, I] = pdist2(X, x, DISTANCE, 'Smallest', K);

    % Predict the label of input x by accessing Y at indices I and finding
    % the most frequent value using `mode`
    prediction = mode(Y(I));

end

