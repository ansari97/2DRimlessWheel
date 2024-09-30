function dydt = diffFunc(t, y, lam)
dydt = [y(2); lam^2*sin(y(1))];
end