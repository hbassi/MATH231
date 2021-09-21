function [final_sol,sols] = SOR(A,b,x0,niter,omega)
x = x0;
n = size(A);
for k = 1:niter
    for i= 1:n
        x(i) = omega * ((b(i) - A(i, 1:i-1) * x(1:i-1) - A(i, i+1:n) * x(i+1:n))/ (A(i,i))) + (1-omega)*x(i);
    end
    sols = [sols x];
end
final_sol = sols(:,end);

