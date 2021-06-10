function [holding_yield,P,F] = delta_yield_bond(cf,yield,delta_yield,delta_periods)
% This code calculates the holding yield from holding a bond through
% changes in interest rates. Only works for zeros.

% Inputs
% cf: A vector of cash flows beginning from initial buy of bond.
% yield: The initial YTM.
% delta_yield: The change in YTM.
% delta_periods: The amount of periods passed.
% 
% Code

% Present value of bond with current interest rate
P = pvvar(cf,yield);

% Future of bond after delta yield and periods have passed
cf = cf(1+delta_periods:end);
F = pvvar(cf,yield);

% Calculate holding yield

holding_yield = F - P;

