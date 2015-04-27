T = readtable('train.csv');
X = table2array(T(:, 2:94));
Y = table2array(T(:, 95) );

% Convert the labels (like 'class_1') to number values so they are of the
% same data type as the feature values and can be stored in the same matrix 
Y = cellfun(@label2double, Y, 'Uniform', false);
Y = cell2mat(Y);

% Concatenate features and labels into a single data matrix
training_data = [X Y];

% Save training data
save training_data.mat
