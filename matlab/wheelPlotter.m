function wheelPlotter(slope_param, wheel_param, init_state)

init_ang = init_state(1)
init_vel = init_state(2)

slope_ang = slope_param(2);
l = wheel_param(1);
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

    function x_com, y_com = foot2com(x_foot, y_foot)
        x_com = x_foot - l*cos(init_ang)
        y_com = y_foot + l*sin(init_ang)
    end

% plot the wheel
x_slope = slope_param(1); % slope run
h_slope = yPoint(x_slope); % slope rise
h_plot = h_slope + wheel_param(1)*1.5;

scaling = 1000;

f = figure;
f.Position(3:4) = scaling*[x_slope h_plot];
plot([0, x_slope], [0, h_slope], "LineWidth", 1, "Color", [1.0, 0.5,0.5]);
axis([0 x_slope 0 h_plot]); 
hold on;
% axis equal;

% Start simulation
% point of initial contact
% s is the variable along the slope starting at origin
% x is the horiontal run from the origin
% y is the vertical rise from the origin

s_plot = cart2slope(x_slope, h_slope)
s_init = s_plot - l*sin(spoke_ang)/sin(pi/2 - spoke_ang/2)
p_init = slope2cart(s_init)

plot(p_init(1), p_init(2), "bo")

plot()

end