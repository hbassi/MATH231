F = @(t,u) (2*u-18*t)/(1+t);
uexact = @(t) - 5*t^2 + 8*t + 4;
[tvals100, uvals100] = Euler(F,0,2, 4, 100);
[tvals200, uvals200] = Euler(F,0,2, 4, 200);
[tvals500, uvals500] = Euler(F,0,2, 4, 500);
[tvals1000, uvals1000] = Euler(F,0,2, 4, 1000);

uvals100(end)
uvals200(end)
uvals500(end)
uvals1000(end)
uexact(2)