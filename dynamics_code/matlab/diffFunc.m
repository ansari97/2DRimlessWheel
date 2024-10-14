function dydt = diffFunc(t, y)
global slope_angle;
dydt = [y(2); sin(y(1) + slope_angle)];
end