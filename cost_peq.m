function Er_eq = cost_peq(P,D0,g)

iterations = 500;
D_cf(1) = D0;
for n = 2:iterations
    D_cf(n) = D_cf(n-1)*(1+g);
end

cf = [-P,D_cf];

Er_eq = double(irr(cf));
end
    