function [ret_prc int princ] = breakdown(A,P,EPR,time)
% This function calculates the principle and interest component of each
% debt payment.

% Inputs
% A: The magnitude of the first payment.
% P: The magnitude of the borrowings.
% EPR: The effective percentage rate for each period.
% time: The timespan of the payments.

% Outputs
% ret_prc: The returned principal for each payment.
% int: The interest potion of each payment.
% princ: The remaining principal. This vector is one longer than the
% others, since
% Code
if length(A) == 1
    periods = time(2) - time(1) + 1;
    for n = 1:periods
        A(n) = A(1);
    end
end
% Payment at first time
A0 = 0;
% Principle left after each payment
princ(1) = P - A0;
% Calculate the magnitude of returned principle and interest
int(1) = princ(1)*EPR;
ret_prc(1) = A(1) - int(1);
for n = 1:length(A)
    int(n) = princ(n)*EPR;
    ret_prc(n) = A(n) - int(n);
    princ(n+1) = princ(n) - ret_prc(n);
end


%%
end