f = @(x) exp(-x);
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
for i=1:10
    app = trapezoid(f,a,b,n(i));
    err = abs(app - exactval);
    errs2 = [errs2 err];
end
sl = @(x) x.^(-2);
ys = sl(n);
loglog(n, errs, 'k')
hold on
loglog(n, errs2, 'r')
hold off
hold on 
loglog(n,ys, 'g--')
hold off
title('loglog of Errors vs n using Gauss-Legendre')
xlabel('n')
ylabel('error')
legend('LG', 'Trapezoid','slope of -2')
saveas(gcf, '2b.png')