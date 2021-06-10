function [A] = finuit_A(P,r,time,g,divisions)
% THE BIG UGLY & little ugly
% Calculates A for a finite annuity borrowing. 
% Inputs
% P: Total borrowings at t = time(1) - 1.
% r: Annual percentage rate
% time: span of time where monthly payment occurs
% g: growth rate of r
% divisions: 'monthly' if equal monthly payments 
%            'yearly' if equal yearly payments

% Outputs
% A: The payments, either monthly or yearly.

% For monthly cash flows
if strcmp(divisions,'monthly') == 1
    periods = time(2) - time(1) + 1;
    if r/12 == g
        r = r/12;
        A0 = P*(1+r)/(periods);
    else % r /= g
        r = r/12;
        x = 1 - ( (1+g)/(1+r) )^(periods);
        A0 = P*(r-g)/x;
    end
    % Calculate adjustment vector for payment growth
    if g > 0 | g < 0
        for n = 1:periods
            delta(n) = (1+g)^(n-1);
            A(n) = A0*delta(n);
        end
    else
        A = A0;
    end
% For yearly cash flows

elseif strcmp(divisions,'yearly') == 1
    periods = time(2) - time(1) + 1;
    if r == g
        A0 = P*(1+r)/periods;
    else % r /= g
        x = 1 - ( (1+g)/(1+r) )^(periods);
        A0 = P*(r-g)/x;
    end
    % Calculate adjustment vector for payment growth
    if g > 0 | g < 0
        for n = 1:periods
            delta = (1+g)^(n-1);
            A(n) = A0*delta;
        end
    else 
        A = A0;
    end
end
A = double(A);
end
