clear all; close all; clc;

% problem setup

%Divergent case
A = [-1.0667    -0.084539      0.23235       2.2294      0.42272      0.32706;
      0.93373       1.6039      0.42639      0.33756      -1.6702       1.0826;
      0.35032     0.098348     -0.37281       1.0001      0.47163       1.0061;
      -0.029006     0.041374     -0.23645      -1.6642      -1.2128     -0.65091;
      0.18245     -0.73417       2.0237     -0.59003      0.06619      0.25706;
      -1.5651    -0.030814      -2.2584     -0.27806      0.65236     -0.94438];

%Convergent case
%A = [100 2 4 1 2 3; 1 200 1 1 2 3; 4 4 300 0 1 2; 7 1 2 400 3 1; 5 7 2 1 500 1; 0 0 0 0 0 600];
b=[1;2;3;4;5;6];
x0=[0;0;0;0;0;0];
niter=15;
 
% Jacobi
[final_solJ,solsJ] = Jacobi(A,b,x0,niter);

% Gauss-Seidel
[final_solGS, solsGS] = GaussSeidel(A,b,x0,niter);
 
%iteration matrix
D = diag(diag(A));
L = tril(A, -1);
U = triu(A, 1);

%Jacobi
it_matrixJ = -inv(D) * (L+U);

%Gauss-Seidel
it_matrixGS = -inv(D+L) * U;

% residual errors
errsJ = [];
errsGS = [];
for i=1:niter+1
    errJ=norm(A*solsJ(:,i)-b);
    errsJ=[errsJ errJ];
    errGS=norm(A*solsGS(:,i)-b);
    errsGS=[errsGS errGS];
end


spec_radiusJ = max(abs(eig(it_matrixJ)));
spec_radiusGS = max(abs(eig(it_matrixGS)));
radiiJ = [];
radiiGS = [];
for j=1:niter
    radiusJ = spec_radiusJ ^ j;
    radiiJ = [radiiJ radiusJ];
    radiusGS = spec_radiusGS ^ j;
    radiiGS = [radiiGS radiusGS];
end

% semi-log plot
semilogy(0:niter,errsJ,'r')
hold on 
semilogy(0:niter, errsGS, 'b')
hold off


%spectral radius plot
hold on
plot(1:niter, radiiJ, 'black-o')
hold off
hold on
plot(1:niter, radiiGS, 'g-o')
hold off

xlabel("Iteration number $k$", 'Interpreter', 'latex')
title('Relative residual error and spectral radius vs iteration number')
legend('Residual Errors Jacobi','Residual Errors Gauss-Seidel',  '$\rho ^ k$ Jacobi', '$\rho ^k$ Gauss-Seidel', 'Interpreter', 'latex')
saveas(gcf, 'divergent.png')

