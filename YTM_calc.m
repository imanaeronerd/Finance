function ytm = YTM_calc(P,freq)
% This function calculates the yield to maturity of zeros.

% Inputs
% price: A vector containing prices of zeros. First entry is the shortest
% time to maturity. Last entry is the longest time to maturity.
% freq: number of cash flows for 1 year.

% Outputs
% ytm: A vector containing the yield to maturity in EAR. First entry is 
% shortest time to maturity. Last entry is the longest time to maturity.

% Code
tf = length(P);

for n = 1:length(P)
    cf(n,1) = -P(n);
    cf(n,2:n+1) = 0;
    cf(n,n+1) = 1000;
end
for n = 1:length(P)
    ytm(n) = irr(cf(n,:));
    ytm(n) = compound(ytm(n),freq,'long');
end
end
    