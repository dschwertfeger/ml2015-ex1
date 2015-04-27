
%% Machine Learning 1, Summer Term 2015, Problem Sheet 1, Part 2

%% Initialization
clear ; close all; clc

%% ==================== Part 2: Full Kaggle data set ====================
% Problem 2 
fprintf('Loading traning data \n');

if ~exist('training_data.mat', 'file')
	loadTrainingData()
else
    load training_data.mat
end 
    
fprintf('Program paused. Press enter to continue.\n');
pause;

fprintf('Shuffeling data.\n');
% The data is sorted (by product class). Before Splitting the data into
% smaller subsets, it needs to be shuffeled, so that these subsets do not 
% only contain data points of one product class
training_data = training_data(randperm(size(training_data, 1)), :); 

%
sample_sizes = [1000, 5000, 10000, 20000, 50000, 61870];

for sample_size = sample_sizes
    fprintf(['Running leave-one-out cross-validation on a sample size '...
        'of %d. \n'], sample_size);
    
    sample = training_data(1:sample_size , :);
    
    average_accuracy = cv(sample);
    fprintf('The average accuracy is %.2f %%. \n', average_accuracy);
end

