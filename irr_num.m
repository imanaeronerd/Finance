function irr_f = irr_num(eqn_i, eqn_o)
% Note: Function not finished, doesnt work.
% This function is a numerical solver for r.

% Inputs: 
% eqn_i: A vector containing symbolic equations representing all of the 
% inwards cash flows. All must have the same period units.
% eqn_o: A vector containing symbolic equations representing all of the 
% outwards cash flows. All must have the same period units.

% Outputs
% irr: The internal rate of return as a decimal.
% https://www.mathworks.com/matlabcentral/answers/364747-summation-of-functions-in-a-loop
% Code
% eqn_i = sum(eqn_i);
% eqn_o = sum(eqn_o);
NPV_eqn = @(r) 0;
NPV_eqnp = @(r) 0;
% NPV_eqn = eqn_i - eqn_o;
% NPV_eqnp = diff(NPV_eqn);

% Run numerical methods
f = @(r) (sum(eqn_i) - sum(eqn_o));
fp = @(r) diff(f);
N = 15;
tol = 1E-10;
nfinal = N+1;


error = 1;
irr = .1;
n = 1;
while n <= nfinal
    old_irr = irr;
    irr = irr - f(irr)/fp(irr);
    error = abs(old_irr - irr);
    if error <= tol
        irr_f = irr;
        break
    end
    n = n+ 1;
end

end