function irr = scf_irr(F,P,n)
% This function calclates the irr of a single pair of in/out cash flows
% with a decimal time period.

irr = (F/P)^(1/n) - 1;