clear all; close all; clc;

% problem setup
%A= randn(6,6);
A = [100 0 0 1 2 3; 0 200 0 1 2 3; 0 0 300 0 1 2; 0 0 0 400 0 1; 0 0 0 0 500 0; 0 0 0 0 0 600];
b=randn(6,1);
x0=[0;0;0;0;0;0];
niter=10;
 
% Jacobi
%[final_sol,sols]=Jacobi(A,b,x0,niter)

% Gauss-Seidel
%[final_sol, sols] = GaussSeidel(A,b,x0,niter)
 
% residual errors
errs=[];
for i=1:niter+1
    err=norm(A*sols(:,i)-b);
    errs=[errs err];
end
errs
 
% semi-log plot
semilogy(0:niter,errs,'r-o')
xlabel("Iteration number")
ylabel("Residual error")
title('Relative residual error vs iteration number')