# bracketing methods
# To solve equations of the form f(x) = 0
# Start with an interval [a0,b0]that contains a root r of f(x)=0
# The algorithm iteratively generates smaller and more precise intervals 
# that contain the root r,[ai,bi]

# Prevent Octave from thinking that this
# is a function file:
1;
clear
format long
output_precision(16)
function xi = rootEstimation (a,b)
  xi = (a+b)/2;  
endfunction

a0=1;
b0=2;
disp(["Starting range: [", num2str(a0), ", ", num2str(b0), "]"])
TOL=10.^(-5)
n=((log(b0-a0)-log(TOL))/log(2))-1
iterations = ceil(n)
# det([x 1 2 3 ; 4 x 5 6; 7 8 x 9; 10 11 12 x])-10000 for matrix with diagonal x with det =1000
f = @(x) x-0.5*(sin(x)+cos(x))
i=0;
notFound=true;

 if(f(a0)*f(b0)<0)
      disp("there is a root")
  else
      disp("there may or may not be a root")
  endif

disp(["   i     a       b       xi        f(a)        f(b)        f(c)        Abs error"])
while(notFound)
  #disp("")
  x0=rootEstimation(a0,b0);
  #disp(["Sub intervals: [", num2str(a0), ", ", num2str(x0), "] ,[", num2str(x0), ", ", num2str(b0), "]"])

  #disp("")
  fa=f(a0);
  fb=f(b0);
  fx=f(x0);
  
  
  #disp("")
  fafx=fa*fx;
  if(fafx<0)
    a1=a0;
    b1=x0;
    #disp(["New range: [", num2str(a1), ", ", num2str(b1), "]"])
  else
    a1=x0;
    b1=b0;
    #disp(["New range: [", num2str(a1), ", ", num2str(b1), "]"])
  endif

  # absolute error
  absError=abs((b0-a0)/2);
  
  
  disp(["   ", num2str(i),"     ", num2str(a0),"        ", num2str(b0),"        ", num2str(x0),"        ", num2str(fa),"        ", num2str(fb),"        ", num2str(fx),"        ", num2str(absError)])
  i++;
  
  if(absError<TOL)
    disp("Root found")
    notFound=false;
    x=rootEstimation(a0,b0)
  else
    #disp("Continue finding root")
    a0=a1;
    b0=b1;
  endif
endwhile

close()