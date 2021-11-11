T = 3;
uexact = @(t) exp(t-(2/3)*t^2);
F = @(t,u) (1-(4/3)*t)*u;
[tvals10, uvals10] = explicit_midpoint(F, 0, 3, 1, 10);
[tvals20, uvals20] = explicit_midpoint(F, 0, 3, 1, 20);
figure(1);
plot(linspace(0,T),arrayfun(uexact,linspace(0,T)),'k');
hold on;
plot(tvals10,uvals10, 'b--');
hold off;
hold on;
plot(tvals20,uvals20, 'r--');
xlabel('t');
ylabel('u');
title('Explicit for Varying Values of n')
legend('Exact solution', 'n=10','n=20');
figure(2);
errs = [];
ns= 10:10:500;
for n=ns
    [tvals, uvals] = explicit_midpoint(F, 0, 3, 1, n);
    err = abs(uexact(T) - uvals(end));
    errs = [errs err];
end
loglog(ns, errs)
hold on;
sl = @(x) x.^(-2);
ys = sl(ns);
loglog(ns, ys);
hold off
legend('Error', 'slope = -2')
xlabel('n')
ylabel('Error')
title('Error versus Increasing Value of n')
saveas(gcf, '3bii.png')