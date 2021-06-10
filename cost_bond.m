function Er_bond = cost_bond(P,FV,coupon,maturity,freq)
% This function calculates the cost of debt from a bond.

% Inputs
% P: The present value of the bond.
% FV: The face value of the bond.
% coupon: The coupon of the bond.
% maturity: The maturity of the bond.
% freq: The frequency of coupon payments relative to units of maturity.

% Outputs
% Er_bond: The cost of debt from the bond as an EAR.

% Code
cf = tbond_cf(FV,coupon,maturity,freq);
cf(1) = -P;
Er_bond = double(irr(cf));

if freq ~= 1
    Er_bond = compound(Er_bond,freq,'long');
end

end