# Prevent Octave from thinking that this
# is a function file:
1;
clear
format long
output_precision(16)

function Ei = errorBisection (Ei_1)
  Lambda = 1/2
  order = 1
  Ei = Lambda*Ei_1.^order;  
endfunction

function Ei = errorFixedPoint (gdd,Ei_1,xr)
  Lambda = abs(gdd(xr))
  order = 1
  Ei = Lambda*Ei_1.^order;  
endfunction

function Ei = errorNewton (fdd,fddd,Ei_1,xr)
  Lambda = abs(fddd(xr)/(2*fdd(xr)))
  order = 2
  Ei = Lambda*Ei_1.^order;  
endfunction

methodNumber = 3; #1: bisection, #2: fixed point, #3: Newton

#function
f=@(x) x^3-4*x^2-11*x+30 #=0
fdd=@(x) 3*x^2-8*x-11
fddd=@(x) 6*x-8
#g(x)=x
g = @(x) cbrt(2*x-3)
gdd= @(x) 2/(3*cbrt((2*x-3)^2))

xr = 2

E0=0.04

notFound=true;

if(methodNumber == 1)
  Ei = errorBisection(E0)
elseif(methodNumber == 2)
  Ei = errorFixedPoint(gdd,E0,xr)
elseif(methodNumber == 3)
  Ei = errorNewton (fdd,fddd,E0,xr)
endif

