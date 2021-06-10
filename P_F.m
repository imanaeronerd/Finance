 function [P] = P_F(F,r,time)
% This function inputs a future value then outputs the present value.

% Inputs
% F: The future value.
% r: The effective discount rate per unit time.
% time: [x,y] where x is the future and y is the present.

% Outputs:
% P: The present value.

% Code
n = time(1) - time(2);
P = F./(1+r).^n;


end

