f = @(x) exp(-x);
a = -1;
b = 1;
syms x 
exactval = double(int(f(x),a,b));
n = [1,2,3,4,5,6,7,8,9,10];
errs = [];
for i=1:10
    app = trapezoid(f,a,b,n(i));
    err = abs(app - exactval);
    errs = [errs err];
end
sl = @(x) x.^(-2);
ys = sl(n);
loglog(n, errs, 'b')
hold on
loglog(n, ys, 'r--')
hold off
title('loglog of Errors vs n')
xlabel('n')
ylabel('error')
legend('loglog', 'slope -2')
saveas(gcf, '1b.png')