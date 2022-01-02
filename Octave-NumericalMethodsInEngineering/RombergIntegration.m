1;
clear
format long
output_precision(16)

f = @(x) 1./sqrt(x.^2+4)
a=0;
b=2*sqrt(3);
h=b-a
m=1
#2: trapozeid, 4: simpson
q=2
#every column is of order 2*i
#2 4 6 8 10

#order wanted
O=8
k = O/2

#E = @(h)(I(h)-I(2*h))/(2^q-1);

#order of q+2
#R = @(h)(2^q*I(h)-I(2*h))/(2^q-1)

#trucnation error in O(h^(q+1))

i=0;
#Rik = (4^(k-1)*Rik_1 - Ri_1k_1)/(4^(k-1)-1)

tmp = "";
while(k!=i)
    tmp = [tmp,"                 k=",num2str(i+1)];
    i++;

endwhile

disp(tmp)

i=1;
j=1;
tmp = "";
I = zeros (k, k);

while(i != k+1)
    x = linspace(a,b,m+1); 
    I(i,j) = (h/2)*(2*sum(f(x))-f(a)-f(b));
    
#    E = abs((I2-I1)/((h1/h2)^q-1));
    #tmp = [" i = ",num2str(i), "     ",num2str(I(i,j))];
    h = h/2;
    m=2*m;
    i++;
endwhile
#disp(I);

for j = 2:k
  i=j;
  while(i!=k+1)
    i;
    j;
    #disp("")
    I(i, j) = (4^(j-1)*I(i,j-1) - I(i-1,j-1))/(4^(j-1)-1);
    i++;
  end
end

disp(I)
disp("")
Result=I(k,k)

#E = (I(h)-I(2*h))/(2^q-1)
E = zeros (1,k);

j=1;
q=2;
while(j != k)
  j;
  q;
   E(j) = (I(k,j)-I(k-1,j))/(2^q-1);
   j++;
   q=2+q;
endwhile
E(k) = E(k-1);
E

disp("")
Error = E(k)
