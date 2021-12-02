function [tvals,yvals] = AB2(F,t0,T,y0,y1,n)
h = (T-t0)/n;
tvals = t0+h*(0:n);
yvals = zeros(size(tvals));
yvals(1) = y0;
yvals(2) = y1;
for i=2:n
    yvals(i+1) = yvals(i) + (3/2)*h*F(tvals(i),yvals(i)) - (1/2) *h *F(tvals(i-1), yvals(i-1));
end
end