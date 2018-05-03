function out = objfun(x,b,k)
out = sum(min(1,b*x))-k;