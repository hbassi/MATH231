function intg = trapezoid(f,a,b,n)
dx = (b-a)/n;
xvals = linspace(a,b,n+1);
fvals = arrayfun(f,xvals);
wvals = dx*ones(size(xvals));
wvals(1) = 0.5*wvals(1);
wvals(end) = 0.5*wvals(end);
intg = sum(fvals.*wvals);