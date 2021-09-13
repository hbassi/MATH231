function [final_sol, sols] = Jacobi(A,b,x0,niter)
x = x0;
n = size(A);
xnew = zeros(n(1), 1);
sols = [x];
for k = 1:niter
    for i =1:n
        xnew(i) = (b(i) - A(i, 1:i-1) * x(1:i-1) - A(i, i+1:n) * x(i+1:n))/ (A(i,i));
    end
    x = xnew;
    sols = [sols x];
end
final_sol = sols(:,end);
