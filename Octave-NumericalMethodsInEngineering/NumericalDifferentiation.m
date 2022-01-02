1;
clear
format long
output_precision(16)

#Two-Point Forward Difference Formula:
#df = @(x) ((f(x+h) - f(x))/h) - (ddf(c)/2) * h

# C: number between x and x+h

#truncation error
#O = @(h) -(ddf(c)/fact(2)) * h
#O(h): Proportional to the first order of h



#Three-Point Centered Difference Formula:
#order of h^2, sensitive to round-off errors
#df = @(x) ((f(x+h) - f(x-h))/(2*h)) - (dddf(c)/6) * h.^2

#truncation error
#O = @(h) -(dddf(c)/6) * h.^2

#Total error = Truncation error + round-off error 
# = real value f'(x) -Numerical value [f'(x)]machine
#x-h <= c <= x+h
#TruncationError = df(x) - (((f(x+h) - f(x-h))/(2*h)))
#                = (dddf(c)/6) * h.^2
#                = (dddf(x)/6) * h.^2

#RoundOffError =  ((e1-e2)/(2*h))
#              =  ((2*emach)/(2*h))
#              =  ((emach)/(h))

#totalError = TruncationError + RoundOffError
#E(h)= f'(x) - [f'(x)]machine
#E = @(h) (dddf(x)/6) * h.^2 + ((emach)/(h))


#optimal value of h
#h = ((3*emach)/abs(dddf(x)))^(1/3)

#Smaller value of h ? truncation error decreases
#Smaller value of h ? round-off error increases
#True error = f(x) - h

x = 0
f = @(x) exp(x)
df = @(x) ((f(x+h) - f(x-h))/(2*h)) 
dddf = @(x) exp(x)

notFound=true;
i = 1;
TrueError = 1000;
disp(["   h     f     True Error"])

while(notFound)
  
  h = 1*10^(-i);
  fx = ((f(x+h) - f(x-h))/(2*h));
  tmp = fx-f(x);
  if(tmp<TrueError)
    TrueError = tmp;
    disp(["   ", num2str(h),"     ", num2str(fx),"        ", num2str(TrueError)])
  else
      notFound = false;
      disp(["h before round-off error takes place: ", num2str(h)])
  endif  
  
  if (tmp < 0)
      notFound = false;
      disp(["h before round-off error takes place: ", num2str(h), "\n"])
  endif
    
  i++;
endwhile

disp(["Optimal h: "])
h = ((3*10^(-16))/abs(dddf(x)))^(1/3)

close()








