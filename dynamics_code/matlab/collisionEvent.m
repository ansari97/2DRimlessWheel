function event = collisionEvent(t, y)
global collision_angle;

% if velocity is +ve, return event when y(1) or ang is negative
if y(2)>=0
    collision_ang = collision_angle;
else
    collision_ang = -collision_angle;
end

event = y(1) - collision_ang;

end