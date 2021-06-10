function [A] = annuity_due_A(P,r,time,g,divisions)
% This function calculates the cost of an annuity due
% Inputs
% P: The present value of the borrowings
% r: The APR
% g: The growth rate of the payments per payment period
% time: span of time where payment occurs
% divisions: 'monthly' if equal monthly payments 
%            'yearly' if equal yearly payments

% Outputs
% A: The periodic payment value at first payment. Can be output at first
% payment or shifted to present.

% Code

% Calculate number of periods

% For monthly cash flows
if strcmp(divisions,'monthly') == 1
    periods = time(2) - time(1) + 1;
    r = r/12;
    if r == g 
        A0 = P/periods;
    else
        syms A
        eqn1 = P == ( A/(r-g) )*( 1 - ( (1+g)/(1+r) )^(periods) )*(1+r);
        A = solve(eqn1,A);
        A0 = double(A);  
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
        A = P/periods;
    else
        syms A
        eqn1 = P == ( A/(r-g) )*( 1 - ( (1+g)/(1+r) )^(periods) )*(1+r);
        A = solve(eqn1,A);
        A0 = double(A);
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