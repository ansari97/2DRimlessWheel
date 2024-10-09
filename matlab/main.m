%{
This file contains the main code for defining the dynamics of a 2D rimless wheel moving down a slope
The normal vector to the slope defines the reference axis
%}

close all
clear
clc

% % Define paramaters
%  Slope
slope_angle = 60;  % degrees
slope_angle = deg2rad(slope_angle);  % angle in radians

%  Wheel
l = 0.10;   % spoke length in m
m = 0.05;  % mass in kg
I = 0.001;  % moment of inertia about center of mass/center of wheel in kgm^2
n = 6; % spokes

J = I/(2*m*l^2); % radius of gyration

lam = 1/(2*J+1); % lambda

spoke_angle = 2*pi/n; % angle between two spokes

% general case
collision_angle = abs(pi/n);

% Define vel_coeff coefficient
vel_coeff = (I + m*l^2*cos(spoke_angle))/(I + m*l^2);

%  initial conditions
init_ang = 0; % initial angle
init_vel = 0.3; % initial angular velocity
init_con = [init_ang, init_vel];

% len(init_con)  

% % % Differential equation
dydt = @(t,y) [y(2); sin(y(1))];

collisionEvent = @(t,y) y(1) - collision_angle;

time_interval = [0 40]; % time interval for the ODE solution

% Simpe ODE45 solver
% [t, y] = ode45(dydt, time_interval, init_con);

E = odeEvent(EventFcn=collisionEvent, ...
             Response="callback", ...
             CallbackFcn=@collisionResponse);

% create ode object
F = ode(ODEFcn=dydt,InitialValue=init_con,EventDefinition=E);

y_sol = solve(F, time_interval(1), time_interval(2), Refine=8);

y_val = y_sol.Solution;

t = y_sol.Time;
y_ang = y_val(1, :)';
y_vel = y_val(2, :)';

t_event = y_sol.EventTime

y_ang_event = y_sol.EventSolution(1,:)
y_vel_event = y_sol.EventSolution(2,:)

% print(y_sol)

plot(t, y_ang)
hold on
ylim([-collision_angle, collision_angle])
plot(t, collision_angle*ones(size(t)))
hold off

figure;
plot(t, y_vel)
plot.show





