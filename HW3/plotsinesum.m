xs = linspace(-2*pi, 2*pi, 100);
plot(xs, arrayfun(@(x) sinesum(5,x), xs))
hold on
plot(xs, arrayfun(@(x) sinesum(10,x), xs))
hold off
hold on
plot(xs, arrayfun(@(x) sinesum(15,x), xs))
hold off
xlabel("x")
ylabel('y')
title('Differing $n$ values for sinesum', 'Interpreter', 'latex')
legend('$n$ = 5', '$n$ = 10', '$n$ = 15', 'Interpreter', 'latex')
saveas(gcf, 'sinesum.png')