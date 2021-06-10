%% LRM Learning
x = random('normal',5,2,[1,100]);
y = random('normal',5,2,[1,100]);
ds = table(x,y);

% 
mdl = fitlm(ds,'ResponseVar','x');