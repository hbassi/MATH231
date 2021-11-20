% test_Euler.m 
T = 3;
uexact = @(t) exp(t-2/3*t^2);

figure(1);
plot(linspace(0,T),arrayfun(uexact,linspace(0,T)),'k-');
hold on;
[tvals,uvals] = Euler(T,10);
plot(tvals,uvals,'b.-'); hold on;
[tvals,uvals] = Euler(T,20);
plot(tvals,uvals,'r.-'); hold on;
legend('exact sol','n = 10','n = 20');

figure(2);
nvals = 10:10:500;
errvals = [];
for n=nvals
  [tvals,uvals] = Euler(T,n);
  errvals = [errvals abs(uvals(end)-uexact(T))];
end
loglog(nvals,errvals,'o-'); hold on;
loglog(nvals,arrayfun(@(n) 0.5/n,nvals));
legend('error','slope -1')

function [tvals,uvals] = Euler(T,n)
  % IVP
  u0 = 1;
  F = @(t,u) (1-4/3*t)*u;
  % you need to complete this routine
  delt= T/n;
  tvals = delt*(0:n);
  uvals = zeros(size(tvals));
  uvals(1) = u0;
  for i=1:n
      uvals(i+1) = uvals(i) + delt*F(tvals(i) + delt/2, uvals(i) + (delt/2)*F(tvals(i),uvals(i)));
  end
end