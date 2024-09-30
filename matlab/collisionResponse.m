function [stop,  y] = collisionResponse(t, y, vel_loss)
    stop = true;
    y(2) = vel_loss*y(2);
end