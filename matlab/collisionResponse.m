function [stop,  y] = collisionResponse(t, y)

    vel_coeff = 0.833;
    stop = false;
    y(1) = -pi/6;
    y(2) = vel_coeff*y(2); % velocity is scaled by the vel_coeff factor
    
    % vel_coeff
end