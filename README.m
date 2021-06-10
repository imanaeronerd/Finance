%% Notes

%% Ch 2 Time Value
[A] = annuity_due_A(P,r,time,g,divisions)
[A] = finuit_A(P,r,time,g,divisions)
[P] = annuity_due_P(A,r,time,g,divisions,Ptime)
[P] = finuit_P(A,r,time,g,divisions,Ptime)
[P] = P_F(F,r,time)
[P] = perpetuity(A,r,g,beg_year)
[F] = F_P(P,r,time)
%% Ch 3 Principal Interest Decomposition
EPR = compound(PR,n,direction)
[ret_prc int princ] = breakdown(A,P,EPR,time)
%% Ch 5 NPV and IRR
irr_est = lin_int(cf,g1,g2,freq)
irr = scf_irr(F,P,n)
%% Ch 7 Bonds
ytm = YTM_calc(P,freq)
[holding_yield,P,F] = delta_yield_bond(cf,yield,delta_yield,delta_periods)
P = na_bond_sa(yield,cf,period)
price = tbill_conv(str,fv)
cf = tbond_cf(FV,coupon,maturity,freq)
%% Ch 8 Capital Budgeting/Project Evaluation
% Cash flows
cf_ass = cf_ass_calc(cf_capex,cf_ops,cf_wc,cf_maint)
cf_capex = cf_capex_calc(bv,mv,tao)
cf_ops = cf_ops_calc(inc_items,dep,ebit,tao)
cogs = cogs_calc(fix,var,units)
ebit = ebit_calc(rev,cogs,exp,dep)
nopat = nopat_calc(inc_items,ebit,tao)
pat = pat_calc(inc_items,dep,ebit,tao)
pbt = pbt_calc(rev,cogs,exp,int,dep)
% Depreciation
[dep,t] = sl_dep(time)
[dep v dep_v dep_acc] = depr_hlfyr(v_i,v_f,dep,time)
[dep v dep_v dep_acc] = depr_reg(v_i,v_f,dep,time)
%% Ch 9 Equity Valuation/Stock Pricing
[D_cf cf] = D_cf_calc(D0,g,time)
P = gmodel(D,r,g,Ptime)
g = plowback(ROE,pbr)
%% Ch 10 Risk and Expected Return
vcov = vcovov_func(vol,R)
beta = beta_calc(R,vol_i,vol_mkt)
Er = CAPM_func(beta,r_f,r_mkt)
Er_bond = cost_bond(P,FV,coupon,maturity,freq)
Er_eq = cost_peq(P,D0,g)
%% Ch 11 WACC
