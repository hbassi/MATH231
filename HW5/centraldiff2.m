x = 0;
h = @(x) (x>=0);
g = @(x) (x<0);
f = @(x) ((1-exp(-x)) * h(x)) + ((exp(x) - 1) * g(x)); 

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
loglog(dxvals, errs)
hold on
loglog(dxvals,errs4)
hold off
hold on 
loglog(dxvals,errs6)
hold off


xlabel('$\Delta$ x', 'Interpreter', 'latex')
ylabel('error')
title('loglog of $\Delta$ x vs error','Interpreter', 'latex')
legend('n=2','n=4','n=6')
saveas(gcf, '2.png')
