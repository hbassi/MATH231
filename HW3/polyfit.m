f = @(x) (x-4)^4 * (x-0.5)^2;
x0 = linspace(0,5,201);
y0 = arrayfun(f,x0);

plot(x0,y0,'-b', 'linewidth', 2)


m = 20;
x = 5*rand(m,1);
y = arrayfun(f,x) + 3*randn(m,1);
hold on
plot(x,y,'ok')
hold off

a = lsq(x,y,6);
pred_y = polyval(a, x0);
hold on
plot(x0, pred_y, '--r', 'linewidth', 2);
hold off
xlabel('x')
ylabel('y')
title('Fitted least squares solution')
saveas(gcf, 'polyfit.png')