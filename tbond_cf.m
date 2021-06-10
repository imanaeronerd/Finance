function cf = tbond_cf(FV,coupon,maturity,freq)
% This function generates the cash flows of a coupon bond.
% Inputs
% freq: The frequency of coupon payments relative to units of maturity.
% Code

tf = 2*maturity+1;
cf = zeros(1,tf);
cf(2:tf) = FV*coupon/freq;
cf(tf) = cf(tf) + FV;

end