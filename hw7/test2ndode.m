t0 = 0;
dy0 = 0;
y0 = 3;
a2 =  @(t) 1;
a1 = @(t) 1/10;
f = @(t,y) 10*sin(y);
T = 10;
[tvals50, yvals50] = solve_2nd_ode_by_RK4(a2,a1,f,t0,T,y0,dy0,50);
[tvals100, yvals100] = solve_2nd_ode_by_RK4(a2,a1,f,t0,T,y0,dy0,100);
[tvals200, yvals200] = solve_2nd_ode_by_RK4(a2,a1,f,t0,T,y0,dy0,200);

plot(tvals50, yvals50(:,1))
hold on 
plot(tvals100, yvals100(:,1))
hold off
hold on
plot(tvals200, yvals200(:,1))
hold off