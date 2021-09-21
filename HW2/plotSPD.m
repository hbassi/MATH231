clear all; close all; clc;

% problem setup

%Symmetric positive definite
A = [1 0 0 0 0 0; 0 2 0 0 0 0; 0 0 3 0 0 0; 0 0 0 4 0 0; 0 0 0 0 5 0; 0 0 0 0 0 6];
b=[1;1;1;7;1;6];
x0=[0;0;0;0;0;0];
niter=15;
omegas = [0.1, 0.3, 0.5, 0.7, 1.1, 1.3, 1.5, 1.7, 1.9];
total_errs = [];
for i = 1:length(omegas)
    [final_sol,sols] = SOR(A,b,x0,niter,omegas(i));
    errs= [];
    for j=1:niter+1
        err=norm(A*sols(:,j)-b);
        errs=[errs err];
    end 
    total_errs = [total_errs errs];
end
plot(0:niter, total_errs(1))
for k=2:length(total_errs)
    hold on
    plot(0:niter, total_errs(k))
    hold off
end



xlabel("Iteration number $k$", 'Interpreter', 'latex')
title('Relative residual error for differing $\omega$ vs iteration number', 'Interpreter', 'latex')
%legend('Residual Errors Jacobi','Residual Errors Gauss-Seidel',  '$\rho ^ k$ Jacobi', '$\rho ^k$ Gauss-Seidel', 'Interpreter', 'latex')
%saveas(gcf, 'divergent.png')

