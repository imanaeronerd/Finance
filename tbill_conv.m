function price = tbill_conv(str,fv)
% This function converts the price of a tbill between 32nd and decimal.

% Inputs
% input: A string with the current price format.
% fv: The face value of the tbill.
% format: 'decimal' to convert to decimal.

% Outputs
% price: The price of the tbill.

% Code

% From 32nd to decimal
mult = fv/100;
if length(str) == 5;
a = str2double(str(1:2));
b = str2double(str(4:5));
price = (a + b/32)*mult;
elseif length(str) == 6;
a = str2double(str(1:3));
b = str2double(str(5:6));
price = (a + b/32)*mult;
elseif length(str) == 4;;
a = str2double(str(1));
b = str2double(str(3:4));
price = (a + b/32)*mult;    
end
end
