f = @(x) exp(-1.*x).*cos(3.*x);
a = 0;
b = 2;
ns = [6,6^2,6^3,6^4,6^5];
actual = 0.07566107555324405;

errs = [];
for i=1:5
    err = abs(actual - SimpsonIntg(f,a,b,ns(i),1));
    errs = [errs err];
end

errs2 = [];
for i=1:5
    err2 = abs(actual - SimpsonIntg(f,a,b,ns(i),2));
    errs2 = [errs2 err2];
end

loglog(ns,errs)
hold on
loglog(ns, errs2)
hold off
sl = @(x) x.^(-4);
ys = sl(ns);
hold on
loglog(ns,ys,'--')
hold off
xlabel('n', 'Interpreter', 'latex')
ylabel('error')
title('loglog of n vs error','Interpreter', 'latex')
legend('which=1','which=2', 'slope = -4')
saveas(gcf,'4.png')