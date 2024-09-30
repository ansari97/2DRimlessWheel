function dydt = func(t, y, lam)
dydt = [y(1); lam^2*sin(y(1))];
end