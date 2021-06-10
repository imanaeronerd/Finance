function [F] = F_P(P,r,time)
% This function inputs a present value then calculates the future value.

% Inputs
% P: The present value.
% r: The effective discount rate per unit time.
% time: [x,y] where x is the present and y is the future.

% Outputs:
% F: The future value

% Code
n = time(2) - time(1);
F = P*(1+r)^n;
    
end
