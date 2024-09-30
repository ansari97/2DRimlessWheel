%{
This file contains the main code for defining the dynamics of a 2D rimless wheel moving down a slope
%}

close all
clear
clc


% Dependencies


% % Define paramaters
%  Slope
slope_angle = 30;  % degrees
slope_angle = deg2rad(slope_angle);  % angle in radians

%  Wheel
l = 0.15;   % leg length in m
m = 2;  % mass in kg
I = 0.01;  % moment of inertia about center of mass/center of wheel in kgm^2
n = 5; % spokes

J = I/(2*m*l^2);

lam = 1/(2*J+1);

collision_angle = pi/n + slope_angle;

% Define vel_loss
vel_loss = 0.5;

%  initial conditions
init_ang = 0.1;
init_vel = 0.3;
init_con = [init_ang, init_vel];

% len(init_con)  

% % % Differential equation
dydt = @(t,y) [y(2); lam^2*sin(y(1))];

collisionEvent = @(t,y, collision_angle) y(1) - collision_angle;



[t, y] = ode45(dydt, [0, 10], init_con);

E = odeEvent(EventFcn=collisionEvent, ...
             Response="callback", ...
             CallbackFcn=@collisionResponse);

% y_sol = solution.y

% print(y_sol)

plot(t, y(:, 1))
hold on
ylim([0 2*pi/n])
plot(t, slope_angle + pi/n*ones(size(t)))
hold off

figure;
plot(t, y(:, 1))
% plot.show





