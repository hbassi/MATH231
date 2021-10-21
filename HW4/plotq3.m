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
sl = @(x) x.^(-2);
ys = sl(n);
sl2 = @(x) x.^(-1);
ys2= sl2(n);
loglog(n, errs)
hold on
loglog(n,errs2)
hold off
hold on
loglog(n,ys,'b--')
hold off
hold on 
loglog(n,ys2, 'g--')
hold off
title('loglog of Errors vs n using Gauss-Legendre and Trapezoid Rule')
xlabel('n')
ylabel('error')
legend('LG', 'Trapezoid', 'slope of -2', 'slope of -1')
saveas(gcf, '3.png')