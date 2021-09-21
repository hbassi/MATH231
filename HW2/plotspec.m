clear all; close all; clc;

% problem setup

%Symmetric positive definite
A = [10 1 0 0 0 0; 1 20 0 0 0 0; 0 0 30 0 0 0; 0 0 0 40 0 0; 0 0 0 0 50 7; 0 0 0 0 7 60];
b=[1;2;3;4;5;6];
x0=[0;0;0;0;0;0];
niter=30;
omegas = [0.1, 0.3, 0.5, 1.1, 1.3, 1.7, 1.9];

D = diag(diag(A));
L = tril(A, -1);
U = triu(A,1);
spec_radii = [];
for i=1:length(omegas)
    BSOR = inv(D+ omegas(i) *L) * ( (1-omegas(i)) * D - omegas(i)* U);
    radius = max(abs(eig(BSOR)));
    spec_radii = [spec_radii radius];   
end
plot(omegas, spec_radii)



xlabel("$\omega$", 'Interpreter', 'latex')
ylabel("$\rho(B_{SOR})$", 'Interpreter', 'latex')
title('Spectral Radius vs $\omega$', 'Interpreter', 'latex')
saveas(gcf, 'radius_vs_omega.png')

