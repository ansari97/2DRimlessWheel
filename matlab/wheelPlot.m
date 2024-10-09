function wheelPlot(wheel_param, state, p_init)
l = wheel_param(1);
n = 8;%wheel_param(4);
spoke_ang = 2*pi/n;

slope_ang = 0

% unpack state
ang = state(1);
vel = state(2);

p_init = [0, 0]; % initial foot coordinates

com = p_init + l*[-sin(ang + slope_ang), cos(ang + slope_ang)]

P_feet = feetCoordinates(com, l, n, spoke_ang, slope_ang, ang)

color_val = [0.2, 0.5, 0.4];
collision_color_val = [1, 0, 0];
line_width = 4;
foot_size = 25;

% figure;
for i = 1:n

    if i == 1
        plot([com(1), P_feet(i, 1)], [com(2), P_feet(i, 2)], LineWidth=line_width, Color=collision_color_val); 
        hold on;
        plot(P_feet(i, 1), P_feet(i, 2), Marker = ".", MarkerSize= foot_size ,Color=collision_color_val);
    else
        plot([com(1), P_feet(i, 1)], [com(2), P_feet(i, 2)], LineWidth=line_width, Color=color_val); 
        plot(P_feet(i, 1), P_feet(i, 2), Marker = ".", MarkerSize= foot_size ,Color=color_val);
    
    end
    axis equal;

end
hold off;
end