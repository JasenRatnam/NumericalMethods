1;

#Transforms a system into a simpler one
#Replace equations by new ones obtained by multiplication and subtraction 
#of equations from the original system
#R: row of the original system
#r: row of the new transformed system
#Transform system into a upper diagonal form using forward elimination
#we want upper diagonal

#r2<-R2-(m)R1
#r3<-R3-(m)R1
clear
format long
output_precision(16)

A=[3 5 2; 9 18 12; 21 41 34]    % Coefficient Matrix
b=[4;1;-3;4]


n = length(A)
for j = 1:(n-1)
    for i = n:-1:j+1
        m = A(i,j)/A(j,j)
        A(i,:) = A(i,:) - m*A(j,:)
        b(i) = b(i) - m*b(j)
    end
end 
x = zeros(n,1);
x(n) = b(n)/A(n,n);         
for i = n-1:-1:1                    
    sum = 0;
    for j = n:-1:i+1                
        sum = sum + A(i,j)*x(j);    
    end 
    x(i) = (b(i)- sum)/A(i,i);
end 
x
