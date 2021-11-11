function [tvals, uvals] = explicit_midpoint(F,t0,T,u0,n)
dt = T/n;
tvals = t0:dt:T;
uvals = zeros(size(tvals));
uvals(1) = u0;
for i=1:n
    uvals(i+1) = uvals(i) + dt*F(tvals(i) + dt/2, uvals(i) + (dt/2) *F(tvals(i), uvals(i)));
end
end