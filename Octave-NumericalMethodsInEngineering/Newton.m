#Family of algorithms that provide a series of approximations which becomes 
#closer and closer to the solution of the equation
#Start with initial guess x0
#Generate improved guesses iteratively
#Guess of x_i of root r
#Numerical method to solve equations of the form f(x)=0
#type of open methods

# Prevent Octave from thinking that this
# is a function file:
1;
clear
format long
output_precision(16)

function xi = rootEstimation (x,f,ffd)
  xi = x-(f(x)/ffd(x));  
endfunction

function ei = relativeError (xi,xi1)
  ei = abs(abs(xi1-xi)/xi1);  
endfunction

x0=0;
disp(["Starting x0: ", num2str(x0)])
TOL=10.^-6

f = @(x) 2.1.*x.^4+10.5.*x.^3+4.7.*x.^2+10.5.*x+2.6
ffd = @(x) 8.4.*x.^3+31.5.*x.^2+9.4.*x+10.5
i=0;
notFound=true;
disp(["   i     xi       f(xi)       f'(xi)        xi+1        Rel error"])
while(notFound)

  fxi=f(x0);
  ffdxi=ffd(x0);
  xi1=rootEstimation(x0,f,ffd);
  relError = relativeError(x0,xi1);
  
  disp(["   ", num2str(i),"     ", num2str(x0),"        ", num2str(fxi),"        ", num2str(ffdxi),"        ", num2str(xi1),"        ", num2str(relError)])
  i++;
  
  if(relError<TOL)
    disp("Root found")
    notFound=false;
    disp(["x at ", num2str(i)])
    x=xi1
  else
    #disp("Continue finding root")
    x0=xi1;
  endif

endwhile

backwardError = abs(f(x))
absoluteError = abs(f(x)/ffd(x))
disp("correct digits based on exponant of  absolute error")
close()