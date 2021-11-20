T = 3;
F = @(t,y) [y(2), -(0.1^2 + 4)*y(1) + 2*(-0.1)*y(2)];
[tvals4, yvals4] = RK4(F, 0, 5, [1;-0.1], 20);
[tvals8, yvals8] = RK4(F, 0, 5, [1;-0.1], 30);
hold on;
plot(tvals4,yvals4, 'b--');
hold off;
hold on;
plot(tvals8,yvals8, 'r--');
xlabel('t');
ylabel('y');
title('RK4 for Varying Values of n')
legend('n=4','n=8');
saveas(gcf, '2b.png')