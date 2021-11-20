function [tvals, yvals] = RK4_1d(F,t0,T,y0,n)
dt = T/n;
tvals = t0:dt:T;
yvals = zeros(size(tvals));
yvals(1) = y0;
for i=1:n
    k1 = dt * F(tvals(i),yvals(i));
    k2 = dt * F(tvals(i) + dt/2, yvals(i) + k1/2);
    k3 = dt * F(tvals(i) + dt/2, yvals(i) + k2/2);
    k4 = dt * F(tvals(i) + dt, yvals(i) + k3);
    yvals(i+1) = yvals(i) + (k1 + 2*k2 + 2*k3 + k4)/6;
end
end
