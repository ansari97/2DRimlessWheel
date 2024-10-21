%{
This file contains the main code for defining the dynamics of a 2D rimless wheel moving down a slope
The normal vector to the slope defines the reference axis
%}
close all
clear
clc

slope_angle = 45;
l = 0.5;   % spoke length in m
m = 0.5;  % mass in kg
I = 0.01;  % moment of inertia about center of mass/center of wheel in kgm^2
n = 7; % spokes

init_ang = -pi/n; % initial angle
init_vel = 0.5; % initial angular velocity
init_con = [init_ang, init_vel];

stop_vel = 0.00001;

time_interval = [0 2]; % time interval for the ODE solution

solver = 'ode45';
solver_max_step = 0.1;


[sol, event_sol, frame] = wheelSimulation(slope_angle, l, m, I, n, init_con, stop_vel, time_interval, solver, solver_max_step);

% make a video
t = sol(1,:);
len = length(sol);
time_max = max(t);
time_min = min(t);

movie(frame, 1, 20);



