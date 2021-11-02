x = 0;
f = @(x) 1 - exp(-x);
actual = 1;
errs = [];
dxvals = linspace(1/10,1,10);
for i =1:10
    err = abs(actual - ((4*centraldiff(f,x,dxvals(i),2) - centraldiff(f,x,2*dxvals(i),2))/3));
    errs = [errs err];
end
errs4 = [];
for i =1:10
    err = abs(actual -((16*centraldiff(f,x,dxvals(i),4) - centraldiff(f,x,2*dxvals(i),4))/15));
    errs4 = [errs4 err];
end
errs6 = [];
for i =1:10
    err = abs(actual - ((64*centraldiff(f,x,dxvals(i),6) - centraldiff(f,x,2*dxvals(i),6))/63));
    errs6 = [errs6 err];
end
loglog(dxvals, errs)
hold on
loglog(dxvals,errs4)
hold off
hold on 
loglog(dxvals,errs6)
hold off
sl = @(x) x.^(4);
ys = sl(dxvals);
sl4 = @(x) x.^(6);
ys4 = sl4(dxvals);
sl6 = @(x) x.^(8);
ys6= sl6(dxvals);
hold on
loglog(dxvals, ys,'--')
hold off
hold on
loglog(dxvals, ys4,'--')
hold off
hold on
loglog(dxvals, ys6,'--')
hold off
xlabel('$\Delta$ x', 'Interpreter', 'latex')
ylabel('error')
title('loglog of $\Delta$ x vs error','Interpreter', 'latex')
legend('n=2','n=4','n=6', 'slope=4', 'slope=6', 'slope=8')
saveas(gcf, '3.png')
