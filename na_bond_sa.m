function P = na_bond_sa(yield,cf,period)
% This function inputs the yield curve and cash flows of a bond then
% calculates the no arbitrage price.

% Inputs
% yield: A vector of yields beginning from shortest maturity to longest
% maturity. Yield should be effective yearly rate.
% cf: A vector of cash flows. First en
% period: The period in which cash flow occurs per year(semi-annual = .5)
% Outputs
% price: The no arbitrage price of a bond.
P = 0;
for n = 1:length(cf) - 1
    P = P + cf(n+1)/(1+yield(n))^(period*n);
end

end