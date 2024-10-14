function event = collisionEvent(t, y)
global collision_angle;
% if y(2)>=0
%     event(1) =  y(1) - collision_angle;
%     event(2) =  y(1) - collision_angle;
% else
%     event(1) =  y(1) + collision_angle;
%     event(2) =  y(1) + collision_angle;
% end

event =  y(1) - collision_angle;
% event(2) =  y(1) + collision_angle;

end