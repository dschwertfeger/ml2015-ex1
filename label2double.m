function y = label2double(str)
%LABEL2DOUBLE Summary of this function goes here
%   Detailed explanation goes here
    y = str2double(strrep(str, 'Class_', ''));
end
