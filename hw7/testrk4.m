T = 5;
F = @(t,y) [y(2), -(0.1^2 + 4)*y(1) + 2*(-0.1)*y(2)];
[tvals4, yvals4] = RK4(F, 0, 5, [1;-0.1], 10);
[tvals8, yvals8] = RK4(F, 0, 5, [1;-0.1], 20);
f1 = @(t)exp(t*(-0.1-2*1i))/2 +exp(t*(-0.1+2*1i))/2;
f2 = @(t) - exp(t*(- 1/10 - 2i))*(1/20 + 1i) - exp(t*(- 1/10 + 2i))*(1/20 - 1i);
 
hold on;
plot(tvals4,yvals4(:,1), 'b--');
hold off;
hold on;
plot(tvals8,yvals8(:,1), 'r--');
hold off;
hold on
plot(linspace(0,T),arrayfun(f1,linspace(0,T)));
hold off


xlabel('t');
ylabel('y');
title('RK4 for Varying Values of n')
legend('n=10','n=20','True');
saveas(gcf, '2b1.png')