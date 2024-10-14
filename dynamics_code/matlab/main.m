%{
This file contains the main code for defining the dynamics of a 2D rimless wheel moving down a slope
The normal vector to the slope defines the reference axis
%}
close all
clear
clc

%% global variables
% these global variables are being used by the collision response function
global n vel_coeff collision_angle; % collision_stop num_collisions;

%% Define paramaters of the wheel
%  Slope
slope_angle = 50;  % degrees
slope_angle = deg2rad(slope_angle);  % angle in radians

x = 5; % dimension of the ramp base
slope_param = [x, slope_angle];

%  Wheel
l = 0.10;   % spoke length in m
m = 0.05;  % mass in kg
I = 0.001;  % moment of inertia about center of mass/center of wheel in kgm^2
n = 6; % spokes

spoke_angle = 2*pi/n; % angle between two spokes

J = I/(2*m*l^2); % radius of gyration

lam = 1/(2*J+1); % lambda

% an array of wheel parameters
wheel_param = [l m I n spoke_angle];

%% Collision event
% general case
% for downhill motion, collision angle is pi/n,
% for uphill it is -pi/n
collision_angle = abs(pi/n);

% Define velocity loss coefficient
vel_coeff = (I + m*l^2*cos(spoke_angle))/(I + m*l^2);

% Collision event equation; occurs when y(1) - colision_angle = 0
% collisionEvent = @(t,y) y(1) - collision_angle;

%%  initial conditions
init_ang = -pi/n; % initial angle
init_vel = 0.5; % initial angular velocity
init_con = [init_ang, init_vel];

%% Differential equation for the swing
dydt = @(t,y) [y(2); sin(y(1) + slope_angle)];

time_interval = [0 5]; % time interval for the ODE solution
% collision_stop = false;
% num_collisions = 5;

% Simpe ODE45 solver
% [t, y] = ode45(dydt, time_interval, init_con);

% Define ODE event
E = odeEvent(EventFcn=@collisionEvent, ...
    Direction="ascending", ...
    Response="callback", ...
    CallbackFcn=@collisionResponse);

% create ode object
F = ode(ODEFcn=dydt,InitialValue=init_con,EventDefinition=E);

% set solver options
F.Solver = "ode45";
F.SolverOptions.MaxStep = 0.1;

% Solve ODE
y_sol = solve(F, time_interval(1), time_interval(2), Refine=8);

%% Solution values
y_sol
y_val = y_sol.Solution;

t = y_sol.Time;
y_ang = y_val(1, :)';
y_vel = y_val(2, :)';

state = [y_ang, y_vel];

% Time vector when event occurs
t_event = y_sol.EventTime;

% angle and velocity when events occur
y_ang_event = y_sol.EventSolution(1,:);
y_vel_event = y_sol.EventSolution(2,:);

%% Plotting
% % print(y_sol)
% figure;
% subplot(2, 1, 1);
% plot(t, y_ang);
% hold on;
% yline(0);
% plot(t, collision_angle*ones(size(t)));
% plot(t, -collision_angle*ones(size(t)));
% 
% axis([time_interval -collision_angle*1.5, collision_angle*1.5]);
% title('Wheel Angle from normal');
% xlabel('time (s)');
% ylabel('angle (rad)');
% hold off;
% 
% subplot(2, 1, 2);
% plot(t, y_vel);
% hold on;
% yline(0);
% 
% xlim(time_interval);
% title('Angular velocity');
% xlabel('time (s)');
% ylabel('angular velocity (rad/s)');
% hold off;
% 
% phasePlot(y_ang, y_vel, collision_angle);

% wheelTrajPlot(slope_param, wheel_param, state, [t_event', y_ang_event', y_vel_event']);

