function EPR = compound(PR,n,direction)

% This code outputs the effective short period percentage rate.

% Inputs
% PR: The percentage rate. For direction of long, this would be the short
% effective percentage rate. For direction of short, this would be the long
% effective percentage rate.
% f: the frequency of the short periods per long period
% Outputs
% EPR: the effective percentage rate.

% note: long and short should have the same time units.

% Code

% To find the long EPR
if strcmp(direction,'long') == 1
    SPR = PR;
    syms LPR positive
    eqn = (1 + SPR)^n == 1 + LPR;
    LPR = solve(eqn,LPR,'Real',true);
    EPR = vpa(LPR);
    
% To find the short EPR
else
    LPR = PR;
    syms SPR positive
    eqn = (1 + SPR)^n == 1 + LPR;
    SPR = solve(eqn,SPR,'Real',true);
    EPR = vpa(SPR);
end