
%% Machine Learning 1, Summer Term 2015, Problem Sheet 1

%% Initialization
clear ; close all; clc

%% ==================== Part 1: t-SNE data set ====================
% Problem 2
fprintf('Loading t-SNE traning data set \n');

if ~exist('tsne_data.mat', 'file')
	data = csvread('train_tsne_1000.csv', 1, 0);
    save tsne_data.mat
else
    load tsne_data.mat
end

fprintf('Program paused. Press enter to continue.\n');
pause;

fprintf('Plotting data. \n');

X = data(:, 1:2);
Y = data(:, 3);
f = scatter(X(:, 1), X(:, 2), [], Y);
saveas(f, 'scatterplot.png');
imread('scatterplot.png');

fprintf('Program paused. Press enter to continue.\n');
pause;

fprintf('Running leave-one-out cross-validation. \n');
average_accuracy = cv(data);

fprintf('The average accuracy is %.2f %%. \n', average_accuracy);

