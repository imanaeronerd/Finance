function irr_est = lin_int(cf,g1,g2,freq)
% This function performs one round of linear interpolation to find the irr
% of an investment. The function is not very useful, but answers a test
% question lol

% Inputs:
% func: The function for NPV = 0
% g1: First guess, decimal form
% g2: Second guess, decimal form

% Outputs
% irr_est: The estimated irr with one round of linear interpolation
EPR1 = compound(g1,freq,'short');
EPR2 = compound(g2,freq,'short');

NPV1 = pvvar(cf,EPR1);
NPV2 = pvvar(cf,EPR2);
slope = (NPV2 - NPV1)/(g2 - g1);
int = NPV1 - slope*g1;

irr_est = -int/slope;

% slope = (P2 - P0)/(.1-.03);
% b = P2 - (slope*.1);
% 
% est = -b/(slope);
end
