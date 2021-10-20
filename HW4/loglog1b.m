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
loglog(n, errs)
title('loglog of Errors vs n')
xlabel('log(n)')
ylabel('log(error)')
saveas(gcf, '1b.png')