function [tvals, uvals] = Euler(F,t0,T,u0,n)
dt = T/n;
tvals = t0:dt:T;
uvals = zeros(size(tvals));
uvals(1) = u0;
for i=1:n
    uvals(i+1) = uvals(i) + dt*F(tvals(i), uvals(i));
end
end