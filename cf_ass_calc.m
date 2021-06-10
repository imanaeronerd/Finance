function cf_ass = cf_ass_calc(cf_capex,cf_ops,cf_wc,cf_maint)

% This function calculates the cf from assets.

% Inputs
% cf_capex: The cash flow from CapEx.
% cf_ops: The cash flow from operations.
% cf_wc: The cash flow from working capital.
% cf_maint: The cash flow from changes in maintenance cash.

% Outputs
% cf_ass: The cash flow from assets.

% Code
cf_ass = cf_capex + cf_ops + cf_wc + cf_maint;
end