# bracketing methods
# To solve equations of the form f(x) = 0
# Start with an interval [a0,b0]that contains a root r of f(x)=0
# The algorithm iteratively generates smaller and more precise intervals 
# that contain the root r,[ai,bi]
# Similar to the bisection algorithm but tries to generate a new interval 
# in a faster way than cutting into two equal segments	

# Prevent Octave from thinking that this
# is a function file:
1;
clear
format long
output_precision(16)

function xc = XcEstimation (a,b,f)
  xc = (a*f(b)-b*f(a))/(f(b)-f(a));
endfunction

a0=1;
b0=2;
disp(["Starting range: [", num2str(a0), ", ", num2str(b0), "]"])
TOL=0.5


f = @(x) x.^3+4*x.^2-10
i=0;
notFound=true;
disp(["   i     a       b       xi        f(a)        f(b)        f(c)        Abs error"])
while(notFound)
  #disp("")
  x0=XcEstimation(a0,b0,f);
  #disp(["Sub intervals: [", num2str(a0), ", ", num2str(x0), "] ,[", num2str(x0), ", ", num2str(b0), "]"])

  #disp("")
  fa=f(a0);
  fb=f(b0);
  fc=f(x0);
  
  #disp("")
  fafc=fa*fc;
  if(fafc<0)
    a1=a0;
    b1=x0;
    #disp(["New range: [", num2str(a1), ", ", num2str(b1), "]"])
  else
    a1=x0;
    b1=b0;
    #disp(["New range: [", num2str(a1), ", ", num2str(b1), "]"])
  endif

  relError=abs(((b0-a0)/2));
  
  disp(["   ", num2str(i),"     ", num2str(a0),"        ", num2str(b0),"        ", num2str(x0),"        ", num2str(fa),"        ", num2str(fb),"        ", num2str(fc),"        ", num2str(relError)])
  i++;
  
  if(relError<TOL)
    disp("Root found")
    notFound=false;
    x=XcEstimation(a0,b0,f)
  else
    #disp("Continue finding root")
    a0=a1;
    b0=b1;
  endif
endwhile

close()