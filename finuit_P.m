function [P] = finuit_P(A,r,time,g,divisions,Ptime)
% THE BIG UGLY & little ugly
% Calculates P for a finite regular payment. 
% Inputs
% A: Value of first payment
% r: For monthly- APR
%    For yearly- Effective Annual Rate
% time: span of time where payment occurs
% g: growth rate of A
% divisions: 'monthly' if equal monthly payments 
%            'yearly' if equal yearly payments
% Ptime: The value of P at the time desired.

% Outputs
% P: The value of the finite annuity at the desired time.

% Code
% For monthly cash flows
if strcmp(divisions,'monthly') == 1
    periods = time(2) - time(1) + 1;
    if r/12 == g
        r = r/12;
        P = A*periods/(1+r);
    else % r /= g
        r = r/12;
        x = 1 - ( (1+g)/(1+r) )^(periods);
        P = ( A/(r-g) )*x;
    end
% Shift value to desired time [27,35], 40
    shift = time(1) - 1 - Ptime;
    P = P/( (1+r)^shift );
    
% For yearly cash flows
elseif strcmp(divisions,'yearly') == 1
    periods = time(2) - time(1) + 1;
    if r == g
        P = A*periods/(1+r);
    else % r /= g
        x = 1 - ( (1+g)/(1+r) )^(periods);
        P = ( A/(r-g) )*x;
    end
% Shift value to present
    shift = time(1) - 1 - Ptime;
    P = P/( (1+r)^shift );
end

end
