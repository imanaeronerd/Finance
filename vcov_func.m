function vcov = vcovov_func(vol,R)

% This function generates the VCOV matrix of a portfolio.

% Inputs
% vol: A vector of volatilites of stocks. [vol_X, vol_Y, vol_Z...]
% R: A vector of correlations. [R_XY, R_XZ, R_Yz...]

R_matrix = zeros(length(R),length(R));
c = 1;

for row = 1:length(R)
    for column = c:length(R)
        R_matrix(row, column) = R(column);
    end
    c = c + 1;
end
        

for n = 1:length(vol)
    for nn = 1:length(vol)
        if n ~= nn
            vcov(n,nn) = vol(n)*vol(nn)*R;
        else
            vcov(n,nn) = vol(n)*vol(nn);
        end
    end
end

end