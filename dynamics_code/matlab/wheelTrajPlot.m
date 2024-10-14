function wheelTrajPlot(slope_param, wheel_param, state, collision_events)
%{

%}

state

collision_time = collision_events(:,1);
collision_ang = collision_events(:,2)
collision_vel = collision_events(:,3);

slope_ang = slope_param(2);
l = wheel_param(1);
n = wheel_param(4);

spoke_ang = wheel_param(5);

    function y = yPoint(x)
        y = tan(slope_ang)*x;
    end

    function s = cart2slope(x, y)
        s = sqrt(x^2 + y^2);
    end

    function p = slope2cart(s)
        x = s*cos(slope_ang);
        y = s*sin(slope_ang);
        p = [x, y];
    end

    function com = foot2com(p_foot, ang)
        com = p_foot + l*[-cos(ang), sin(ang)];
    end

% plot the wheel
x_slope = slope_param(1); % slope run
h_slope = yPoint(x_slope); % slope rise
h_plot = h_slope + wheel_param(1)*3;





% axis equal;

% Start simulation
% point of initial contact
% s is the variable along the slope starting at origin
% x is the horiontal run from the origin
% y is the vertical rise from the origin
n = size(state, 1);
scaling = 1000;
f = figure;

f.Position(3: 4) = scaling*[x_slope h_plot];
p_contact = [x_slope h_slope];
slope_dist = sqrt(2*l^2 - 2*l^2*cos(wheel_param(5)))

for i = 1:n
    if abs(state(i, 1) - collision_ang(1)) < 0.00001
        state(i, 1)

        p_contact = p_contact - slope2cart(slope_dist)
    end
    
    wheelPlot(x_slope, h_slope, h_plot, slope_ang, wheel_param, state(i,1), p_contact);
    pause(0.0005);
end


end