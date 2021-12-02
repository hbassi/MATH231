F = @(t,y) (1-4/3*t)*y;
t0=0;
T=3;
y0=1;
yexact = @(t) exp(t-2/3*t^2);

ns=[10:10:100];
errs = [];
errs2 =[];
errs3 = [];
for i=1:length(ns)
    y1= yexact(t0+(T-t0)/ns(i));
    [tvals,yvals] = AB2(F,t0,T,y0,y1,ns(i));
    [tvals2,yvals2] = AB2_y1(F,t0,T,y0,ns(i),1);
    [tvals3,yvals3] = AB2_y1(F,t0,T,y0,ns(i),2);
    yexactvals=arrayfun(yexact, tvals);
    errs = [errs abs(yvals(end) - yexactvals(end))];
    errs2 = [errs2 abs(yvals2(end) - yexactvals(end))];
    errs3 = [errs3 abs(yvals3(end) - yexactvals(end))];
end


figure()
loglog(ns,errs)
hold on 
loglog(ns,errs2)
hold off
hold on 
loglog(ns,errs3)
hold off
hold on

slope = @(x) x.^(-2);
loglog(ns,slope(ns))
hold off
xlabel('n')
ylabel('Error')
title('loglog of Error versus n')
legend('AB2', 'AB2 with Euler', 'AB2 with Midpoint', 'Slope -2')
saveas(gcf,'2b.png')


