#Family of algorithms that provide a series of approximations which becomes 
#closer and closer to the solution of the equation
#Start with initial guess x0
#Generate improved guesses iteratively
#Guess of x_i of root r
#Numerical method to solve equations of the form g(x)=x
#type of open methods

#If g(x)has a positive slope
    #The evolution is a staircase

#If g(x) has a negative slope
    #The evolution is a spiral

#If the slope is low
    #The algorithm converges
    #If g(x)has a slope less than 1

#If the slope is steep
  #The algorithm diverges
  #If g(x) has a slope higher than 1

# Prevent Octave from thinking that this
# is a function file:
1;

#if it goes to inf it is not converging
clear
format long
output_precision(16)

function xi1 = nextX (xi,g)
  xi1 = g(xi);  
endfunction

function ei = relativeError (xi,xi_1)
  ei = abs(abs(xi-xi_1)/xi_1);  
endfunction

#function
f = @(x) sin(x)+exp(x)+x-4 #=0
#make to g(x)=x
g = @(x) (x+5)/(x+1)

x0=2.38;
disp(["Starting x0: ", num2str(x0)])
TOL = 10^-3
gxi=g(x0);

i=1;
notFound=true;
disp(["   i   xi       g(xi)       Rel error"])
disp([ num2str(0),"   ", num2str(x0),"         ", num2str(gxi),"        N/A"])

 xi=nextX(gxi,g);
while(notFound)

  xi=gxi;
  gxi=g(xi);
  relError = relativeError(xi,x0);
  
  disp([ num2str(i),"   ", num2str(xi),"     ", num2str(gxi),"        ", num2str(relError)])
  i++;
  
  if(relError<TOL)
    disp("Root found")
    notFound=false;
    x=xi
  else
    #disp("Continue finding root")
    x0=xi;
  endif

endwhile

close()


