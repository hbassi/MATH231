function diffval = centraldiff(f,x,dx,n)
if n == 2
    diffval = (f(x + dx) - f(x - dx)) / (2 * dx);
end

if n == 4
    diffval = (-f(x+2*dx) + 8 *f(x+dx) - 8*f(x-dx) + f(x-2*dx))/(12*dx);
end

if n == 6
    diffval = (-f(x-3*dx)/60 + 3*f(x-2*dx)/20 -3*f(x-dx)/4 + 3*f(x+dx)/4 - 3*f(x+2*dx)/20 + f(x+3*dx)/60)/dx;
end