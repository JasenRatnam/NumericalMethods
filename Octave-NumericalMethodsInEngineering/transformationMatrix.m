1;



#{
Transformation matrix T that transforms the original matrix A into an upper diagonal matrix U
A=T-1U
U=TA
#}
  
#r2<-R2-(m)R1
#r3<-R3-(m)R1

#A = T^(-1)*U
#U = T*A
clear
format long
output_precision(16)

A=[2 5 1;6 11 1; -4 -2 3]    % Coefficient Matrix
b=[-3;3;-6]

Tinverse=[1 0 0;0 1 0; 0 0 1]

n = length(A)
for j = 1:(n-1)
    for i = n:-1:j+1
        m = A(i,j)/A(j,j)
        A(i,:) = A(i,:) - m*A(j,:)
        b(i) = b(i) - m*b(j)
        Tinverse(i,j)=m;
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
Tinverse
U=A
A=Tinverse*U
