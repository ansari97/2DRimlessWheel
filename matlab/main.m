%{
This file contains the main code for defining the dynamics of a 2D rimless wheel moving down a slope
%}

% Dependencies


% % Define paramaters
%  Slope
slope_angle = 2;  % degrees
slope_angle = deg2rad(slope_angle);  % angle in radians

%  Wheel
l = 0.015;   % leg length in m
m = 2;  % mass in kg
I = 1;  % moment of inertia about center of mass/center of wheel in kgm^2
n = 8; % spokes

J = I/(2*m*l^2);

lam = 1/(2*J+1);

%  initial conditions
init_ang = 0.1;
init_vel = 0.2;
init_con = [init_ang, init_vel];

% len(init_con)


    

[t, y] = ode45(@(t,y) func(t,y, lam), [0, 10], init_con);

% y_sol = solution.y

% print(y_sol)

plot(t, y(:, 1))
% plot.show





