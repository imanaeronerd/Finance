function [P] = annuity_due_P(A,r,time,g,divisions,Ptime)

% This function calculates the present value of an annuity due
% Inputs
% A: The periodic payment value
% APR: The APR
% g: The growth rate of the payments per payment period
% time: span of time where monthly payment occurs
% divisions: 'monthly' if equal monthly payments 
%            'yearly' if equal yearly payments
% Ptime: The value of P at the time desired.

% Outputs
% P: The value of the cash flows. Can be output at first
% payment or shifted to present.

% Code

% For monthly cash flows
if strcmp(divisions,'monthly') == 1
    r = r/12;
    periods = time(2) - time(1) + 1;
    shift = time(1) - Ptime;
    if r == g 
        P = A*periods;
    else
        syms P
        eqn1 = P == ( A/(r-g) )*( 1 - ( (1+g)/(1+r) )^(periods) )*(1+r);
        P = solve(eqn1,P);
        P = double(P);
    end
    % Shift value to present
        P = P/( (1+r)^shift );

% For yearly cash flows
elseif strcmp(divisions,'yearly') == 1
    periods = time(2) - time(1) + 1;
    shift = time(1) - Ptime;
    if r == g 
        P = A*periods;
    else
    syms P
    eqn1 = P == ( A/(r-g) )*( 1 - ( (1+g)/(1+r) )^(periods) )*(1+r);
    P = solve(eqn1,P);
    P = double(P);
    end
    % Shift value to present
        P = P/( (1+r)^shift ); 
end

end