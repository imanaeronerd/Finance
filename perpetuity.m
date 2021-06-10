function [P] = perpetuity(A,r,g,beg_year)
% Calculate value of perpetual cash flows

% Inputs:
% A: The periodic payment value
% APR: The APR
% g: The growth rate of the payments per payment period
% beg_year: The first year of payments

% Outputs:
% P: The present value of the perpetuity, which is at t = 0.

if r > g
    P = A/(r-g);
elseif r == g
    P = A*n/(1+r);
elseif r < g
    print('The present value of the annuity stream is infinity')
end
    
% Shift value of cash flows to present time
P = P/(1+r)^(beg_year - 1);
end