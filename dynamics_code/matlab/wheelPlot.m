function wheelPlot(x_slope, h_slope, h_plot, slope_ang, wheel_param, state, p_init)
l = wheel_param(1);
n = wheel_param(4);
spoke_ang = 2*pi/n;

% unpack state
ang = state;

% p_init = [0, 0]; % initial foot coordinates

com = p_init + l*[-sin(ang + slope_ang), cos(ang + slope_ang)];

P_feet = feetCoordinates(com, l, n, spoke_ang, slope_ang, ang);

color_val = [0.2, 0.5, 0.4];
collision_color_val = [1, 0, 0];
line_width = 4;
foot_size = 25;

% figure;

% f = figure;
% f.Position(3:4) = scaling*[x_slope h_plot];
% plot the slope
plot([0, x_slope], [0, h_slope], "LineWidth", 1, "Color", [1.0, 0.5,0.5]);

hold on;
axis equal;
axis([0 x_slope 0 h_plot]);

for i = 1:n
    if i == 1
        plot([com(1), P_feet(i, 1)], [com(2), P_feet(i, 2)], LineWidth=line_width, Color=collision_color_val);
        hold on;
        plot(P_feet(i, 1), P_feet(i, 2), Marker = ".", MarkerSize= foot_size ,Color=collision_color_val);
    else
        plot([com(1), P_feet(i, 1)], [com(2), P_feet(i, 2)], LineWidth=line_width, Color=color_val); 
        plot(P_feet(i, 1), P_feet(i, 2), Marker = ".", MarkerSize= foot_size ,Color=color_val);
    
    end
end

hold off;
end