function [D_cf cf] = D_cf_calc(D0,g,time)
% This function generates two cash flow vectors for dividends.

% Inputs
% D0: The value of the first dividend payment.
% g: The growth rate of the dividend.
% time: A vector [t_i,t_f] outlining the time periods where dividend
% occurs. The units of time must have the same units as the growth rate.

% Outputs
% D_cf: A vector of dividends. First index is a dividend payment.
% cf: A vector of cash flows where the first dividend is the second entry.
% This vector is good for irr or pvvar.

% Code

ti = time(1);
tf = time(2);
D_cf(ti) = D0;
for n = ti+1:tf
    D_cf(n) = D_cf(n-1)*(1+g);
end

cf = [0,D_cf];
end
    