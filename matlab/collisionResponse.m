function [stop,  y] = collisionResponse(t, y)
    stop = false;
    y(1) = -pi/6;
    y(2) = 0.9*y(2); % velocity is scaled by the vel_coeff factor

end