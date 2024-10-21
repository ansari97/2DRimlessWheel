function [stop,  y] = collisionResponse(t, y)
global n vel_coeff stop_vel;


% reset the angle
if y(2) >= 0
    y(1) = - pi/n;
else
    y(1) = + pi/n;
end

% velocity is scaled down by the vel_coeff factor
y(2) = vel_coeff*y(2); 

if abs(y(2)) < stop_vel
    stop = true;
else
    stop = false;
end

end