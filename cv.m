function [ avg_accuracy ] = cv( data )
%CV This function computes the leave-one-out cross-validation
%   Detailed explanation goes here

    % Initialize some variables
    num_sets = 10;
    num_data_points = size(data, 1);
    columns = size(data, 2);
    fold_size = num_data_points / num_sets;
    accuracy = zeros(num_sets, 1);

    % shuffle data
    data = data(randperm(num_data_points), :);

    % leave-one-out cross-validation
    for i = 1:num_sets
        % Split data matrix into equally sized cells
        M = mat2cell(data, repmat(fold_size, num_sets, 1), columns);

        % Assign test data set 
        test_data = M{i};
        X_test = test_data(:, 1:columns - 1);
        Y_test = test_data(:, columns);

        % Concatenate all other cell arrays except the one used for the 
        % test set (i) to the training data set.
        train_data = vertcat(M{1:i-1}, M{i+1:num_sets});

        % Predicion step
        predictions = knn(X_test, train_data);

        % Validation step
        validations = Y_test == predictions';
        
        % Save the accuracy for each test set (i) on the training set
        accuracy(i) = sum(validations == 1) / size(validations, 1) * 100;
    end

    % Compute average accuracy
    avg_accuracy = mean(accuracy);

end