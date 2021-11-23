T = 3;
uexact = @(t) exp(t-(2/3)*t^2);
F = @(t,u) (1-(4/3)*t)*u;
[tvals4, yvals4] = RK4_1d(F, 0, 3, 1, 4);
[tvals8, yvals8] = RK4_1d(F, 0, 3, 1, 8);
figure(1)
plot(linspace(0,T),arrayfun(uexact,linspace(0,T)),'k');
hold on;
plot(tvals4,yvals4, 'b--');
hold off;
hold on;
plot(tvals8,yvals8, 'r--');
xlabel('t');
ylabel('y');
title('RK4 for Varying Values of n')
legend('Exact solution', 'n=4','n=8');
saveas(gcf, '1bi.png')

figure(2);
errs = [];
ns= 10:10:500;
for n=ns
    [tvals, yvals] = RK4_1d(F, 0, 3, 1, n);
    err = abs(uexact(T) - yvals(end));
    errs = [errs err];
end
loglog(ns, errs)
hold on;
sl = @(x) x.^(-5);
ys = sl(ns);
loglog(ns, ys);
hold off
legend('Error', 'slope = -5')
xlabel('n')
ylabel('Error')
title('Error versus Increasing Value of n')
saveas(gcf, '1bii.png')