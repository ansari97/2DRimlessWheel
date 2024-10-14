function [stop,  y] = collisionResponse(t, y)
global n vel_coeff;
stop = false;
if y(2)>=0
    y(1) = -pi/n;
else
    y(1) = +pi/n;
end

y(2) = vel_coeff*y(2); % velocity is scaled by the vel_coeff factor

% vel_coeff
end