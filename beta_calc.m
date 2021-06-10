function beta = beta_calc(R,vol_i,vol_mkt)
% This function calculates beta using R, vol_i, and vol_mkt

beta = R*vol_i/vol_mkt;

end
