function [tvals,yvals] = AB2_y1(F,t0,T,y0,n,opt)
if opt == 1
    [tvals,yvals] = Euler(F,t0,T,y0,n);
    y1 = yvals(2);
end
if opt == 2
    [tvals,yvals] = explicit_midpoint(F,t0,T,y0,n);
    y1 = yvals(2);
end
[tvals,yvals] = AB2(F,t0,T,y0,y1,n);
