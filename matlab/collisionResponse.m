function [stop,  y] = collisionResponse(t, y)
    global n vel_coeff;
    stop = false;
    y(1) = -pi/n;
    y(2) = vel_coeff*y(2); % velocity is scaled by the vel_coeff factor
    
    % vel_coeff
end