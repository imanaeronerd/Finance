%% Final Exam
clc,clear all, close all
format short
%% 1.
disp('--- 1. ---')
clear all
A(1) = 32;
g = -.048;
for n = 2:1000
    A(n) = A(n-1)*(1+g);
end

summation = sum(A);
disp(summation)
%% 2. 
disp('--- 2. ---')
clear all
P = 19924 - 3044;
r = .06;
time = [6,51];
g = .02;
divisions = 'monthly';
P5 = F_P(P,r/12,[0,5]);
[A] = finuit_A(P5,r,time,g,divisions);
disp(A(15))
%% 3. wth is it asking for? future value that coincides...
disp('--- 3. ---')
clear all
A(1) = 38;
g = .034;
r = .098;

for n = 2:17
    A(n) = A(n-1)*(1+g);
end

disp(A(end))
%% 4.
disp('--- 4. ---')
clear all
P = 19782;
r = .08;
time = [0,60];
g = -.03;
divisions = 'monthly';
[A] = annuity_due_A(P,r,time,g,divisions);
disp(A(13))
%% 5. 
disp('--- 5. ---')
clear all
P = 165256;
r = .09;
time = [1,29*12];
g = 0;
divisions = 'monthly';
[A] = finuit_A(P,r,time,g,divisions);
EPR = r/12;
[ret_prc int princ] = breakdown(A(1),P,EPR,time);
disp(ret_prc(2))
%% 6.
disp('--- 6. ---')
clear all
format bank
F = 26481;
r = compound(.0873/12,12,'long');
P = P_F(F,r,[2,0]);
r = .0873;
time = [0,23];
g = 0;
A = annuity_due_A(P,r,time,g,'monthly');
disp(A)
format short
%% 7.
disp('--- 7. ---')
clear all
format bank
P = 373990;
r = .049;
time = [1,17*12];
g = 0;
divisions = 'monthly';
[A] = finuit_A(P,r,time,g,divisions);
EPR = r/12;
[ret_prc int princ] = breakdown(A(1),P,EPR,time);
disp(int(65))
format short
%% 8.
disp('--- 8. ---')
clear all
format bank
P = 295137;
r = .077;
time = [1,19*12];
g = 0;
divisions = 'monthly';
[A] = finuit_A(P,r,time,g,divisions);
EPR = r/12;
[ret_prc int princ] = breakdown(A(1),P,EPR,time);
disp(sum(int))
format short
%% 9.
disp('--- 9. ---')
clear all
F = 10611;
r = .0867;
P = P_F(F,r,[3,0]);
r = 12*compound(r,12,'short');
time = [1,36];
g = 0;
A = annuity_due_A(P,r,time,g,'monthly');
disp(A)
%% 10.
disp('--- 10. ---')
clear all
format bank
cf = zeros(1,29);
cf(1) = -2077;
cf(8:19) = 161;
cf(29) = 4492;
r = .103;
NPV = pvvar(cf,r);
disp(NPV)
%% 11.
disp('--- 11. ---')
clear all
cf = zeros(1,26);
cf(1) = -5328;
cf(26) = 7896;
irrval = irr(cf);
EAR = compound(irrval,12,'long');
disp(EAR*100)
%% 12.
disp('--- 12. ---')
clear all
F = 32169;
P = 3564;
n = 19.76;
irrval = scf_irr(F,P,n);
Er_month = compound(irrval,12,'short');
disp(Er_month*100)
%% 13.
disp('--- 13. ---')
clear all
F = 6270;
P = 2012;
n = 119;
irrval = scf_irr(F,P,n);
Er_dec = compound(irrval,120,'long');
disp(Er_dec*100)
%% 14.
disp('--- 14. ---')
clear all
irr = 33/10092 + .01;
APR = irr*12*100;
disp(APR)
%% 15. 
disp('--- 15. ---')
clear all
rev = 1444;
cogs = 164;
exp = 192;
dep = 345;
ebit = 0;
tao = .34;
inc_items = [rev,cogs,exp,dep];
nopat = nopat_calc(inc_items,ebit,tao);
disp(nopat)
%% 16.
disp('--- 16. ---')
clear all
EAR = .064;
FV = 1000;
coupon = .08;
maturity = 9;
freq = 2;
cf = tbond_cf(FV,coupon,maturity,freq);
EPR = compound(EAR,2,'short');
P = pvvar(cf,EPR);
disp(P)
%% 17.
disp('--- 17. ---')
clear all
format short
P_0 = P_F(1000,.043,[4,1]);
P_3 = P_F(1000,.069,[4,3]);
cf = zeros(1,4);
cf(1) = -P_0;
cf(3) = P_3;
irrval = irr(cf);
disp(irrval*100)
format bank
%% 18.
disp('--- 18. ---')
clear all
price = tbill_conv('111:08',1000);
FV = 1000;
coupon = .082;
maturity = 6;
freq = 2;
cf = tbond_cf(FV,coupon,maturity,freq);
cf(1) = -price;
irrval = irr(cf);
EAR = compound(irrval,2,'long');
disp(EAR*100)
%% 19.
disp('--- 19. ---')
clear all
format bank
v_i = 66286;
v_f = 0;
dep = [.2,.32,.192,.1152,.1152,.0576];
time = 5;
[dep v dep_v dep_acc] = depr_hlfyr(v_i,v_f,dep,time);
format bank
bv = v(4);
mv = 17953;
tao = .24;
cf = cf_capex_calc(bv,mv,tao);
disp(cf)
%% 20.
disp('--- 20. ---')
clear all
P = [987,971,946,905];
ytm = YTM_calc(P,2);
P_i = 1068;
couponv = 1000*.068/2;
Px = P_i - couponv/(1+ytm(1))^.5 - couponv/(1+ytm(2))^1 - couponv/(1+ytm(3))^1.5 ...
    - couponv/(1+ytm(4))^2;
cf = zeros(1,6);
cf(1) = -Px;
cf(6) = 1000+couponv;
irrval = irr(cf);
EAR = compound(irrval,2,'long');
disp(EAR*100)
%% 21.
disp('--- 21. ---')
clear all
price = tbill_conv('95:24',1000);
maturity = 8;
coupon = .042;
FV = 1000;
freq = 2;
cf = tbond_cf(FV,coupon,maturity,freq);
cf(1) = -price;
irrval = irr(cf);
EAR = compound(irrval,2,'long');
EARnew = EAR - .015;
EARnew(1:20) = EARnew;
%
maturity = 6.5;
cfnew = tbond_cf(FV,coupon,maturity,freq);
P = na_bond_sa(EARnew,cfnew,.5);
disp(P);
%% 22.
disp('--- 22. ---')
clear all
format BANK
% Dep
v_i = 560450;
v_f = 0;
dep = zeros(1,6);
dep(2:5) = .2;
dep(1) = .1;
dep(6) = .1;
time = 5;
[dep v dep_v dep_acc] = depr_hlfyr(v_i,v_f,dep,time);

% cf ops
rev = 823874;
dep = dep_v(1);
ebit = 0;
cogs = 339690;
exp = 128733;
tao = .22;
inc_items = [rev,cogs,exp];
format bank
cf_ops = cf_ops_calc(inc_items,dep,ebit,tao)
%% 23.
disp('--- 23. ---')
clear all
D0 = 3.25;
r = .112;
g = .05;
time = [6,13];
[D_cf cf] = D_cf_calc(D0,g,time);
P = gmodel(D_cf(13),r,g,0) + D_cf(12);
disp(P)
%% 24.
disp('--- 24. ---')
clear all
ROE = .11;
P = 64.38;
r = .083;
D = 1.66;
syms g
eqn = P == ( D/(r-g) );
g = double(solve(eqn,g));

PBR = g/ROE;
POR = 1 - PBR;
disp(POR*100)
%% 25.
disp('--- 25. ---')
clear all
vol_dail = .0352;
vol_yr = vol_dail*sqrt(252);
var_yr = vol_yr^2;
disp(var_yr*100);
%% 26.
disp('--- 26. ---')
clear all
disp(6)
%% 27.
disp('--- 27. ---')
clear all
format short
var_x = .052;
vol_x = sqrt(var_x);
vol_y = .50;
vol = [vol_x,vol_y];
R = .31;
W = [21/71, 50/71];
vcov = vcov_func(vol,R);
var_p = W*vcov*W';
vol_p = sqrt(var_p);
disp(vol_p*100)
%% 28.
disp('--- 28. ---')
clear all
disp(4)
%% 29.
disp('--- 29. ---')
clear all
R = .3;
var_i = .04;
vol_i = sqrt(var_i);
vol_mkt = .2;
r_f = double(irr([-969,1000]));
r_mkt = .105;
beta = beta_calc(R,vol_i,vol_mkt);
Er = CAPM_func(beta,r_f,r_mkt);
disp(Er*100)
%% 30.
disp('--- 30. ---')
clear all
beta = 1.31;
vol_mkt = .179;
vol_i = .592;
R = beta*vol_mkt/vol_i;
disp(100*R^2);
%% 31.
disp('--- 31. ---')
clear all
disp(4)
%% 32.
disp('--- 32. ---')
clear all
ROE = .082;
r = .114;
POR = .31;
E = zeros(1,9);
E(1) = 1.04;
for n = 2:9
    E(n) = E(n-1)*(1+.082);
end
E(10) = E(9)*(1+.088);
D1 = E(10)*POR;
g = ROE*(1-POR);
P = gmodel(D1,r,g,0);
PE = P/E(10);
disp(PE)
%% 33.
disp('--- 33. ---')
clear all
D = 1.77;
P = 20.87;
irr_pref = D/P;
disp(irr_pref*100)
%% 34.
disp('--- 34. ---')
clear all
irr_bond = .0663;
tao = .31;
Er_bond = irr_bond*(1-tao);
disp(Er_bond*100)
%% 35.
disp('--- 35. ---')
clear all
beta = 1.2;
r_f = .025;
r_mkt = .106;
Er = CAPM_func(beta,r_f,r_mkt);
disp(Er*100)
%% 36.
disp('--- 36. ---')
clear all
W = [.192,.071, 1-.192-.071]; % bond, pref stock, common stock
tao = .31;
ytm_bond = .052;
irr_pref = 1.49/28.87;
beta_comm = 1.12;
r_f = .021;
r_mkt = .112;
Er_comm = CAPM_func(beta_comm,r_f,r_mkt);
Er = sum(W.*[ytm_bond*(1 - tao),irr_pref,Er_comm]);
disp(Er*100);
%% 37.
disp('--- 37. ---')
clear all
r = .1166;
F = 701;
time = [15,0];
P = P_F(F,r,time);
disp(P)
