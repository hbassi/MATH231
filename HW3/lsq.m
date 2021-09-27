function a = lsq(x,y,p)
%construct Vandermonde matrix
V = zeros(length(x),p+1);
for i = 1:p+1
    V(:,i) = x.^(p+1-i);
end
a = V'*V \ V' * y