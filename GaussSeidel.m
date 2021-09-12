function [final_sol, sols] = GaussSeidel(A,b,x0,niter)
x = x0;
sols = [x];
n = size(A);
for k = 1:niter
    for i=1:n
        x(i) = (b(i) - A(i, 1:i-1) * x(1:i-1) - A(i, i+1:n) * x(i+1:n))/ (A(i,i));
    end
    sols = [sols x];
end
final_sol = sols(:,end);