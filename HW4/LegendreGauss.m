function intg = LegendreGauss(f,a,b,n)
[xvals,wvals] = lgwt(n,a,b);
fvals = arrayfun(f,xvals);
intg = sum(fvals.*wvals);