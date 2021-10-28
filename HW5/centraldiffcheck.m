x = 0;
f = @(x) 1 - exp(-x);
dx = 1;
actual = 1;
errs = [];
dxvals = [1,1/10,1/100,1/1000];
for i =1:4
    err = abs(actual - centraldiff(f,x,dxvals(i),2));
    errs = [errs err];
end
errs4 = [];
for i =1:4
    err = abs(actual - centraldiff(f,x,dxvals(i),4));
    errs4 = [errs4 err];
end
errs6 = [];
for i =1:4
    err = abs(actual - centraldiff(f,x,dxvals(i),6));
    errs6 = [errs6 err];
end
sl = @(x) x.^(2);
ys = sl(dxvals);
sl4 = @(x) x.^(4);
ys4 = sl4(dxvals);
sl6 = @(x) x.^(6);
ys6 = sl6(dxvals);
loglog(dxvals, errs)
hold on
loglog(dxvals,errs4)
hold off
hold on 
loglog(dxvals,errs6)
hold off
hold on
loglog(dxvals, ys)
hold off
hold on
loglog(dxvals, ys4)
hold off
hold on
loglog(dxvals, ys6)
hold off

legend('n=2','n=4','n=6','slope 2', 'slope 4', 'slope 6')