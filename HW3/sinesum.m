function a = sinesum(n,x)
sum = 0;
for i=1:n
    sum = sum + (sin((2*i-1)*x)/((2*i)-1));
end
a = sum;