function intgval = SimpsonIntg(f,a,b,n,which)
h = (b-a)/n;
points = a:h:b;
if which == 1
    sumt =  (h .* (f(points(1)) + 4.*sum(f(points(2:2:end))) + 2 .* sum(f(points(3:2:end-2))) + f(points(end))))./3;
end

if which == 2
    non3 = 0; div3 = 0;
    %sumt = (3*h/8)* (f(a) + 3 * sum(f(points(1:3:n-2))) + 3 * sum(f(points(2:3:n-1))) + 2 * sum(f(points(3:3:n-3))) + f(b));
    for j=1:n-1
        if mod(j,3) == 0
            div3 = div3 + f(points(j+1));
        else
            non3 = non3 + f(points(j+1));
        end
    end
    sumt = ((3*h)/8) * (f(points(1)) + 3*non3 + 2*div3 + f(points(end)));
end
intgval = sumt;