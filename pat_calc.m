function pat = pat_calc(inc_items,dep,ebit,tao)
% This function calculates pat.
% inc_items = [rev,cogs,exp];
% Inputs
% inc_items; A vector containing line items from income statement in the
% folowing order: revenue, cogs, expenses,int.
% dep: Depreciation
% ebit
% tao

% Code

if ebit == 0
    pat = (inc_items(1) - inc_items(2) - inc_items(3) - inc_items(4) - dep)*(1-tao);
else % ebi =/= 0
    pat = ebit*(1-tao);
end
end