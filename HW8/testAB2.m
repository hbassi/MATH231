F = @(t,y) (1-4/3*t)*y;
t0=0;
T=3;
y0=1;
yexact = @(t) exp(t-2/3*t^2);

n=20;
y1= yexact(t0+(T-t0)/n);
[tvals,yvals] = AB2(F,t0,T,y0,y1,n);
yexactvals=arrayfun(yexact, tvals);

figure()
plot(tvals,yvals) 
hold on
plot(tvals,yexactvals)



figure()
semilogy(tvals,(abs(yvals-yexactvals)))