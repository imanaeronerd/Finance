function [dep v dep_v dep_acc] = depr_hlfyr(v_i,v_f,dep,time)
% This function calculates depreciation over time for half-year convention.

% Inputs
% v_i: The initial value of the asset.
% v_f: The final value of the asset.
% time: The duration the asset is held for.

% Outputs
% dep: The depreciation rate of the asset per unit time.
% v: The book value of the asset at each time step.
% dep_v: The depreciated value at each time step.
% dep_acc: The accumulated depreciation.
% Code

t = linspace(1,time+1,time+1);

% Calculate value over time
tot_dep = v_i - v_f;
dep_v(1) = dep(1)*tot_dep;
v(1) = v_i - dep_v(1);
dep_acc(1) = dep_v(1);
for n = 2:time + 1
    dep_v(n) = dep(n)*tot_dep;
    v(n) = v(n-1) - dep_v(n);
    dep_acc(n) = dep_acc(n-1) + dep_v(n);
end


% Display on table
var_names = {'Time','Depreciation Rate','Book Value Year End', ...
    'Depreciated Value Per Time','Accumulated Depreciation'};
T = table(t',dep',v',dep_v',dep_acc','VariableNames',var_names);
disp(T)

format short
end