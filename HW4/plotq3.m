f = @(x) sqrt(abs(x));
a = -1;
b = 1;
syms x 
exactval = double(int(f(x),a,b));
n = [1,2,3,4,5,6,7,8,9,10];
errs = [];
for i=1:10
    app = LegendreGauss(f,a,b,n(i));
    err = abs(app - exactval);
    errs = [errs err];
end
errs2 = [];
for j = 1:10
    app2 = trapezoid(f,a,b,n(j));
    err2 = abs(app2-exactval);
    errs2 = [errs2 err2];
end
loglog(n, errs)
hold on
loglog(n,errs2)
hold off
title('loglog of Errors vs n using Gauss-Legendre and Trapezoid Rule')
xlabel('n')
ylabel('error')
legend('LG', 'Trapezoid')
saveas(gcf, '3.png')