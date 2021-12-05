F = @(t,y) (1-4/3*t)*y;
t0=0;
T=3;
y0=1;
yexact = @(t) exp(t-2/3*t^2);

n=[10:10:40];
figure()
for i=1:length(ns)
    
    y1= yexact(t0+(T-t0)/ns(i));
    [tvals,yvals] = AB2(F,t0,T,y0,y1,ns(i));
    yexactvals=arrayfun(yexact, tvals);
    plot(tvals,yvals) 
    hold on
end
hold on
plot(tvals,yexactvals)

xlabel('t')
ylabel('y')
legend('n=10','n=20','n=30','n=40', 'True Solution')
title('AB2 for Increasing n')
saveas(gcf,'1b.png')