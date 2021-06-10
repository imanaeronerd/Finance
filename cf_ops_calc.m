function cf_ops = cf_ops_calc(inc_items,dep,ebit,tao)
% This code calculates the cf from operations.
% inc_items = [rev,cogs,exp];
% If passing in ebit, have other inputs = 0.
% Code

% Inputs
% inc_items; A vector containing line items from income statement in the
% folowing order: revenue, cogs, expenses.
% dep: Depreciation
% ebit
% tao
if ebit == 0
    cf_ops = (inc_items(1) - inc_items(2) - inc_items(3) - dep)*(1-tao) + dep;
else % ebi =/= 0
    cf_ops = ebit*(1-tao) + dep;
end

end