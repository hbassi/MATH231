clear all; close all; clc;

% problem setup

%Symmetric positive definite
A = [10 1 0 0 0 0; 1 20 0 0 0 0; 0 0 30 0 0 0; 0 0 0 40 0 0; 0 0 0 0 50 7; 0 0 0 0 7 60];
b=[1;2;3;4;5;6];
x0=[0;0;0;0;0;0];
niter=30;
omegas = [0.1, 0.3, 0.5, 1.1, 1.3, 1.7, 1.9];



[final_sol1, sols1] = SOR(A,b,x0,niter,0.1);
errs1 = [];
for j=1:niter+1
    err=norm(A*sols1(:,j) -b);
    errs1 = [errs1 err];
end
semilogy(0:niter, errs1)


[final_sol2, sols2] = SOR(A,b,x0,niter,0.3);
errs2 = [];
for j=1:niter+1
    err=norm(A*sols2(:,j) -b);
    errs2 = [errs2 err];
end
hold on
semilogy(0:niter, errs2)
hold off

[final_sol3, sols3] = SOR(A,b,x0,niter,0.5);
errs3 = [];
for j=1:niter+1
    err=norm(A*sols3(:,j) -b);
    errs3 = [errs3 err];
end
hold on
semilogy(0:niter, errs3)
hold off

[final_sol4, sols4] = SOR(A,b,x0,niter,1.1);
errs4 = [];
for j=1:niter+1
    err=norm(A*sols4(:,j) -b);
    errs4 = [errs4 err];
end
hold on
semilogy(0:niter, errs4)
hold off

[final_sol5, sols5] = SOR(A,b,x0,niter,1.3);
errs5 = [];
for j=1:niter+1
    err=norm(A*sols5(:,j) -b);
    errs5 = [errs5 err];
end
hold on
semilogy(0:niter, errs5)
hold off

[final_sol6, sols6] = SOR(A,b,x0,niter,1.7);
errs6 = [];
for j=1:niter+1
    err=norm(A*sols6(:,j) -b);
    errs6 = [errs6 err];
end
hold on
semilogy(0:niter, errs6)
hold off

[final_sol7, sols7] = SOR(A,b,x0,niter,1.9);
errs7 = [];
for j=1:niter+1
    err=norm(A*sols7(:,j) -b);
    errs7 = [errs7 err];
end
hold on
semilogy(0:niter, errs7)
hold off




xlabel("Iteration number $k$", 'Interpreter', 'latex')
title('Relative residual error for differing $\omega$ vs iteration number', 'Interpreter', 'latex')
legend('$\omega = 0.1$', '$\omega = 0.3$', '$\omega = 0.5$', '$\omega = 1.1$', '$\omega = 1.3$', '$\omega = 1.7$','$\omega = 1.9$', 'Interpreter', 'latex')
%saveas(gcf, 'divergent.png')

