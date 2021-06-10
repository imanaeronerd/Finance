function nopat = nopat_calc(inc_items,ebit,tao)
% This function calculates ebit.

% Code

% inc_items = [rev,cogs,exp,dep];
% Inputs
% inc_items; A vector containing line items from income statement in the
% folowing order: revenue, cogs, expenses, dep.
% dep: Depreciation
% ebit
% tao

% Code

if ebit == 0
    nopat = (inc_items(1) - inc_items(2) - inc_items(3) - inc_items(4))*(1-tao);
else % ebi =/= 0
    nopat = ebit*(1-tao);
end

end