function [dep,t] = sl_dep(time)
% This function generates a depreciation vector for a straight-line
% depreciation schedule with a half-year convention.
% Inputs
% time: The time of depreciation

% Outputs
% dep: A vector containing the depreciation rate for each time period.

% Code
% Generate time vector
t = linspace(1,time+1,time+1);

% Generate depreciation vector
for n = 1:time + 1
    dep_mid = (100/time)/100;
    dep_ends = dep_mid/2;
end

dep = zeros(1,time+1);
dep(1) = dep_ends;
dep(end) = dep_ends;
dep(2:end-1) = dep_mid;