function P = gmodel(D,r,g,Ptime)
% This function calculates the value of a stock with the Gordon Model.

% Inputs
% D: The value of the first dividend.
% r: The discount rate E[r] that reflects risk.
% g: The growth rate of the dividend.
% Ptime: The desired time offset for the output value. A positive Ptime
% shifts the value left.

% Outputs
% P: The present value of the stock.

P = ( D/(r-g) )/(1+r)^Ptime;
end


