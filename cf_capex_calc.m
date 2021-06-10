function cf_capex = cf_capex_calc(bv,mv,tao)
% This function calculates the cf from capex.

% Inputs
% bv: Book value of capex
% mv: Market value of capex
% tao: Tax rate

% Outputs
% cf_capex: The cash flow from capex event after tax.

% Code
cf_capex = mv - (mv - bv)*tao;

end