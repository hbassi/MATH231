T = 3;
uexact = @(t) exp(t-(2/3)*t^2);
F = @(t,u) (1-(4/3)*t)*u;
[tvals10, uvals10] = Euler(F, 0, 3, 1, 10);
[tvals20, uvals20] = Euler(F, 0, 3, 1, 20);
plot(linspace(0,T),arrayfun(uexact,linspace(0,T)),'k');
hold on;
plot(tvals10,uvals10, 'b--');
hold off;
hold on;
plot(tvals20,uvals20, 'r--');
xlabel('t');
ylabel('u');
title('Forward Euler for Varying Values of n')
legend('Exact solution', 'n=10','n=20');
saveas(gcf, '1i.png')