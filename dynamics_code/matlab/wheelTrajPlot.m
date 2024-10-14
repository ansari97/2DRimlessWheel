function wheelTrajPlot(slope_x_length, slope_ang, l, n, sol, event_sol)

t = sol(1, :); % time vector
ang = sol(2, :); % wheel angle

collision_time = event_sol(1, :);
collision_ang = pi/n;
% collision_vel = event_sol(3, :);

spoke_ang = 2*pi/n;

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

% determine slope parameters
x_slope = slope_x_length; % slope run
y_slope = yPoint(x_slope); % slope rise
h_plot = y_slope + l*3;

scaling = 1000;

% create a separate figure
f = figure;

wheelVid = VideoWriter('wheelTraj'); %open video file
wheelVid.FrameRate = 10;  %can adjust this, 5 - 10 works well for me
open(wheelVid)
% f.Position(3:4) = scaling*[x_slope h_plot];

% determine the foot point of contact
p_contact = [x_slope y_slope]; %initialize at the top of the slope

slope_dist = sqrt(2*l^2 - 2*l^2*cos(spoke_ang)); % distance between points of contact along the slope 

len = length(ang); % length of the ang vector
for i = 1:len
    if ang(i)>0 && abs(ang(i) - collision_ang) < 0.00001
        % ang(i)
        % ang(i+1)
        % ang(i+2)
        p_contact = p_contact - slope2cart(slope_dist);
        wheelPlot(x_slope, y_slope, h_plot, slope_ang, l, n, -ang(i), p_contact);
    else
        wheelPlot(x_slope, y_slope, h_plot, slope_ang, l, n, ang(i), p_contact);
    end
    pause(0.1);

    frame = getframe(gcf); %get frame
    writeVideo(wheelVid, frame);
end
close(wheelVid)
end