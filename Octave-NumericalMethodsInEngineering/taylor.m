1;
clear
format long
output_precision(16)

order=4;
fact=factorial(0:order)
x=0;
f = @(x) exp(x);

answer = 0
for i = 0:order
  erg = 1^i / fact(i+1)
  answer = answer + erg
end

disp("");
answer = abs(answer-exp(1))