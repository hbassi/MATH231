function [tvals, yvals] = solve_2nd_ode_by_RK4(a2,a1,f,t0,T,y0,dy0,n)

F = @(t,y) [y(2) , ((-a1(t).*y(1)-f(t,y))./a2(t))];
[tvals, yvals] = RK4(F, t0, T,[y0;dy0],n);


