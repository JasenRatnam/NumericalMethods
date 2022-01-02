1;

#Transforms a system into a simpler one
#Replace equations by new ones obtained by multiplication and subtraction 
#of equations from the original system
#R: row of the original system
#r: row of the new transformed system
#Transform system into a upper diagonal form using forward elimination
#we want upper diagonal

#Use if 
  #If a11=0
  #If a11is small, round-off errors appear

#{
Scan all elements of the column, starting from the pivot element downwards
  Search for the largest element in absolute value
If pivot element is the largest element
  Nothing to be done
Else
  Exchange the equation with the p ivot element with the equation containing 
  the largest entry in absolute value
  Swap pivot equation with equation with largest element
#}
  
#r2<-R2-(m)R1
#r3<-R3-(m)R1

clear
format long
output_precision(16)

A=[1 -1 3;-1 0 -2; 2 2 4]    % Coefficient Matrix
b=[-3 ;1 ;0]


A = [A,b];      %produces the augmented matrix

n = length(A)-1;
%elimination process starts
for i = 1:n-1
    p = i
    %comparison to select the pivot
    for j = i+1:n
        if abs(A(j,i)) > abs(A(i,i))
          disp("Row to pivot:")
            U = A(i,:)
            A(i,:) = A(j,:)
            A(j,:) = U       
        end
    end
    %cheking for nullity of the pivots
    while A(p,i)== 0 && p <= n
        p = p+1
    end
    if p == n+1
        disp('No unique solution')
        break
    else
        if p ~= i
            T = A(i,:)
            A(i,:) = A(p,:)
            A(p,:) = T
        end
    end
    
    for j = i+1:n
        m = A(j,i)/A(i,i);
        for k = i+1:n+1 
            A(j,k) = A(j,k) - m*A(i,k);
        end
    end
end

%checking for nonzero of last entry
if A(n,n) == 0
    disp('No unique solution')
    return
end
disp("ignore lower traingle")
%backward substitution
x(n) = A(n,n+1)/A(n,n);
for i = n - 1:-1:1
    sumax = 0;
    for j = i+1:n
        sumax = sumax + A(i,j)*x(j);
    end
    x(i) = (A(i,n+1) - sumax)/A(i,i);
end
x
